package edu.kh.semiproject.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.semiproject.member.model.dto.Member;
import edu.kh.semiproject.member.model.service.MemberService;


@Controller
@SessionAttributes({"loginMember"})
public class MemberController {

	
	@Autowired
	private MemberService service;
	
	
	@PostMapping("/link/login")
	public String login(Member inputMember, Model model, 
						@RequestHeader("referer") String referer,
						RedirectAttributes ra,
						@RequestParam(value="saveId", required = false) String saveId,
						HttpServletResponse resp
						) {
		
		String message = null;
		
		Member loginMember = service.login(inputMember);
		
		String path = "redirect:";
		
		if(loginMember != null) {
			path += "/link/mainLogin";
			
			model.addAttribute("loginMember", loginMember);
			
			System.out.println("loginMember::" + loginMember);
			
		} else {
			
			path += referer;
			
			ra.addFlashAttribute("message", "아이디 또는 비밀번호가 일치하지 않습니다.");
			
			
		}
		
		message = "로그인 성공";
		
		return path;
		
	}
	
	
	// 회원 가입 진행
	@PostMapping("/link/signUp")
	public String signUp(Member inputMember, 
						String[] memberAddress,
						RedirectAttributes ra ) {
		
		System.out.println("주소 : " + inputMember.getMemberAddress());
		
		if(inputMember.getMemberAddress().equals(",,")) {
			inputMember.setMemberAddress(null);
			
		}else {
			String addr = String.join("^^^", memberAddress);
			inputMember.setMemberAddress(addr);
			
		}
		
		// 회원 가입 서비스 호출
		int result = service.signUp(inputMember);
		
		String path = "redirect:";
		String message = null;
		
		if(result > 0) {
			path += "/";
			
			message = inputMember.getMemberNickname() + "님의 가입을 환영합니다.";
			
		}else {
			path += "signUp";
			
			message = "회원 가입 실패";
		}
		
		ra.addFlashAttribute("message", message);
		
		return path;
		
	}
	
	
	public String exceptionHandler(Exception e, Model model) {
		
		
		e.printStackTrace();
		
		model.addAttribute("e", e);
		
		
		return "common/error";
	}
	
	
}
package edu.kh.semiproject.mypage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.semiproject.member.model.dto.Member;
import edu.kh.semiproject.mypage.model.service.MyInfoService;

@SessionAttributes({"loginMember"})
@Controller
public class MyInfoController {
	
	@Autowired
	private MyInfoService service;
	
	
	// 프로필 페이지 이동
	@GetMapping("/profile")
	public String profile() {
		return "my_info";
	}
		
	
	// 탈퇴 페이지 이동
	@GetMapping("/withdrawal")
	public String withdrawal() {
		return "my_Info/withdrawal";
	}
	
	
	// 회원 정보 수정
	@PostMapping("/link/myInfo")
	public String updateInfo(@SessionAttribute("loginMember") Member loginMember,
							Member updateMember,
							String[] memberAddress,
							RedirectAttributes ra) {
				
		
				// 주소 하나로 합치자 (a^^^b^^^c)
				if(updateMember.getMemberAddress().equals(",,")) {
					updateMember.setMemberAddress(null);
				}else {
					// updateMember 에 주소문자열 세팅
					String addr = String.join("^^^", memberAddress);
					updateMember.setMemberAddress(addr);
				}
				
				// 로그인한 회원의 번호를 updateMember에 세팅
				updateMember.setMemberNo( loginMember.getMemberNo() );
				
				
				// DB 회원 정보 수정 (update) 서비스 호출
				int result = service.updateInfo(updateMember);
				
				String message = null;
				
				// 결과값으로 성공
				if(result > 0) {
					// -> 성공 시 Session에 로그인된 회원 정보도 수정(동기화)
					loginMember.setMemberNickname( updateMember.getMemberNickname() );
					loginMember.setMemberPhoneNum( updateMember.getMemberPhoneNum() );
					loginMember.setMemberAddress( updateMember.getMemberAddress() );
					
					message = "회원 정보 수정 성공";
					
					
				} else {
					// 실패에 따른 처리 

					message = "회원 정보 수정 실패";
					
				}
				
				ra.addFlashAttribute("message", message);
				
				return "redirect:info"; // 상대경로 (/myPage/info)
			}
	
	
	// 프로필 이미지 수정
	@PostMapping("/profile")
	public String updateProfile(
			@RequestParam("profileImage") MultipartFile profileImage // 업로드 파일
			, HttpSession session // 세션 객체
			, @SessionAttribute("loginMember") Member loginMember
			, RedirectAttributes ra // 리다이렉 시 메세지 전달
			) throws Exception{
		
		// 웹 접근 경로
		String webPath = "/resources/images/";
		
		// 실제로 이미지 파일이 저장되어야하는 서버컴퓨터 경로
		String filePath = session.getServletContext().getRealPath(webPath);
		// C:\workspace\6_Framework\boardProject\src\main\webapp\resources\images\member
		
		
		// 프로필 이미지 수정 서비스 호출
		int result = service.updateProfile(profileImage, webPath, filePath, loginMember);
		
		
		String message = null;
		if(result > 0) message = "프로필 이미지가 변경되었습니다";
		else			message = "프로필 변경 실패";
		
		ra.addFlashAttribute("message", message);
		
		return "redirect:profile";
	}
	
	
}

package edu.kh.semiproject.mypage.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.semiproject.member.model.dto.Member;
import edu.kh.semiproject.mypage.model.service.MyInfoService;

@SessionAttributes({"loginMember"})
@Controller
public class MyInfoController {
	
	
	@Autowired
	private MyInfoService service;
	
	
	/** 회원 정보 수정
	 * @param loginMember
	 * @param updateMember
	 * @param memberAddress
	 * @param ra
	 * @return
	 */
	@PostMapping("/link/myInfoUpdate")
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
					
					loginMember.setMemberPw( updateMember.getMemberPw() );
					loginMember.setMemberName( updateMember.getMemberName() );
					loginMember.setMemberNickname( updateMember.getMemberNickname() );
					loginMember.setMemberAddress( updateMember.getMemberAddress() );
					loginMember.setMemberEmail( updateMember.getMemberEmail() );
					loginMember.setMemberPhoneNum( updateMember.getMemberPhoneNum() );
					
					
					message = "회원 정보 수정 성공";
					
				} else {
					// 실패에 따른 처리 

					message = "회원 정보 수정 실패";
					
				}
				
				ra.addFlashAttribute("message", message);
				
				System.out.println("회원 정보 수정 성공");
				
				return "redirect:myInfo";
			}
	
	
	/** 프로필 사진 수정
	 * @param profileImage
	 * @param session
	 * @param loginMember
	 * @param ra
	 * @return
	 * @throws Exception
	 */
	@PostMapping("/link/myInfo")
	public String updateProfile(
			@RequestParam("profileImage") MultipartFile profileImage // 업로드 파일
			, HttpSession session // 세션 객체
			, @SessionAttribute("loginMember") Member loginMember
			, RedirectAttributes ra // 리다이렉트 시 메세지 전달
			) throws Exception{
		
		// 웹 접근 경로
		String webPath = "/resources/images/profile/";
		
		// 실제로 이미지 파일이 저장되어야하는 서버컴퓨터 경로
		String filePath = session.getServletContext().getRealPath(webPath);
		// C:\workspace\6_Framework\boardProject\src\main\webapp\resources\images\profile\
		
		System.out.println("filePath::" + filePath);
		
		// 프로필 이미지 수정 서비스 호출
		int result = service.updateProfile(profileImage, webPath, filePath, loginMember);
		
		
		String message = null;
		if(result > 0) message = "프로필 이미지가 변경되었습니다";
		else			message = "프로필 변경 실패";
		
		ra.addFlashAttribute("message", message);
		
		System.out.println("프로필 수정 완료");
		
		return "redirect:myInfo";
	}
	
	
	/** 회원 탈퇴
	 * @param memberPw
	 * @param loginMember
	 * @param status
	 * @param resp
	 * @param ra
	 * @return
	 */
	@PostMapping("/link/withdrawal")
	public String withdrawal(String memberPw
			,@SessionAttribute("loginMember") Member loginMember
			,SessionStatus status
			,HttpServletResponse resp
			,RedirectAttributes ra) {
		
		// String memberPw : 입력한 비밀번호
		// SessionStatus status : 세션 관리 객체
		// HttpServletResponse resp : 서버 -> 클라이언트 응답하는 방법 제공 객체
		// RedirectAttributes ra : 리다이렉트 시 request로 값 전달하는 객체
		
		// 1. 로그인한 회원의 회원 번호 얻어오기
		// @SessionAttribute("loginMember") Member loginMember
		int memberNo = loginMember.getMemberNo();
		
		
		System.out.println("회원 탈퇴 서비스 호출");
		// 2. 회원 탈퇴 서비스 호출
		//	- 비밀번호가 일치하면 MEMBER_DEL_FL -> 'Y'로 바꾸고 1 반환
		//  - 비밀번호가 일치하지 않으면 -> 0 반환
		int result = service.withdrawal(memberPw, memberNo);
		
		String path = "redirect:";
		String message = null;
		
		
		// 3. 탈퇴 성공 시
		if(result > 0) {
			// - message : 탈퇴 되었습니다
			message = "탈퇴 되었습니다";
			
			// - 메인 페이지로 리다이렉트
			path += "/";
			
			// - 로그아웃 
			status.setComplete();
			
			// + 쿠키 삭제
			Cookie cookie = new Cookie("saveId", ""); 
			// 같은 쿠기가 이미 존재하면 덮어쓰기된다
			
			cookie.setMaxAge(0); // 0초 생존 -> 삭제
			cookie.setPath("/"); // 요청 시 쿠기가 첨부되는 경로
			resp.addCookie(cookie); // 요청 객체를 통해서 클라이언트에게 전달
									// -> 클라이언트 컴퓨터에 파일로 생성
			
		}
		
		// 4. 탈퇴 실패 시
		else {
			// - message : 현재 비밀번호가 일치하지 않습니다
			message = "현재 비밀번호가 일치하지 않습니다";
			
			// - 회원 탈퇴 페이지로 리다이렉트
			path += "withdrawal";
		}
		
		ra.addFlashAttribute("message",message);
		
		System.out.println("회원 탈퇴 완료");
		
		return path;
	}
	
	
	// 비밀번호 이메일 인증 회원 조회
	@PostMapping("/link/findPassword")
	public String findPassword(String memberEmail
			,RedirectAttributes ra
			,Model model
			,@RequestHeader(value = "referer") String referer
			) {
		
		Member member = new Member();
		
		member.setMemberEmail(memberEmail);
		
		String path = "redirect:";
		String message = "";
		
		int result = service.selectMember(member);
		
		model.addAttribute(memberEmail);
		
		if( result > 0 ) {
			
			model.addAttribute("member", member);
			path = "/swc/new_password";
			
		}else {
			message = "일치하는 회원 정보가 없습니다.";
			path = "redirect:" + referer;
		}
		
		ra.addFlashAttribute("message",message);
		
		System.out.println("비밀번호찾기 이메일 인증 완료");
		
		return path;
		
	}
	
	
	// 새 비밀번호 설정
	@PostMapping("/link/newPassword")
	public String newPassword(String memberEmail
			,String newMemberPw
			,@RequestHeader(value = "referer") String referer
			,RedirectAttributes ra) {
		
		System.out.println("new비번");
		
		Member member = new Member();
		
		String path = "redirect:";
		String message = null;
		
		member.setMemberEmail(memberEmail);
		member.setMemberPw(newMemberPw);
		
		System.out.println(newMemberPw);
		
		int result = service.newPassword(member);
		
		System.out.println(result);
		
		if(result > 0) { // 변경 성공
			message = "비밀번호가 변경 되었습니다.";
			path += "/";
			
		}else { // 변경 실패
			message = "현재 비밀번호가 일치하지 않습니다.";
			path += referer;
		}
		
		ra.addFlashAttribute("message", message);
		
		System.out.println("새 비밀번호 설정 완료");
		
		return path;
	}
	
	
	
}

package edu.kh.semiproject.notice.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileUploadException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.semiproject.member.model.dto.Member;
import edu.kh.semiproject.notice.model.dto.Notice;
import edu.kh.semiproject.notice.model.service.NoticeService2;

@Controller
@RequestMapping("/notice2")
@SessionAttributes("{loginMember}")
public class NoticeController2 { // 삽입, 수정, 삭제 구현

	@Autowired
	private NoticeService2 service;
	
	// 게시글 작성 화면 전환
	@GetMapping("/insert")
	public String noticeInsert() {
		
		return "cje/notice_writing";
	}
	
	// 게시글 삽입
	@PostMapping("insert")
	public String noticeInsert(
			Notice notice,
			@RequestParam(value="noticeImage", required = false) MultipartFile noticeImage,
			@SessionAttribute("loginMember") Member loginMember,
			RedirectAttributes ra,
			HttpSession session)  throws IllegalStateException, IOException, FileUploadException {
		
		// 1. 로그인한 회원번호를 얻어와 notice에 셋팅
		notice.setManagerNo(loginMember.getMemberNo());
		notice.setManagerNickname(loginMember.getMemberNickname());
		
		// 2. 업로드된 이미지가 실제로 서버에 저장되는 경로
		// 		+ 웹에서 요청 시 이미지를 볼 수 있는 경로(웹 접근 경로)
		String webPath = "/resources/images/notice/";
		String filePath = session.getServletContext().getRealPath(webPath);
		
		// 게시글 삽입 서비스 호출 후 삽입된 게시글 번호 반환 받기
		int noticeNo = service.noticeInsert(notice, noticeImage, webPath, filePath);
		
		// 게시글 삽입 성공 시 방금 삽입한 게시글의 상세조회 페이지로 리다이렉트
		// -> /link/noticeReadMore/{noticeNo}
		
		String message = null;
		String path = "redirect:";
		
		if(noticeNo > 0) {
			
			message = "공지사항이 등록되었습니다.";
			path += "/link/noticeReadMore/" + noticeNo;
		}else {
			
			message = "공지사항 등록 실패!";
			path += "insert";			
		}
		
		ra.addFlashAttribute("message", message);
		return path;
		
	}
	
	
	
	
	// 게시글 삭제
	// /notice2/noticeReadMore/70/delete
	@GetMapping("/noticeReadMore/{noticeNo}/delete")
	public String noticeDelete(
			@PathVariable("noticeNo") int noticeNo,
			RedirectAttributes ra) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("noticeNo", noticeNo);
		
		int result = service.noticeDelete(map);
		
		String message = null;
		String path = "redirect:";
		
		if(result > 0) {
			
			message = "공지사항이 삭제되었습니다";
			path += "/link/noticeList";
		}else {
			
			message = "삭제 실패";
			path += "/link/noticeReadMore/"+ noticeNo;
		}
		
		ra.addFlashAttribute("message", message);
		return path;
	}
	
	
	
	
	
}

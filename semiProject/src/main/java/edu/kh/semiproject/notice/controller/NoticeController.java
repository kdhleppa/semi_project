package edu.kh.semiproject.notice.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.semiproject.member.model.dto.Member;
import edu.kh.semiproject.notice.model.dto.Notice;
import edu.kh.semiproject.notice.model.service.NoticeService;

@SessionAttributes({"loginMember"})
@Controller
public class NoticeController {

	@Autowired
	private NoticeService service;
	
	
	// 게시글 목록 조회
	@GetMapping("/link/noticeList")
	public String selectNoticeList(@RequestParam(value="cp", required= false, defaultValue="1") int cp,
								Model model,
								@RequestParam Map<String, Object> paramMap
							) {
				
		if(paramMap.get("key") == null ) {
			
			// 게시글 목록 조회 서비스
			Map<String, Object> map = service.selectNoticeList(cp);
			
			// 조회 결과를 request scope에 세팅 후 forward
			model.addAttribute("map", map);
			
		}else {
			
			Map<String, Object> map = service.selectNoticeList(paramMap, cp);
			
			model.addAttribute("map", map);
		}
		
		return "cje/notice_list";
	}
	
	
	// 게시글 상세 조회 
	@GetMapping("/link/noticeReadMore/{noticeNo}")
	public String noticeDetail(
			@PathVariable("noticeNo") int noticeNo,
			Model model,
			RedirectAttributes ra,
			@SessionAttribute(value="loginMember", required = false) Member loginMember,
			
			HttpServletRequest req,
			HttpServletResponse resp
			) {
		
		// 게시글 상세 조회 서비스 호출
		List<Map<String, Object>> prevNextBoard = service.noticeDetail(noticeNo);
		
		System.out.println(noticeNo);
		System.out.println("prevNextBoard::" + prevNextBoard);
		
		String path = null;		
		Notice board = null;
		
		if( prevNextBoard != null ) {
			
			path = "cje/notice_readMore";		
		
			Map<String, Object> prev = null;
			Map<String, Object> next = null;
			Map<String, Object> current = null;
						
			if(prevNextBoard.size() == 3) { // 중간 글(이전/다음 다 있을때) 클릭 시
				// 중간 글 [ 이전글, 다음글, 현재 ]
				// 맨 마지막 21 번째 글 [ 20번째 ,  현재 ]
				// 맨 처음 1 번째 글 [ 2번째 ,현재 ]

				prev = prevNextBoard.get(0);
				next = prevNextBoard.get(1);
				current = prevNextBoard.get(2);
				
				board = (Notice) current.get("board");
		
				model.addAttribute("prev", prev);
				model.addAttribute("next", next);
				model.addAttribute("current", board);
				
				
			} else if(prevNextBoard.size() == 2) {
		
				Map<String, Object> prevOrNext = prevNextBoard.get(0);
				
				current = prevNextBoard.get(1);
				
				board = (Notice) current.get("board");
				model.addAttribute("current", board);
				
				int currentNo = ((Notice)current.get("board")).getNoticeNo();
		
				int prevOrNextNo = Integer.parseInt( String.valueOf(prevOrNext.get("NOTICE_NO")) ) ;
				
				System.out.println("이전글인가 다음글인가?"+ prevOrNextNo );
				
					// 현재 글번호		// 이전 
				if( currentNo > prevOrNextNo ) {
					// 이전글
					model.addAttribute("prev", prevOrNext);
				} else {
					// 다음글
					model.addAttribute("next", prevOrNext);
				}
				
			}else {
				// 현재글
				current = prevNextBoard.get(0);
				board = (Notice) current.get("board");
				model.addAttribute("current", board);
			}
			
			//------------------------------------------------------------
			
			// 쿠키를 이용한 조회수 증가 처리
			
			// 1) 비회원(비로그인)이거나 로그인한 회원의 글이 아닌 경우에만 조회수 증가 처리
//			if(loginMember == null ||
//					loginMember.getMemberNo() != board.getManagerNo()) {
//				
//				System.out.println("loginMember::" + loginMember);				
				
				// 2) 쿠키를 얻어온다
				Cookie c = null;
				
				// 요청에 담겨있는 모든 쿠키 얻어오기
				Cookie[] cookies = req.getCookies();
				
				if(cookies != null) { // 쿠키가 존재할 경우
					
					// 쿠키 중 "readBoardNo"를 찾아서 c에 대입(향상 for문)
					for(Cookie cookie : cookies) {
						
						if(cookie.getName().equals("readBoardNo")) {
							c = cookie;
							break;
						}						
					}					
				}
				
				// 3) 기존 쿠키가 없거나(c== null)
				//		존재는 하지만 현재 게시글 번호가 쿠키에 저장되지않은 경우(해당 게시물을 본적이 없음)
				
				int result = 0;
				
				if(c == null) { // 쿠키가 없으므로 새로 생성해줘야함
					
					c = new Cookie("readBoardNo", "|" + "noticeNo" + "|");
					
					// 조회수 증가 서비스 호출
					result = service.updateReadCount(noticeNo);
					
				}else { // 해당 게시물을 본적 없음
					
					// 현재 게시글 번호가 쿠키에 있는지 확인
					if(c.getValue().indexOf("|" + noticeNo + "|") == -1) { // 현재 게시글 번호가 쿠키에 없다면
						
						// 기존값에 현재 게시글 번호 추가
						c.setValue(c.getValue() + "|" + noticeNo + "|");
						
						// 조회수 증가 서비스 호출
						result = service.updateReadCount(noticeNo);
					}
				}
//			}
			
			//------------------------------ 종료 ------------------------------
			
		}else { // 조회결과가 없을 경우 게시판 첫페이지로 이동
			
			path = "redirect:/link/noticeList";
			
			ra.addFlashAttribute("message", "해당 게시글이 존재하지 않습니다.");		
		}
		
		return path;
	}
	
}

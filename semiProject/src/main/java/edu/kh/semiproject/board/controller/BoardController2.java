package edu.kh.semiproject.board.controller;

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

import edu.kh.semiproject.board.model.dto.Board;
import edu.kh.semiproject.board.model.service.BoardService;
import edu.kh.semiproject.board.model.service.BoardService2;
import edu.kh.semiproject.member.model.dto.Member;

@Controller
@RequestMapping("/board2")
@SessionAttributes("{loginMember}")
public class BoardController2 { // 삽입, 수정, 삭제 구현
	
	@Autowired
	private BoardService2 service;
	
	// 게시글 작성 화면 전환
	@GetMapping("/insert")
	public String boardInsert() {
		
		return "cje/board_writing";
	}
	
	/** 게시글 insert
	 * @param board
	 * @param images
	 * @param loginMember
	 * @param ra
	 * @param session
	 * @return
	 * @throws IOException 
	 * @throws IllegalStateException 
	 * @throws FileUploadException 
	 */
	@PostMapping("insert")
	public String boardInsert(
			Board board,
			@RequestParam(value="boardImage", required= false) MultipartFile boardImage,
			@SessionAttribute("loginMember") Member loginMember,
			RedirectAttributes ra,
			HttpSession session) throws IllegalStateException, IOException, FileUploadException {
		
		// 1. 로그인한 회원 번호를 얻어와 board에 셋팅
		board.setMemberNo(loginMember.getMemberNo());
		board.setMemberNickname(loginMember.getMemberNickname());

		// 2. 업로드된 이미지가 서버에 실제로 저장되는 경로 
		//		+ 웹에서 요청 시 이미지를 볼 수 있는 경로(웹 접근 경로)
		String webPath = "/resources/images/board/";
		String filePath = session.getServletContext().getRealPath(webPath);
		
		// 게시글 삽입 서비스 호출 후 삽입된 게시글 번호 반환 받기
		int boardNo = service.boardInsert(board, boardImage, webPath, filePath);
		
		System.out.println("boardNo contro::"+boardNo);
		
		// 게시글 삽입 성공 시 방금 삽입한 게시글의 상세조회 페이지로 리다이렉트
		// -> /link/boardReadMore/{boardNo}
		
		String message = null;
		String path = "redirect:";
		
		if(boardNo > 0) {
			message = "게시글이 등록되었습니다.";
			path += "/link/boardReadMore/" + boardNo;
			
		}else {
			message = "게시글 등록 실패...";
			path += "insert";
		}
		
		ra.addFlashAttribute("message", message);
		
		return path;
	}
	
	
	// 게시글 삭제
	// /board2/boardReadMore/70/delete
	@GetMapping("/boardReadMore/{boardNo}/delete")
	public String boardDelete(
			@PathVariable("boardNo") int boardNo,
			RedirectAttributes ra) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardNo", boardNo);
		
		int result = service.boardDelete(map);
		
		String path = "redirect:";
		String message = null;
		
		if(result > 0) {
			
			message = "게시글이 삭제되었습니다";
			path += "/link/boardList";
		}else {
			
			message = "삭제 실패";
			path += "/link/boardReadMore/" + boardNo;
		}
		
		ra.addFlashAttribute("message", message);

		return path;
	}
	
	
	

}

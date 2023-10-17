package edu.kh.semiproject.board.controller;


import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.semiproject.board.model.service.BoardService;
import oracle.jdbc.proxy.annotation.Post;

@SessionAttributes("{loginMember}")
@Controller
public class BoardController {
	

	private BoardService service;
	
	/** 게시글 목록 조회
	 * @param boardCode
	 * @param cp
	 * @return
	 */
	@GetMapping("/{boardCode:[0-9]+}") // boardCode는 1자리 이상 숫자
	public String selectBoardList( @PathVariable("boardCode") int boardCode,
								@RequestParam(value="cp", required= false, defaultValue="1") int cp,
								Model model
							) {
		
		
		// boardCode 확인
		// System.out.println("boardCode : " + boardCode);
		
		// 게시글 목록 조회 서비스
		Map<String, Object> map = service.selectBoardList(boardCode, cp);
		
		// 조회 결과를 request scope에 세팅 후 forward
		model.addAttribute("map", map);
		
		return "board/boardList";
	}	
	

	/*@RequestMapping("/post/{boardNo}")
    public String viewPostDetails(@PathVariable int boardNo, Model model) {
        Post post = postService.getPostById(boardNo);
        model.addAttribute("post", post);
        return "postDetails"; // postDetails.jsp와 같은 뷰를 반환
    }*/

	
	
}

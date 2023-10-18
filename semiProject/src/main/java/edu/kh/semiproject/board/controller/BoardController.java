package edu.kh.semiproject.board.controller;


import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.semiproject.board.model.dto.Board;
import edu.kh.semiproject.board.model.service.BoardService;
import oracle.jdbc.proxy.annotation.Post;

@SessionAttributes("{loginMember}")
@Controller
public class BoardController {	

	@Autowired
	private BoardService service;
		
	/** 게시글 목록 조회
	 * @param boardCode
	 * @param cp
	 * @return
	 */
	@GetMapping("/link/boardList")
	public String selectBoardList(@RequestParam(value="cp", required= false, defaultValue="1") int cp,
								Model model
							) {
				
		// 게시글 목록 조회 서비스
		Map<String, Object> map = service.selectBoardList(cp);
		
		// 조회 결과를 request scope에 세팅 후 forward
		model.addAttribute("map", map);
		
		return "cje/board_list";
	}	
	

	
	
}

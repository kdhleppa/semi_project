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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.semiproject.board.model.dto.Board;
import edu.kh.semiproject.board.model.service.BoardService;
import oracle.jdbc.proxy.annotation.Post;

@SessionAttributes({"loginMember"})
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
	
	/** 게시글 상세 조회(내가 쓴 글)
	 * @param boardNo
	 * @return
	 */
	@GetMapping("/link/boardReadMoreMine/{boardNo}")
	public String boardDetailMine(@PathVariable("boardNo") int boardNo,
								Model model,
								RedirectAttributes ra) {
		
		// 게시글 상세 조회 서비스 호출
		List<Map<String, Object>> prevNextBoard = service.boardDetailMine(boardNo);
		
		System.out.println(prevNextBoard);
		
		String path = null;
		
		if( prevNextBoard != null ) {
			
			path = "cje/board_readMore_mine";
			
			
			if(prevNextBoard.size() == 3) { // 중간 글(이전/다음 다 있을때) 클릭 시
				// 중간 글 [ 이전글, 다음글, 현재 ]
				// 맨 마지막 21 번째 글 [ 20번째 ,  현재 ]
				// 맨 처음 1 번째 글 [ 2번째 ,현재 ]

				Map<String, Object> prev = prevNextBoard.get(0);
				Map<String, Object> next = prevNextBoard.get(1);
				Map<String, Object> current = prevNextBoard.get(2);
				
				Board board = (Board) current.get("board");
				
				model.addAttribute("prev", prev);
				model.addAttribute("next", next);
				model.addAttribute("current", board);
				
			} else if(prevNextBoard.size() == 2) {
				
				
				Map<String, Object> prevOrNext = prevNextBoard.get(0);
				
				Map<String, Object> current = prevNextBoard.get(1);
				Board board = (Board) current.get("board");
				model.addAttribute("current", board);
				
				int currentNo = ((Board)current.get("board")).getBoardNo();
		
				//int prevOrNextNo = (Integer)prevOrNext.get("BOARD_NO");
				int prevOrNextNo = Integer.parseInt( String.valueOf(prevOrNext.get("BOARD_NO")) ) ;
				
				System.out.println("누구세요?"+ prevOrNextNo );
				
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
				Map<String, Object> current = prevNextBoard.get(0);
				Board board = (Board) current.get("board");
				model.addAttribute("current", board);
			}
			
		}else { // 조회결과가 없을 경우 게시판 첫페이지로 이동
			
			path = "redirect:/link/boardList";
			
			ra.addFlashAttribute("message", "해당 게시글이 존재하지 않습니다.");
		
		}
		
		return path;
		
	}
	

	
	
}
package edu.kh.semiproject.board.model.service;

import java.util.List;
import java.util.Map;

import edu.kh.semiproject.board.model.dto.Board;

public interface BoardService {


	/** 게시글 목록 조회
	 * @param boardCode
	 * @param cp
	 * @return
	 */
	Map<String, Object> selectBoardList(int cp);

}

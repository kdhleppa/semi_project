package edu.kh.semiproject.board.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.semiproject.board.model.dao.BoardDAO;
import edu.kh.semiproject.board.model.dto.Board;
import edu.kh.semiproject.board.model.dto.Pagination;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDAO dao;

	/** 게시글 목록 조회
	 *
	 */
	@Override
	public Map<String, Object> selectBoardList(int cp) {
		
		// 1. 삭제되지않은 게시글 수 조회
		int listCount = dao.getListCount();
		
		// 2. 1번 조회 결과 + cp를 이용해서 Pagination 객체 생성
		// -> 내부 필드가 모두 게산되어 초기회됨
		Pagination pagination = new Pagination(listCount, cp);
		
		// 3. 현재 페이지에 해당하는 부분에 대한 게시글 목록 조회
		// 몇페이지(pagination.currentPage)에 대한 
		// 몇개(pagination.limit)인지 조회		
		List<Board> boardList = dao.selectBoardList(pagination);
		
		// 4. pagination, boardList를 Map에 담아서 반환
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("boardList", boardList);
		
		System.out.println(pagination);
		
		return map;
		
	}

	/** 게시글 상세 조회(내가 쓴 글)
 	 * 
	 */
	@Override
	public List<Map<String, Object>> boardDetailMine(int boardNo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		Board board = dao.boardDetailMine(boardNo);
		
		System.out.println("board::"  + board);
		
		List<Map<String, Object>> list = null;
		
		if(board != null) {
			list = dao.selectPrevNextBoardNo(boardNo); 
			
			System.out.println("map::"  + list);
			map.put("board", board);
			
			list.add(map);
		}
		
		return list;
	}

	/** 조회수 증가 처리 서비스
	 *
	 */
	@Override
	public int updateReadCount(int boardNo) {

		return dao.updateReadCount(boardNo);
	}
	
}

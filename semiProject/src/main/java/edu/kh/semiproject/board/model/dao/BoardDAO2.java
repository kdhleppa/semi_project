package edu.kh.semiproject.board.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.semiproject.board.model.dto.Board;
import edu.kh.semiproject.board.model.dto.BoardImage;

@Repository
public class BoardDAO2 {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 게시물 insert DAO
	 * @param board
	 * @return
	 */
	public int boardInsert(Board board) {

		int result = sqlSession.insert("boardMapper.boardInsert", board);
		
		// 삽입 성공 시
		if(result > 0) result = board.getBoardNo();
		
		return result;
	}

	/** 이미지 insert DAO
	 * @param 
	 * @return
	 */
	public int insertImage(BoardImage img) {
		return sqlSession.insert("boardMapper.insertImage", img);
	}
	
	
}

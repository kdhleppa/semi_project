package edu.kh.semiproject.board.model.dao;

import java.util.Map;

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

	/** 게시글 수정 DAO
	 * @param board
	 * @return
	 */
	public int boardUpdate(Board board) {
		
		return sqlSession.update("boardMapper.boardUpdate", board);
	}
	
	/** 이미지 삭제 DAO
	 * @param deleteMap
	 * @return
	 */
	public int imageDelete(Map<String, Object> deleteMap) {

		return sqlSession.delete("boardMapper.imageDelete", deleteMap);
	}
	

	/** 이미지 수정 DAO
	 * @param img
	 * @return
	 */
	public int imageUpdate(BoardImage img) {

		return sqlSession.update("boardMapper.imageUpdate", img);
	}

	/** 이미지 삽입 DAO
	 * @param img
	 * @return
	 */
	public int imageInsert(BoardImage img) {

		return sqlSession.insert("boardMapper.imageInsert", img);
	}

	/** 게시글 삭제
	 * @param map
	 * @return
	 */
	public int boardDelete(Map<String, Object> map) {
		
		return sqlSession.update("boardMapper.boardDelete", map);
	}

	
	
}

package edu.kh.semiproject.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.semiproject.board.model.dto.Board;
import edu.kh.semiproject.board.model.dto.Pagination;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 게시글 목록 조회 -> 삭제되지않은 게시글 수 조회
	 * @return
	 */
	public int getListCount() {
		
		return sqlSession.selectOne("boardMapper.getListCount");
	}

	/** 현재 페이지에 해당하는 부분에 대한 게시글 목록 조회
	 * @param pagination
	 * @return
	 */
	public List<Board> selectBoardList(Pagination pagination) {
		// RowBounds 객체
		// - 마이바티스에서 페이징처리를 위해 제공하는 객체
		// offset 만큼 건너뛰고
		// 그 다음 지정된 행 개수만큼 조회
		
		// 1) offset 계산(페이지 넘기기)
		int offset
			= (pagination.getCurrentPage() - 1) * pagination.getLimit();
		
		System.out.println("offset::" + offset);
		
		// 2) RowBounds 객체 생성
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		// 3) selectList("namespace.id", RowBounds) 호출
		return sqlSession.selectList("boardMapper.selectBoardList", 0, rowBounds);
	}

	/** 게시글 상세 조회(내가 쓴 글)
	 * @param boardNo
	 * @return
	 */
	public Board boardDetailMine(int boardNo) {
		
		return sqlSession.selectOne("boardMapper.selectBoardDetail", boardNo);
	}

	/** 이전 다음 게시글 번호 조회 DAO
	 * @param boardNo
	 * @return
	 */
	public List<Map<String, Object>> selectPrevNextBoardNo(int boardNo) {
	
		return sqlSession.selectList("boardMapper.selectPrevNextBoardNo", boardNo);
	}

	/** 조회수 증가 처리 DAO
	 * @param boardNo
	 * @return
	 */
	public int updateReadCount(int boardNo) {
		
		return sqlSession.update("boardMapper.updateReadCount", boardNo);
	}

	/** 검색 조건에 맞는 게시글 수 조회
	 * @param paramMap
	 * @return
	 */
	public int getListCount(Map<String, Object> paramMap) {
		
		return sqlSession.selectOne("boardMapper.getListCount_search", paramMap);
	}

	/** 게시글 목록 조회(검색)
	 * @param pagination
	 * @param paramMap
	 * @return
	 */
	public List<Board> selectBoardList(Pagination pagination, Map<String, Object> paramMap) {

		// RowBounds 객체
		// - 마이바티스에서 페이징처리를 위해 제공하는 객체
		// offset 만큼 건너뛰고
		// 그 다음 지정된 행 개수만큼 조회
		
		// 1) offset 계산(페이지 넘기기)
		int offset
			= (pagination.getCurrentPage() - 1) * pagination.getLimit();
		
		System.out.println("offset::" + offset);
		
		// 2) RowBounds 객체 생성
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		// 3) selectList("namespace.id", RowBounds) 호출
		return sqlSession.selectList("boardMapper.selectBoardList_search", paramMap, rowBounds);
	}

	/** db 이미지 목록 조회
	 * @return
	 */
	public List<String> selectImageList() {
		
		return sqlSession.selectList("boardMapper.selectImageListAll");
	}

	
}

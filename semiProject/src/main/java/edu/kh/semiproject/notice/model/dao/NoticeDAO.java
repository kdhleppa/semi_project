package edu.kh.semiproject.notice.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.semiproject.board.model.dto.Board;
import edu.kh.semiproject.board.model.dto.Pagination;
import edu.kh.semiproject.notice.model.dto.Notice;

@Repository
public class NoticeDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 게시글 목록 조회 -> 삭제되지 않은 글의 갯수 조회
	 * @return
	 */
	public int getListCount() {
	
		return sqlSession.selectOne("noticeMapper.getListCount");
	}

	/** 현재 페이지에 해당하는 부분에 대한 게시글 목록 조회
	 * @param pagination
	 * @return
	 */
	public List<Notice> selectNoticeList(edu.kh.semiproject.notice.model.dto.Pagination pagination) {
		
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
		return sqlSession.selectList("noticeMapper.selectNoticeList", 0, rowBounds);
	}

	/** 게시글 상세 조회 dao
	 * @param noticeNo
	 * @return
	 */
	public Notice noticeDetail(int noticeNo) {
		return sqlSession.selectOne("noticeMapper.noticeDetail", noticeNo);
	}

	public List<Map<String, Object>> selectPrevNextBoardNo(int noticeNo) {
		
		return sqlSession.selectList("noticeMapper.selectPrevNextBoardNo", noticeNo);
	}

	/** 조회수 증가 처리
	 * @param noticeNo
	 * @return
	 */
	public int updateReadCount(int noticeNo) {
		
		return sqlSession.update("noticeMapper.updateReadCount", noticeNo);
	}

	/** 검색 조건에 맞는 게시글 수 조회
	 * @param paramMap
	 * @return
	 */
	public int getListCount(Map<String, Object> paramMap) {

		return sqlSession.selectOne("noticeMapper.getListCount_search", paramMap);
	}

	/** 게시글 목록 조회(검색)
	 * @param pagination
	 * @param paramMap
	 * @return
	 */
	public List<Notice> selectNoticeList(edu.kh.semiproject.notice.model.dto.Pagination pagination,
			Map<String, Object> paramMap) {

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
		return sqlSession.selectList("noticeMapper.selectNoticeList_search", paramMap, rowBounds);
		
	}

	/** db 이미지 목록 조회
	 * @return
	 */
	public List<String> selectImageList() {
		
		return sqlSession.selectList("noticeMapper.selectImageListAll");
	}

	
}

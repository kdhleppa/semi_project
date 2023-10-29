package edu.kh.semiproject.notice.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.semiproject.notice.model.dto.Notice;
import edu.kh.semiproject.notice.model.dto.NoticeImage;

@Repository
public class NoticeDAO2 {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 게시글 삽입 dao
	 * @param notice
	 * @return
	 */
	public int noticeInsert(Notice notice) {

		int result = sqlSession.insert("noticeMapper.noticeInsert", notice);
		
		if(result > 0) result = notice.getNoticeNo(); 
		
		return result;
	}

	/** 이미지 삽입 doa
	 * @param img
	 * @return
	 */
	public int insertImage(NoticeImage img) {
		
		return sqlSession.insert("noticeMapper.insertImage", img);
	}

	/** 게시글 삭제 dao
	 * @param map
	 * @return
	 */
	public int noticeDelete(Map<String, Object> map) {
		
		return sqlSession.update("noticeMapper.noticeDelete", map);
		
	}
	
}

package edu.kh.semiproject.notice.model.service;

import java.util.List;
import java.util.Map;

import edu.kh.semiproject.notice.model.dto.Notice;

public interface NoticeService {

	// 게시글 목록 조회 service
	Map<String, Object> selectNoticeList(int cp);

	// 게시글 상세 조회 service
	List<Map<String, Object>> noticeDetail(int noticeNo);

	// 조회수 증가 처리
	int updateReadCount(int noticeNo);

	// 게시글 목록 조회 (검색)
	Map<String, Object> selectNoticeList(Map<String, Object> paramMap, int cp);

	/** db 이미지 목록 조회
	 * @return
	 */
	List<String> selectImageList();

	Notice selectBoard(Map<String, Object> map);

}

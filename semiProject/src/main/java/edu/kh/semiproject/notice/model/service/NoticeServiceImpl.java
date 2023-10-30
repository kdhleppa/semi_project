package edu.kh.semiproject.notice.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.semiproject.notice.model.dao.NoticeDAO;
import edu.kh.semiproject.notice.model.dto.Notice;
import edu.kh.semiproject.notice.model.dto.Pagination;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeDAO dao;

	/** 게시글 목록 조회 service
	 *
	 */
	@Override
	public Map<String, Object> selectNoticeList(int cp) {
		
		// 1. 삭제되지않은 게시글 수 조회
		int listCount = dao.getListCount();
		
		// 2. 1번 조회 결과 + cp를 이용해서 Pagination 객체 생성
		// -> 내부 필드가 모두 게산되어 초기회됨
		Pagination pagination = new Pagination(listCount, cp);
		
		// 3. 현재 페이지에 해당하는 부분에 대한 게시글 목록 조회
		// 몇페이지(pagination.currentPage)에 대한 
		// 몇개(pagination.limit)인지 조회		
		List<Notice> noticeList = dao.selectNoticeList(pagination);
		
		// 4. pagination, boardList를 Map에 담아서 반환
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("noticeList", noticeList);
		
		System.out.println(pagination);
		
		return map;
	}

	/** 게시글 상세 조회 service
	 *
	 */
	@Override
	public List<Map<String, Object>> noticeDetail(int noticeNo) {

		Map<String, Object> map = new HashMap<String, Object>();
		Notice board = dao.noticeDetail(noticeNo);

		List<Map<String, Object>> list = null;
		
		if(board != null) {
			list = dao.selectPrevNextBoardNo(noticeNo); 
			
			System.out.println("map::"  + list);
			map.put("board", board);
			
			list.add(map);
		}
		
		return list;

		
	}

	/** 조회수 증가 처리
	 *
	 */
	@Override
	public int updateReadCount(int noticeNo) {
		
		return dao.updateReadCount(noticeNo);
	}

	/** 검색 기능으로 게시글 목록 조회
	 *
	 */
	@Override
	public Map<String, Object> selectNoticeList(Map<String, Object> paramMap, int cp) {

		// 1. 삭제되지않은 게시글 수 조회
		int listCount = dao.getListCount(paramMap);
		
		// 2. 1번 조회 결과 + cp를 이용해서 Pagination 객체 생성
		// -> 내부 필드가 모두 게산되어 초기회됨
		Pagination pagination = new Pagination(listCount, cp);
		
		// 3. 현재 페이지에 해당하는 부분에 대한 게시글 목록 조회
		// 몇페이지(pagination.currentPage)에 대한 
		// 몇개(pagination.limit)인지 조회		
		List<Notice> noticeList = dao.selectNoticeList(pagination, paramMap);
		
		// 4. pagination, boardList를 Map에 담아서 반환
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("noticeList", noticeList);
		
		System.out.println(pagination);
		
		return map;
	}

	/** db 이미지 목록 조회
	 *
	 */
	@Override
	public List<String> selectImageList() {
		
		return dao.selectImageList();
	}

}

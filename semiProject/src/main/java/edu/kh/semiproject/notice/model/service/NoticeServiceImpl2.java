package edu.kh.semiproject.notice.model.service;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import org.apache.commons.fileupload.FileUploadException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.semiproject.common.utility.Util;
import edu.kh.semiproject.notice.model.dao.NoticeDAO2;
import edu.kh.semiproject.notice.model.dto.Notice;
import edu.kh.semiproject.notice.model.dto.NoticeImage;

@Service
public class NoticeServiceImpl2 implements NoticeService2{
	
	@Autowired
	private NoticeDAO2 dao;

	/** 게시글 삽입 서비스
	 * @throws IOException 
	 * @throws IllegalStateException 
	 * @throws FileUploadException 
	 *
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int noticeInsert(Notice notice, MultipartFile noticeImage, String webPath, String filePath) throws IllegalStateException, IOException, FileUploadException {

		// 1. XSS 방지 처리
		notice.setNoticeTitle(Util.XSSHandling(notice.getNoticeTitle()));
		notice.setNoticeContent(Util.XSSHandling(notice.getNoticeContent()));
		
		// 2. NOTICE 테이블 Insert하기(제목, 내용, 작성자)
		// -> noticeNo(시퀀스)반환받기
		int noticeNo = dao.noticeInsert(notice);
		
		// 3. 게시글 삽입 성공 시 
		// 업로드된 이미지가 있다면 NOTICE_IMG 테이블에 삽입하는 DAO 호출
		if(noticeNo > 0) {
			
			NoticeImage img = new NoticeImage(); // 실제 업로드된 파일 정보를 기록할 곳
			
			if(noticeImage != null) { // 업로드하려는 이미지가 있다면
				
				// img에 파일 정보를 담는다
				img.setImagePath(webPath); // 웹 접근 경로
				img.setNoticeNo(noticeNo); // 게시글 번호
				
				// 파일 원본명
				String fileName = noticeImage.getOriginalFilename();
				
				img.setImageOriginal(fileName); // 원본명
				img.setImageReName(Util.fileRename(fileName)); // 변경명
								
			}
			
			if(img != null) {
				
				// 이미지 삽입할 dao 호출
				int result = dao.insertImage(img);
				
				if( result == 1 ) { // 이미지 삽입 성공 시
					
					String rename = img.getImageReName();
					
					noticeImage.transferTo(new File(filePath + rename));
				
				}else { // 일부 또는 전체 insert 실패 시 
					
					// 예외 발생시켜 rollback하기
					throw new FileUploadException();
				}				
			}			
		}
		
		return noticeNo;
	}

	/** 게시글 삭제 서비스
	 *
	 */
	@Override
	public int noticeDelete(Map<String, Object> map) {
		
		return dao.noticeDelete(map);
	}
	
}

package edu.kh.semiproject.notice.model.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.fileupload.FileUploadException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.semiproject.board.model.dto.BoardImage;
import edu.kh.semiproject.board.model.exception.ImageDeleteException;
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
	public int noticeInsert(
			Notice notice, 
			MultipartFile noticeImage, 
			String webPath, 
			String filePath) throws IllegalStateException, IOException, FileUploadException {

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
			
			if(!noticeImage.isEmpty()) { // 업로드하려는 이미지가 있다면
				
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
	
	/** 게시글 수정 서비스
	 * @throws IOException 
	 * @throws IllegalStateException 
	 *
	 */
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int boardUpdate(
			Notice notice, 
			MultipartFile noticeImage, 
			String webPath, 
			String filePath,
			String deleteImage) throws IllegalStateException, IOException {
		
		// 1. 게시글 제목/내용만 수정
		//  1) XSS 방지 처리
		notice.setNoticeTitle(Util.XSSHandling(notice.getNoticeTitle()));
		notice.setNoticeContent(Util.XSSHandling(notice.getNoticeContent()));
		
		// 2) DAO 호출
		int rowCount = dao.boardUpdate(notice);
		
		// 2. 게시글 부분이 수정 성공했을 때
		if(rowCount > 0) {
			
			if(!deleteImage.equals("")) { // 삭제할 이미지가 있다면
				
				// 3. deleteImage에 저장된 이미지 모두 삭제
				Map<String, Object> deleteMap = new HashMap<String, Object>();
				deleteMap.put("noticeNo", notice.getNoticeNo());
				deleteMap.put("deleteImage", deleteImage);
				
				rowCount = dao.imageDelete(deleteMap);
				
				// 이미지 삭제 실패 시 전체 롤백 -> 강제 예외 발생
				if(rowCount == 0) {
					
					throw new ImageDeleteException();
				}
			}
			
			// 4. 새로 업로드된 이미지 분류 작업			
			// boardImage : 실제 파일이 담긴 곳
			
			NoticeImage img = new NoticeImage(); // 실제업로드된 파일정보 기록할 곳

			System.out.println("noticeImage::" + noticeImage);
			
			if(!noticeImage.isEmpty()) { // 업로드된 파일이 있다면	
				
				// img에 파일 정보를 담는다
				img.setImagePath(webPath); // 웹 접근 경로
				img.setNoticeNo(notice.getNoticeNo()); // 게시글 번호
				img.setImageOrder(0); // 이미지 순서
				
				// 파일 원본명
				String fileName = noticeImage.getOriginalFilename();
				
				img.setImageOriginal(fileName); // 원본명
				img.setImageReName( Util.fileRename(fileName) ); // 변경명
				
				rowCount = dao.imageUpdate(img);
				
				if(rowCount == 0 ) {
					// 수정실패 -> db에 이미지가 없었다는 뜻 -> 이미지 삽입해주면됨
					rowCount = dao.imageInsert(img);
				}
			}
			
			System.out.println("img::"+ img);
			
			// 5. img에 있는 이미지만 서버에 저장(transferTo())
			if(img != null) {
				
				int index = img.getImageOrder();
				
				String rename = img.getImageReName();
				
				noticeImage.transferTo(new File(filePath + rename));
			}
		}
		
		return rowCount;
	}
	

	/** 게시글 삭제 서비스
	 *
	 */
	@Override
	public int noticeDelete(Map<String, Object> map) {
		
		return dao.noticeDelete(map);
	}


}

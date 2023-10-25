package edu.kh.semiproject.board.model.service;

import java.io.File;
import java.io.IOException;

import org.apache.commons.fileupload.FileUploadException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.semiproject.board.model.dao.BoardDAO2;
import edu.kh.semiproject.board.model.dto.Board;
import edu.kh.semiproject.board.model.dto.BoardImage;
import edu.kh.semiproject.common.utility.Util;

@Service
public class BoardServiceImpl2 implements BoardService2{
	
	@Autowired
	private BoardDAO2 dao;

	/** 게시글 insert 서비스
	 * @throws FileUploadException 
	 * @throws IOException 
	 * @throws IllegalStateException 
	 *
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int boardInsert(Board board, MultipartFile boardImage, String webPath, String filePath) 
			throws IllegalStateException, IOException, FileUploadException {
		
		System.out.println("board::" + board);
		System.out.println("boardImage::" + boardImage);
		
		// 0. XSS 방지 처리
		board.setBoardContent( Util.XSSHandling(board.getBoardContent()) );
		board.setBoardTitle( Util.XSSHandling(board.getBoardTitle()) );
		
		// 1. BOARD 테이블 Insert하기(제목, 내용, 작성자)
		// -> boardNo(시퀀스) 반환받기
		int boardNo = dao.boardInsert(board);
		
		
		System.out.println("boardNo DAO::" + boardNo);
		// 2. 게시글 삽입 성공 시
		// 업로드된 이미지가 있다면 BOARD_IMG 테이블에 삽입하는 dao호출
		if(boardNo > 0) {
			
			
			if(boardImage != null) { // 업로드된 파일이 있다면
				
				BoardImage img = new BoardImage();
				
				// img에 파일 정보를 담아서 uploadList에 추가
				img.setImagePath(webPath); // 웹 접근 경로
				img.setBoardNo(boardNo); // 게시글 번호
				
				// 파일 원본명
				String fileName = boardImage.getOriginalFilename();
				
				img.setImageOriginal(fileName); // 원본명
				img.setImageReName( Util.fileRename(fileName) ); // 변경명
				
				int result = dao.insertImage(img);
				
				if(result == 1) { // insert 성공했다면
					
					String rename = img.getImageReName();
					
					boardImage.transferTo(new File(filePath + rename));
					
				}
				
			}else { // 일부 또는 전체 insert 실패
					
				// rollback 필요 -> 예외발생시켜 rollback하기
				throw new FileUploadException();						
			}			
		}
		
		return boardNo;
	}

}

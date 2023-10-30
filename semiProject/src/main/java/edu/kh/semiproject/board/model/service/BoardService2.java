package edu.kh.semiproject.board.model.service;

import java.io.IOException;
import java.util.Map;

import org.apache.commons.fileupload.FileUploadException;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.semiproject.board.model.dto.Board;

public interface BoardService2 {

	/** 게시글 insert 서비스
	 * @param board
	 * @param images
	 * @param webPath
	 * @param filePath
	 * @return
	 */
	int boardInsert(Board board, MultipartFile images, String webPath, String filePath) 
			throws IllegalStateException, IOException, FileUploadException;

	/** 게시글 수정 서비스
	 * @param board
	 * @param boardImage
	 * @param webPath
	 * @param filePath
	 * @param deleteImage
	 * @return
	 */
	int boardUpdate(Board board, MultipartFile boardImage, String webPath, String filePath, String deleteImage)
			 throws IllegalStateException, IOException;

	
	/** 게시글 삭제 서비스
	 * @param map
	 * @return
	 */
	int boardDelete(Map<String, Object> map);


}

package edu.kh.semiproject.board.model.service;

import java.io.IOException;

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

}

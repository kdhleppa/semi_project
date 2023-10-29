package edu.kh.semiproject.notice.model.service;

import java.io.IOException;
import java.util.Map;

import org.apache.commons.fileupload.FileUploadException;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.semiproject.notice.model.dto.Notice;

public interface NoticeService2 {

	/** 게시글 삽입
	 * @param notice
	 * @param noticeImage
	 * @param webPath
	 * @param filePath
	 * @return
	 */
	int noticeInsert(Notice notice, MultipartFile noticeImage, String webPath, String filePath)
			 throws IllegalStateException, IOException, FileUploadException ;

	/** 게시글 삭제 서비스
	 * @param map
	 * @return
	 */
	int noticeDelete(Map<String, Object> map);

}

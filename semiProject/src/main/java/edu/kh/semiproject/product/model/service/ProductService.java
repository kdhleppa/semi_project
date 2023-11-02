package edu.kh.semiproject.product.model.service;

import java.io.IOException;
import java.util.List;

import org.apache.commons.fileupload.FileUploadException;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.semiproject.product.model.dto.Product;

public interface ProductService {

	/** 방 내놓기
	 * @param product
	 * @param images
	 * @param webPath
	 * @param filePath
	 * @return
	 * @throws FileUploadException 
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	int roomUp(Product product, List<MultipartFile> images, String webPath, String filePath) throws FileUploadException, IllegalStateException, IOException;

	List<String> membersProduct(int memberNo);

	Product selectProduct(int productNo);

	int productDelete(int productNo);

	int productUpdate(Product product, List<MultipartFile> images, String webPath, String filePath, String deleteList) throws IllegalStateException, Exception;

	List<String> selectImageList();

}

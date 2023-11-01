package edu.kh.semiproject.product.model.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.fileupload.FileUploadException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.semiproject.common.utility.Util;
import edu.kh.semiproject.product.model.dao.ProductDAO;
import edu.kh.semiproject.product.model.dto.Product;
import edu.kh.semiproject.product.model.dto.RoomImg;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductDAO dao;
	
	/** 방 내놓기
	 * @throws FileUploadException 
	 * @throws IOException 
	 * @throws IllegalStateException 
	 *
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int roomUp(Product product, List<MultipartFile> images, String webPath, String filePath) throws FileUploadException, IllegalStateException, IOException {
		product.setProductContent(Util.XSSHandling(product.getProductContent()));
		product.setProductTitle(Util.XSSHandling(product.getProductTitle()));
		
		int productNo = dao.roomUp(product);
		
		
		
		
		if(productNo > 0) { // 성공시
		
			List<RoomImg> uploadList = new ArrayList<RoomImg>();
			
			for(int i=0; i<images.size(); i++) {
				if(images.get(i).getSize() >0) {
					
					RoomImg img = new RoomImg();
					img.setProductNo(productNo);
					img.setImgPath(webPath);
					img.setImgOrder(i);
					
					// 파일 원본
					String fileName = images.get(i).getOriginalFilename();
					img.setImgOriginal(fileName);
					img.setImgRename(Util.fileRename(fileName));
					
					uploadList.add(img);
					
				}
			}
			
			
			if(!uploadList.isEmpty()) {
				
				int result = dao.insertImageList(uploadList);
				System.out.println("컨트롤러 result값 : " + result);
				if(result == uploadList.size()) {
					
					for(int i = 0; i< uploadList.size(); i++) {
						
						int index = uploadList.get(i).getImgOrder();
						
						String rename = uploadList.get(i).getImgRename();
						
						images.get(index).transferTo(new File(filePath + rename));
					}
				} else {
					throw new FileUploadException();
				}
			}
			
		}
		
		return productNo;
	}
	
	@Override
	public List<String> membersProduct(int memberNo) {
		
		return dao.membersProduct(memberNo);
	}

	@Override
	public Product selectProduct(int productNo) {
		return dao.selectProduct(productNo);
	}

	@Override
	public int productDelete(int productNo) {
		return dao.productDelete(productNo);
	}

}

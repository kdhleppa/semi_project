package edu.kh.semiproject.product.model.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileUploadException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.semiproject.board.model.exception.ImageDeleteException;
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

	/** 등록 삭제
	 *
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int productDelete(int productNo) {
		return dao.productDelete(productNo);
	}

	/** 물건 수정
	 * @throws Exception 
	 * @throws IllegalStateException 
	 *
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int productUpdate(Product product, List<MultipartFile> images, String webPath, String filePath,
			String deleteList) throws IllegalStateException, Exception {
		
		product.setProductContent(Util.XSSHandling(product.getProductContent()));
		product.setProductTitle(Util.XSSHandling(product.getProductTitle()));
		
		int rowCount = dao.productUpdate(product);
		
		if(rowCount > 0) {
			if(!deleteList.equals("")) {
				Map<String, Object> deleteMap = new HashMap<String, Object>();
				deleteMap.put("productNo", product.getProductNo());
				deleteMap.put("deleteList", deleteList);
				
				rowCount = dao.imageDelete(deleteMap);
				
				if(rowCount == 0) {// 이미지 삭제 실패 시 전체 롤백
					throw new ImageDeleteException();
			}
		}
			
		List<RoomImg> uploadList = new ArrayList<>();
		
		for(int i=0 ; i<images.size(); i++) {
			
			if(images.get(i).getSize() > 0) { // 업로드된 파일이 있을 경우
				
				// BoardImage 객체를 만들어 값 세팅 후 
				// uploadList에 추가
				RoomImg img = new RoomImg();
				
				// img에 파일 정보를 담아서 uploadList에 추가
				img.setImgPath(webPath); // 웹 접근 경로
				img.setProductNo(product.getProductNo()); // 게시글 번호
				img.setImgOrder(i); // 이미지 순서
				
				// 파일 원본명
				String fileName = images.get(i).getOriginalFilename();
				
				img.setImgOriginal(fileName); // 원본명
				img.setImgRename( Util.fileRename(fileName) ); // 변경명    
				
				uploadList.add(img);
				
				// 오라클은 다중 UPDATE를 지원하지 않기 때문에
				// 하나씩 UPDATE 수행
				
				rowCount = dao.imageUpdate(img);
				
				if(rowCount == 0) {
					// 수정 실패 == DB에 이미지가 없었다 
					// -> 이미지를 삽입
					rowCount = dao.imageInsert(img);
				}
			}
		}
		
		if(!uploadList.isEmpty()) {
			for(int i=0 ; i< uploadList.size(); i++) {
				
				int index = uploadList.get(i).getImgOrder();
				
				// 파일로 변환
				String rename = uploadList.get(i).getImgRename();
				
				images.get(index).transferTo( new File(filePath + rename)  );                    
			}
		}
	}
		
		return rowCount;
	}

	/** 이미지조회(제거용)
	 *
	 */
	@Override
	public List<String> selectImageList() {
		return dao.selecctImageList();
	}

}

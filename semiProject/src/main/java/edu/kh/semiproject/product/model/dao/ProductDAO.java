package edu.kh.semiproject.product.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.semiproject.product.model.dto.Product;
import edu.kh.semiproject.product.model.dto.RoomImg;

@Repository
public class ProductDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	/** 방 내놓기
	 * @param product
	 * @return
	 */
	public int roomUp(Product product) {
		int result = sqlSession.insert("productMapper.roomUp", product); 
		System.out.println("result1 : " + result);
		if(result > 0) result = product.getProductNo();
		System.out.println("result2 : " + result);
		return result;
	}

	/** img 넣기
	 * @param uploadList
	 * @return
	 */
	public int insertImageList(List<RoomImg> uploadList) {
		return sqlSession.insert("productMapper.insertImageList", uploadList);
	}

	/** 내가올린 리스트
	 * @param memberNo
	 * @return
	 */
	public List<String> membersProduct(int memberNo) {
		return sqlSession.selectList("productMapper.membersProduct", memberNo);
	}

	/** 매물 상세 조회
	 * @param productNo
	 * @return
	 */
	public Product selectProduct(int productNo) {
		return sqlSession.selectOne("productMapper.selectProduct", productNo);
	}

	public int productDelete(int productNo) {
		return sqlSession.update("productMapper.productDelete", productNo);
	}

	public int productUpdate(Product product) {
		return sqlSession.update("productMapper.productUpdate", product);
	}

	public int imageDelete(Map<String, Object> deleteMap) {
		return sqlSession.delete("productMapper.imageDelete", deleteMap);
	}

	public int imageUpdate(RoomImg img) {
		return sqlSession.delete("productMapper.imageUpdate", img);
	}

	public int imageInsert(RoomImg img) {
		return sqlSession.delete("productMapper.imageInsert", img);
	}

	public List<String> selecctImageList() {
		
		return sqlSession.selectList("productMapper.selectImageListAll");
	}

}

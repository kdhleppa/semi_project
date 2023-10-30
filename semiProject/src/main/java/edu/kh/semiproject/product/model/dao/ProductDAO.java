package edu.kh.semiproject.product.model.dao;

import java.util.List;

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

}

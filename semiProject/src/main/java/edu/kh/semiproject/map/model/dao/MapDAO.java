package edu.kh.semiproject.map.model.dao;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.semiproject.product.model.dto.Product;

@Repository
public class MapDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	public List<Product> selectAllProduct() {
		return sqlSession.selectList("mapMapper.selectAllProduct");
	}

	
	
}

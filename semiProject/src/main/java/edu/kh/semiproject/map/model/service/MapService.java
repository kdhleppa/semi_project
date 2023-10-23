package edu.kh.semiproject.map.model.service;

import java.util.List;
import java.util.Map;

import edu.kh.semiproject.product.model.dto.Product;

public interface MapService{

	List<Product> selectAllProduct();

	List<Product> conditionSearch(Map<String, Object> map);

	
}

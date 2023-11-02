package edu.kh.semiproject.map.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import edu.kh.semiproject.map.model.dao.MapDAO;
import edu.kh.semiproject.product.model.dto.Product;

@Service
public class MapServiceImpl implements MapService{

	
	@Autowired
	private MapDAO dao;

	@Override
	public List<Product> selectAllProduct() {
		
		return dao.selectAllProduct();
	}

	@Override
	public List<Product> conditionSearch(Map<String, Object> map) {
		return dao.conditionSearch(map);
	}

	

	
	
}

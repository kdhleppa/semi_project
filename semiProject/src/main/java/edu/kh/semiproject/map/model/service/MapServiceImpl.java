package edu.kh.semiproject.map.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

	
	
	

}

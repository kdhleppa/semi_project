package edu.kh.semiproject.map.model.service;

import java.util.List;

import edu.kh.semiproject.product.model.dto.Product;

public interface MapService{

	List<Product> selectAllProduct();
/*
	List<Product> selectProductsInBounds(double southWestLat, double southWestLng, double northEastLat, double northEastLng);
*/
	
}

package edu.kh.semiproject.map.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.semiproject.map.model.service.MapService;
import edu.kh.semiproject.product.model.dto.Product;

@Controller
@SessionAttributes({"products"})
public class MapController {

	
	@Autowired
	private MapService service;
	
	@GetMapping("/link/mapMainNotLogin")
	public String MapMainNotLogin() {
		
		return "/kdh/map_main_login";
	}
	
	@GetMapping("/link/getProducts")
	@ResponseBody
	public List<Product> getProducts(Model model) {
		
		List<Product> products = service.selectAllProduct();
		model.addAttribute("products", products);
		
		return products;
	}
	/*
	@GetMapping("/link/getProductsInBounds")
	@ResponseBody
	public List<Product> getProductsInBounds(
        @RequestParam double southWestLat, @RequestParam double southWestLng,
        @RequestParam double northEastLat, @RequestParam double northEastLng, Model model) {
		
		List<Product> products = service.selectAllProduct();
		model.addAttribute("products", products);
		
		return products;
	}
	*/
}

package edu.kh.semiproject.map.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import edu.kh.semiproject.map.model.service.MapService;
import edu.kh.semiproject.product.model.dto.Product;

@Controller
public class MapController {

	
	@Autowired
	private MapService service;
	
	@GetMapping("/link/mapMainNotLogin")
	public String MapMainNotLogin() {
		
		return "/kdh/map_main_login";
	}
	
	@GetMapping("/link/getProducts")
	@ResponseBody
	public List<Product> getProducts() {
		return service.selectAllProduct();
	}
}

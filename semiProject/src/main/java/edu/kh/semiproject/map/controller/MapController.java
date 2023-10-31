package edu.kh.semiproject.map.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.semiproject.map.model.service.MapService;
import edu.kh.semiproject.product.model.dto.Product;
import oracle.jdbc.proxy.annotation.GetProxy;

@Controller
@SessionAttributes({"products"})
public class MapController {

	
	@Autowired
	private MapService service;
	
	@GetMapping("/link/mapMainNotLogin")
	public String MapMainNotLogin() {
		
		return "/kdh/map_main_not_login";
	}
	
	
	
	@GetMapping("/link/getProducts")
	@ResponseBody
	public List<Product> getProducts(
			Model model,
			String roomType,
			String productRentType,
			Integer productDeposit,
			Integer productMonthlyRent,
			HttpServletRequest request
			) {
		
		List<Product> products = new ArrayList<Product>();
		HttpSession session = request.getSession();
		
		if (roomType !=null || productRentType != null) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("roomType", roomType);
			map.put("productRentType", productRentType);
			map.put("productDeposit", productDeposit);
			map.put("productMonthlyRent", productMonthlyRent);
			products = service.conditionSearch(map);
			model.addAttribute("products", products);
		} else {
			products = service.selectAllProduct();
			model.addAttribute("products", products);
			
			System.out.println(products);
		}
		return products;
	}

	
	
}

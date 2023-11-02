package edu.kh.semiproject.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.semiproject.member.model.service.AjaxService;

@Controller
public class AjaxController {
	
	@Autowired
	private AjaxService service;

	@GetMapping("/dupCheck/email")
	@ResponseBody
	public int checkEmail(String email) {
		return service.checkEmail(email);
	}
	
	
	@GetMapping("/dupCheck/nickname")
	@ResponseBody
	public int checkNickname(String nickname) {
		return service.checkNickname(nickname);
	}
	
	@GetMapping("/dupCheck/id")
	@ResponseBody
	public int checkId(String id) {
		return service.checkId(id);
	}
	
	@GetMapping("/selectMemberId")
	@ResponseBody
	public String selectMemberId(@RequestParam("name") String name
								,@RequestParam("phoneNum") String phoneNum
			) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("phoneNum", phoneNum);
		
		return service.selectMemberId(map);
	}
	
	
}

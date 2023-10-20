package edu.kh.semiproject.member.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.kh.semiproject.member.model.service.EmailService;


@Controller
@RequestMapping("/sendEmail")
public class EmailController {
	
	@Autowired
	private EmailService service;
	
	@GetMapping("/signUpNum")
	@ResponseBody
	public int signUp(String email) {
		return service.signUpNum(email, "회원 가입");
	}
	
	@GetMapping("/checkAuthKey")
	@ResponseBody
	public int checkAuthKey(@RequestParam Map<String, Object> paramMap){

    	System.out.println(paramMap);
        
        return service.checkAuthKey(paramMap);
    }
	
}

package edu.kh.semiproject.member.model.service;

import java.util.Map;



public interface EmailService {

	int signUpNum(String email, String string);
	
	int checkAuthKey(Map<String, Object> paramMap);
 
}

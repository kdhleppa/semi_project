package edu.kh.semiproject.member.model.service;

import java.util.Map;



public interface EmailService {

	
	// 이메일로 인증번호 전송
	int signUpNum(String email, String string);
	
	
	// 인증번호 확인
	int checkAuthKey(Map<String, Object> paramMap);
 
}

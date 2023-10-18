package edu.kh.semiproject.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.kh.semiproject.member.model.dao.MemberDAO;
import edu.kh.semiproject.member.model.dto.Member;


@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO dao;
	
	BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	
	
	@Override
	public Member login(Member inputMember) {
		
		Member loginMember = dao.login(inputMember);
		
		String encPw = encoder.encode(loginMember.getMemberPw());
		
		loginMember.setMemberPw(encPw);
		
		if(encoder.matches(inputMember.getMemberPw(), loginMember.getMemberPw())) {
			
			loginMember.setMemberPw(null);
			
		} else {
			
			loginMember = null;
		}
		
		return loginMember;
	}

	
	// 회원 가입 서비스
	@Transactional
	@Override
	public int signUp(Member inputMember) {
			
		String encPw = encoder.encode(inputMember.getMemberPw());
		inputMember.setMemberPw(encPw);
			
		return dao.signUp(inputMember);
	}
	

}



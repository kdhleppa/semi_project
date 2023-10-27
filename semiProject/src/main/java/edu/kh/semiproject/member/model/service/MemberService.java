package edu.kh.semiproject.member.model.service;

import edu.kh.semiproject.member.model.dto.Member;


public interface MemberService {

	
	/** 로그인 서비스
	 * @param inputMember
	 * @return
	 */
	Member login(Member inputMember);
	
	
	/** 회원 가입 서비스
	 * @param inputMember
	 * @return
	 */
	
	int signUp(Member inputMember);

	
}

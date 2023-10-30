package edu.kh.semiproject.member.model.service;

import java.util.Map;

public interface AjaxService {
	
	/** 이메일 중복검사
	 * @param email
	 * @return count
	 */
	int checkEmail(String email);

	/** 닉네임 중복검사
	 * @param nickname
	 * @return count
	 */
	int checkNickname(String nickname);
	
	/** 아이디 중복검사
	 * @param id
	 * @return count
	 */
	int checkId(String id);
	
	/** 이름으로 아이디 조회
	 * @param name
	 * @return
	 */
	String selectMemberId(Map<String, Object> map);
	
}

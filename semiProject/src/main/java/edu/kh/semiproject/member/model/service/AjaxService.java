package edu.kh.semiproject.member.model.service;

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
	
}

package edu.kh.semiproject.member.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EmailDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	// 인증번호 받기
	public int updateAuthKey(Map<String, String> map) {
		return sqlSession.update("emailMapper.updateAuthKey", map);
	}

	
	// 인증번호 입력
	public int insertAuthKey(Map<String, String> map) {
		return sqlSession.insert("emailMapper.insertAuthKey", map);
	}

	
	// 인증번호 확인
	public int checkAuthKey(Map<String, Object> paramMap) {
		return sqlSession.selectOne("emailMapper.checkAuthKey", paramMap);
	}

}

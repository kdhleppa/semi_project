package edu.kh.semiproject.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AjaxDAO {

	@Autowired // bean 중에서 타입이 같은 객체를 DI
	private SqlSessionTemplate sqlSession;
	
		// 이메일 중복검사
		public int checkEmail(String email) {
			
			return sqlSession.selectOne("ajaxMapper.checkEmail", email);
		}

		// 닉네임 중복검사
		public int checkNickname(String nickname) {
			
			return sqlSession.selectOne("ajaxMapper.checkNickname", nickname);
		}

		// 아이디 중복검사
		public int checkId(String id) {
			return sqlSession.selectOne("ajaxMapper.checkId", id);
		}

	
}

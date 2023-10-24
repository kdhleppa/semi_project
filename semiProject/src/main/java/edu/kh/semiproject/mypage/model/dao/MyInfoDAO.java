package edu.kh.semiproject.mypage.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.semiproject.member.model.dto.Member;

@Repository
public class MyInfoDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	public int updateInfo(Member updateMember) {
		
		return sqlSession.update("myInfoMapper.updateInfo", updateMember);
	}
	
	public int updateProfile(Member loginMember) {
		return sqlSession.update("myInfoMapper.updateProfile", loginMember);
	}

	public String selectEncPw(int memberNo) {
		return sqlSession.selectOne("myInfoMapper.selectEncPw", memberNo);
	}

	public int withdrawal(int memberNo) {
		return sqlSession.update("myInfoMapper.withdrawal", memberNo );
	}

}

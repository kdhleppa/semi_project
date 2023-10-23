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
	
	public int updateProfileImage(Member loginMember) {
		return sqlSession.update("myInfoMapper.updateProfileImage", loginMember);
	}

}

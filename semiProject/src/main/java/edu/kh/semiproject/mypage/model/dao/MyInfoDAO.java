package edu.kh.semiproject.mypage.model.dao;

import java.util.List;

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

		int result = sqlSession.update("myInfoMapper.updateProfile", loginMember);
		
		System.out.println("result dao::"+result);
		return result;
	}

	public String selectEncPw(int memberNo) {
		return sqlSession.selectOne("myInfoMapper.selectEncPw", memberNo);
	}

	public int withdrawal(int memberNo) {
		return sqlSession.update("myInfoMapper.withdrawal", memberNo );
	}

	public List<String> selectImageList() {
		return sqlSession.selectList("myInfoMapper.selectImageList");
	}

}

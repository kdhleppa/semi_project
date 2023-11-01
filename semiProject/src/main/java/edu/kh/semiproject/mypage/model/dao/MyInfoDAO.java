package edu.kh.semiproject.mypage.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import edu.kh.semiproject.member.model.dto.Member;

@Repository
public class MyInfoDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	// 회원 정보 수정
	public int updateInfo(Member updateMember) {
		
		return sqlSession.update("myInfoMapper.updateInfo", updateMember);
	}
	
	
	// 프로필 이미지 수정 서비스
	public int updateProfile(Member loginMember) {

		int result = sqlSession.update("myInfoMapper.updateProfile", loginMember);
		
		System.out.println("result dao::"+result);
		return result;
	}

	
	// 비밀번호 암호화
	public String selectEncPw(int memberNo) {
		return sqlSession.selectOne("myInfoMapper.selectEncPw", memberNo);
	}

	
	// 회원 탈퇴
	public int withdrawal(int memberNo) {
		return sqlSession.update("myInfoMapper.withdrawal", memberNo );
	}

	
	// 매칭되지 않는 서버 파일 제거
	public List<String> selectImageList() {
		return sqlSession.selectList("myInfoMapper.selectImageList");
	}

	// 비밀번호 이메일 인증 회원 조회
	public int selectMember(Member member) {
		return sqlSession.selectOne("myInfoMapper.selectMember", member);
	}

	// 새 비밀번호 설정
	public int newPassword(Member member) {
		return sqlSession.update("myInfoMapper.newPassword", member);
	}


	
	


}

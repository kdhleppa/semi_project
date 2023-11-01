package edu.kh.semiproject.mypage.model.service;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.semiproject.member.model.dto.Member;

public interface MyInfoService {

	
	// 회원 정보 수정
	int updateInfo(Member updateMember);
	
	// 프로필 사진 변경
	int updateProfile(MultipartFile profileImage, String webPath, String filePath, Member loginMember) throws Exception;

	// 회원 탈퇴
	int withdrawal(String memberPw, int memberNo);

	// 매칭되지 않는 서버 파일 제거
	List<String> selectImageList();

	// 비밀번호 이메일 인증 회원 조회
	int selectMember(Member member);

	// 새 비밀번호 설정
	int newPassword(Member member);
	;
}

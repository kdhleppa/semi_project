package edu.kh.semiproject.mypage.model.service;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.semiproject.common.utility.Util;
import edu.kh.semiproject.member.model.dto.Member;
import edu.kh.semiproject.mypage.model.dao.MyInfoDAO;

@Service
public class MyInfoServiceImpl implements MyInfoService{
	
	@Autowired
	private MyInfoDAO dao;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	

	// 회원정보 수정에서 비밀번호 암호화
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateInfo(Member updateMember) {
		
		String encPw = bcrypt.encode(updateMember.getMemberPw());
		updateMember.setMemberPw(encPw);
		
		System.out.println("회원정보수정에서 비번암호화 dao 호출");
		
		return dao.updateInfo(updateMember);
	}
	
	// 프로필 이미지 수정 서비스
	@Override
	public int updateProfile(MultipartFile profileImage, String webPath, String filePath, Member loginMember) throws Exception {
		
		// 프로필 이미지 변경 실패 대비
		String temp = loginMember.getProfileImage(); // 기존에 가지고 있던 이전 이미지 저장
		
		
		String rename = null; // 변경 이름 저장 변수
		
		if(profileImage.getSize() > 0) { // 업로드된 이미지가 있을 경우
			
			// 1) 파일 이름 변경
			rename = Util.fileRename(profileImage.getOriginalFilename());
			
			// 2) 바뀐 이름 loginMember에 세팅
			loginMember.setProfileImage(webPath + rename);
			
			System.out.println("loginMember::"  + loginMember);
			System.out.println("바뀐 이름 loginMember에 세팅");
			
		} else { // 업로드된 이미지가 없는 경우 (x버튼) 
			
			loginMember.setProfileImage(null);
			
			System.out.println("업로드된 이미지 없음");
			
		}
		
		
		// 프로필 이미지 수정 DAO 메서드 호출
		int result = dao.updateProfile(loginMember);
		
		System.out.println("result::" + result);
		
		if(result > 0) { // DB에 이미지 경로 업데이트 성공했다면
			
			// 업로드된 새 이미지가 있을 경우
			if(rename != null) {
				
				// 메모리에 임시 저장되어있는 파일을 서버에 진짜로 저장하는 것
				profileImage.transferTo(new File(filePath + rename));
				System.out.println("서버에 프로필이미지 파일 저장");
				
			}
			
			
		} else { // 실패
			
			// 이전 이미지로 프로필 다시 세팅
			loginMember.setProfileImage(temp);
			System.out.println("이전 이미지 다시 세팅");
			
		}
		
		//System.out.println("result::" + result);
		return result; 
		
		
	}

	// 회원 탈퇴
	@Override
	public int withdrawal(String memberPw, int memberNo) {
		
		// 1. 회원 번호가 일치하는 회원의 비밀번호 조회
		String encPw = dao.selectEncPw(memberNo);
		
		// 2.비밀번호가 일치하면 
		if(bcrypt.matches(memberPw, encPw)) {
			// MEMBER_SECESSION -> 'Y'로 바꾸고 1 반환
			System.out.println("회원탈퇴 dao 호출");
			return dao.withdrawal(memberNo);
			
		}
		
		//  3. 비밀번호가 일치하지 않으면 -> 0 반환
		System.out.println("탈퇴 비번 불일치");
		return 0;
	}

	
	// 매칭되지 않는 서버 파일 제거
	@Override
	public List<String> selectImageList() {
		return dao.selectImageList();
	}

	
	// 비밀번호 이메일 인증 회원 조회
	@Override
	public int selectMember(Member member) {
		System.out.println("이메일 인증 회원 dao 호출");
		return dao.selectMember(member);
	}

	
	// 새 비밀번호 설정
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int newPassword(Member member) {
		
		String newEncPw = bcrypt.encode(member.getMemberPw());
		member.setMemberPw(newEncPw);
		
		System.out.println("새 비번 dao 호출");
		
		return dao.newPassword(member);
	}

	
	

		
}

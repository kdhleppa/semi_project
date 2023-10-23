package edu.kh.semiproject.mypage.model.service;

import org.springframework.web.multipart.MultipartFile;

import edu.kh.semiproject.member.model.dto.Member;

public interface MyInfoService {

	int updateInfo(Member updateMember);
	
	int updateProfile(MultipartFile profileImage, String webPath, String filePath, Member loginMember) throws Exception;

	
}

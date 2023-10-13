package edu.kh.semiproject.member.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

//밑부분은 예시로 가져온것 우리것 가져오면됨 맴버 말고 dto 새로 만들어도 됨
// 새로만들면 마이바틱스에서 별칭 등록 해주기
@NoArgsConstructor
@Getter
@Setter
@ToString
public class Member {
	
	
	private int memberNo;
		private String memberEmail;
		private String memberPw;
		private String memberNickname;
		private String memberTel;
		private String memberAddress;
		private String profileImage;
		private String enrollDate;
		private String memberDeleteFlag;
		private int authority;

}

	
	
	

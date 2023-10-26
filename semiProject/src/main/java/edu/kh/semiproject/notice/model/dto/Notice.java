package edu.kh.semiproject.notice.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Notice {
	
	private int noticeNo;
	private int managerNo;
	private String noticeTitle;
	private String noticeContent;
	private String managerNickname;
	private int noticeCount;
	private String noticeDate;
	private String noticeImg;
	private String noticeHide;

}

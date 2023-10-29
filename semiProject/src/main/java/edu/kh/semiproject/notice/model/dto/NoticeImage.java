package edu.kh.semiproject.notice.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class NoticeImage {
	
	private int imageNo;
	private String imagePath;
	private String imageReName;
	private String imageOriginal;
	private int imageOrder;
	private int noticeNo;

}

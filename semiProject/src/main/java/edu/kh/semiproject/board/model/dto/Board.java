package edu.kh.semiproject.board.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Board {
			
	private int boardNo;
	private int memberNo;
	private int managerNo;
	private String boardTitle;
	private String boardContent;
	private String boardDate;
	private String boardComment;
	private String memberNickname;
	private int boardCount;
	private String boardImg;
	private String boardVideoUrl;
	private String boardHide;
		
}

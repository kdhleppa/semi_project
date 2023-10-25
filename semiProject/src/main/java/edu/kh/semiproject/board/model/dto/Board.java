package edu.kh.semiproject.board.model.dto;

import java.util.List;

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
	private String memberNickname;
	private int boardCount;
	private String boardHide;	
		
    
    // 댓글 목록
    private List<Comment> commentList;
	
	
}

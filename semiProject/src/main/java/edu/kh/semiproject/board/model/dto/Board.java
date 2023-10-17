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
	private String boardVideoUrl;
	private String boardHide;
		
	// 서브쿼리
    private int commentCount; // 댓글 수

    // BOARD_IMG 테이블 join
    private String thumbnail;
    
    // 이미지 목록
    private List<BoardImage> imageList;
    
    // 댓글 목록
    private List<Comment> commentList;
	
	
}

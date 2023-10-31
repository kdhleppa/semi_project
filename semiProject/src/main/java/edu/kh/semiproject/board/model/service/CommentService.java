package edu.kh.semiproject.board.model.service;

import java.util.List;

import edu.kh.semiproject.board.model.dto.Comment;

public interface CommentService {

	// 댓글 목록 조회
	List<Comment> select(int boardNo);

	// 댓글 삽입
	int insert(Comment comment);

	int delete(int commentNo);

	int update(Comment comment);

}

package edu.kh.semiproject.board.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.semiproject.board.model.dao.BoardDAO2;

@Service
public class BoardServiceImpl2 implements BoardService2{
	
	@Autowired
	private BoardDAO2 dao;

}

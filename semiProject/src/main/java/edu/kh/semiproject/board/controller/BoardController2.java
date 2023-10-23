package edu.kh.semiproject.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.semiproject.board.model.service.BoardService2;

@Controller
@RequestMapping("/board2")
@SessionAttributes("{loginMember}")
public class BoardController2 {
	
	@Autowired
	private BoardService2 service;
	
	
	

}

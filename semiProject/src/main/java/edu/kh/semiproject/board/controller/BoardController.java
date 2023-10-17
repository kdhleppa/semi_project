package edu.kh.semiproject.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import oracle.jdbc.proxy.annotation.Post;

@SessionAttributes("{loginMember}")
@Controller
public class BoardController {
	
	/*@RequestMapping("/post/{boardNo}")
    public String viewPostDetails(@PathVariable int boardNo, Model model) {
        Post post = postService.getPostById(boardNo);
        model.addAttribute("post", post);
        return "postDetails"; // postDetails.jsp와 같은 뷰를 반환
    }*/
	
	
}

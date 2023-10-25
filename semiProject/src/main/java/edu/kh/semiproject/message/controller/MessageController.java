package edu.kh.semiproject.message.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.semiproject.message.model.service.MessageService;

/*@Controller
@SessionAttributes({"loginMember"})
public class MessageController extends HttpServlet {
	
	@Autowired
	private MessageService service;
	
	@PostMapping("/link/writeMessage")
	public String writeMessage(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		
		request.setCharacterEncoding("UTF-8");
		
		return null;
	}
	
}
*/
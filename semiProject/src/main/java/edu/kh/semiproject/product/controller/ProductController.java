package edu.kh.semiproject.product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileUploadException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.semiproject.member.model.dto.Member;
import edu.kh.semiproject.product.model.dto.Product;
import edu.kh.semiproject.product.model.service.ProductService;

@Controller
@SessionAttributes({"loginMember"})
public class ProductController {
	
	@Autowired
	private ProductService service;
	
	
	@PostMapping("/product/roomUp")
	public String productUpload (@SessionAttribute("loginMember") Member loginMember,
							Model model,
							@RequestParam(value="images", required = false) List<MultipartFile> images,
							Product product,
							HttpSession session,
							RedirectAttributes ra
			) throws IllegalStateException, FileUploadException, IOException {
		System.out.println("product loginmember : " + loginMember.getMemberNo());
		product.setMemberNo(loginMember.getMemberNo());
		System.out.println(product);
		String webPath="/resources/images/product/";
		String filePath = session.getServletContext().getRealPath(webPath);
		
		int productNo = service.roomUp(product, images, webPath, filePath);
		System.out.println("productNo:" + productNo);
		// 성공시
		String message = null;
		String path = "redirect:";
		
		if(productNo>0) {
			message = "등록되었습니다.";
			path += "/link/mapMainLogin";
			model.addAttribute("centerAddress", product.getProductAddress());
		} else {
			message = "등록 실패....";
			path += "link/roomUp";
		}
		
		ra.addFlashAttribute("message", message);
		
		return path;
		

	}

}

package edu.kh.semiproject.product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileUploadException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	
	
	// 물건 올리기
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
			List<Product> products = new ArrayList<Product>();
			model.addAttribute("centerAddress", product.getProductAddress());
		} else {
			message = "등록 실패....";
			path += "/link/roomUp";
		}
		
		ra.addFlashAttribute("message", message);
		
		return path;
		

	}
	
	
	// 내가올린물건 리스트
	@GetMapping("/link/myList")
	public String LikeList(@SessionAttribute("loginMember")Member loginMember,
						Model model
						) {
		int memberNo= loginMember.getMemberNo();
		List<String> membersProduct = new ArrayList<>();
		membersProduct = service.membersProduct(memberNo);
		System.out.println(membersProduct);
		model.addAttribute("membersProduct", membersProduct);
		
		
		return "kdh/my_list";
	}
	
	
	// 물건 상세 조회
	@GetMapping("/productDetail/{productNo}")
	public String productDetail(@PathVariable("productNo") int productNo,
								Model model,
								@SessionAttribute(value="loginMember", required = false)Member loginMember) {
		
		Product sProduct = service.selectProduct(productNo);
		
		
		
		model.addAttribute("sProduct", sProduct);		
		return "kdh/room_detail_view";
	}
	
	// 물건 삭제
	@GetMapping("/productDetail/{productNo}/delete")
	public String productDelete(@PathVariable("productNo") int productNo,
								RedirectAttributes ra
			) {
		
		int result = service.productDelete(productNo);
		
		String path ="redirect:" ;
		String message = null;
		
		if (result > 0) {
			
			message = "등록하신 물건이 삭제되었습니다";
			path += "/link/myList";
			
		} else {
			
			message = "삭제 실패";
			path += "/productDetail/" + productNo;
		}
		ra.addFlashAttribute("message", message);
		
		return path;
	}
	
	// 물건 수정 페이지 전환
	@GetMapping("/productDetail/{productNo}/update")
	public String productUpdate( @PathVariable("productNo") int productNo,
								Model model
			) {
		
		Product product = service.selectProduct(productNo);
		
		model.addAttribute("product",product);
		System.out.println("수정전환: " + product);
		
		return "kdh/room_up_update";
	}

	// 물건 수정
	@PostMapping("/productDetail/{productNo}/update")
	public String productUpdate(@PathVariable("productNo") int productNo,
							Model model,
							Product product,
							@RequestParam(value="images", required = false) List<MultipartFile> images,
							@RequestParam(value="deleteList", required = false) String deleteList,
							HttpSession session,
							RedirectAttributes ra
							) throws Exception, Exception {
		product.setProductNo(productNo);
		System.out.println("프로덕트수"+product);
		String webPath = "/resources/images/product/";
		String filePath = session.getServletContext().getRealPath(webPath);
		
		int rowCount = service.productUpdate(product, images, webPath, filePath, deleteList);
		
		String message = null;
		String path = "redirect:";
		
		if(rowCount > 0 ) {
			message = "등록물건이 수정되었습니다";
			
			path += "/productDetail/"+productNo;
		} else {
			message = "수정 실패하였습니다";
			path += "update";
		}
		ra.addFlashAttribute("message", message);
	return path;
	}
}

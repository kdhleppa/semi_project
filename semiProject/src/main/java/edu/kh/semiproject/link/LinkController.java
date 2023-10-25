package edu.kh.semiproject.link;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

import edu.kh.semiproject.map.model.service.MapService;
import edu.kh.semiproject.member.model.dto.Member;
import edu.kh.semiproject.product.model.dto.Product;

@Controller
@RequestMapping("/link")
public class LinkController {
	//@Autowired
	//private MapService service; 
	
	
	// kdh 쪽으로 연결하는 링크모음
	@GetMapping("/likeList")
	public String LikeList() {
		return "/kdh/like_list";
	}
	
	@GetMapping("/mapMainLogin")
	public String MapMainLogin() {
		return "/kdh/map_main_login";
	}
			
	@GetMapping("/roomDetailView")
	public String RoomDetailView() {
		return "/kdh/room_detail_view";
	}
	
	@GetMapping("/safeDeal")
	public String SafeDeal() {
		return "/kdh/safe_deal";
	}
	
	@GetMapping("/terms")
	public String Terms() {
		return "/kdh/terms";
	}
	
	// cje 쪽으로 연결하는 링크모음
	
	@GetMapping("/boardListMine")
	public String BoardListMine() {
		return "/cje/board_list_mine";
	}
	
// 	BoardController 에서 사용
//	@GetMapping("/boardReadMoreMine")
//	public String BoardreadMoreMine() {
//		return "/cje/board_readMore_mine";
//	}

	
// boardReadMoreMine 과 한페이지로 만듬
//	@GetMapping("/boardReadMoreOthers")
//	public String BoardreadMoreOthers() {
//		return "/cje/board_readMore_others";
//	}
	
// BoardController2에서 사용
//	@GetMapping("/boardWriting")
//	public String BoardWriting() {
//		return "/cje/board_writing";
//	}
	
	@GetMapping("/mainLogin")
	public String MainLogin() {
		return "/cje/main_login";
	}
	
	@GetMapping("/noticeListUser")
	public String NoticeListUser() {
		return "/cje/notice_list_user";
	}
	
	@GetMapping("/noticeListAdmin")
	public String NoticeListAdmin() {
		return "/cje/notice_list_admin";
	}
	
	
	@GetMapping("/noticeReadMoreAdmin")
	public String NoticeReadMoreAdmin() {
		return "/cje/notice_readMore_admin";
	}
	
	@GetMapping("/noticeReadMoreUsers")
	public String NoticeReadMoreUsers() {
		return "/cje/notice_readMore_users";
	}
	
	@GetMapping("/noticeWriting")
	public String NoticeWriting() {
		return "/cje/notice_writing";
	}
	
	@GetMapping("/oneOnOneListAdmin")
	public String OneOnOneListAdmin() {
		return "/cje/oneOnOne_list_admin";
	}
	
	@GetMapping("/oneOnOneListUser")
	public String OneOnOneListUser() {
		return "/cje/oneOnOne_list_user";
	}
	
	@GetMapping("/oneOnOneWritingAdmin")
	public String OneOnOneWritingAdmin() {
		return "/cje/oneOnOne_writing_admin";
	}

	@GetMapping("/oneOnOneWriting")
	public String OneOnOneWriting() {
		return "/cje/oneOnOne_writing";
	}
	
	
	// shs 에 들어가는 링크 모음
	@GetMapping("/declarationListAdmin")
	public String DeclarationListAdmin() {
		return "/shs/declaration_ist_admin";
	}
	
	@GetMapping("/editProperty")
	public String EditProperty() {
		return "/shs/edit_property";
	}
	
	@GetMapping("/editProperty(twoRoom)")
	public String EditProperty2Room() {
		return "/shs/edit_property(two_room)";
	}
	
	@GetMapping("/myRoomUpList")
	public String MyRoomUpList() {
		return "/shs/my_room_up_list";
	}
	
	@GetMapping("/roomUpFront")
	public String RoomUpFront() {
		return "/shs/room_up";
	}
	
	@GetMapping("/roomUp")
	public String RoomUp() {
		return "/shs/room_up";
	}
	
	
	// swc 링크
	@GetMapping("/detailReceiveMessage")
	public String DetailReceiveMessage() {
		return "/swc/detail_receive_message";
	}
	
	@GetMapping("/detailsendMessage")
	public String DetailsendMessage() {
		return "/swc/detail_send_message";
	}
	
	@GetMapping("/findId")
	public String FindId() {
		return "/swc/find_id";
	}
	
	@GetMapping("/findPassword")
	public String FindPassword() {
		return "/swc/find_password";
	}
	
	@GetMapping("/login")
	public String Login() {
		return "/swc/login";
	}
	
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		
		status.setComplete();
		
		return "redirect:/";
	}
	
	@GetMapping("/messageReceived")
	public String MessageReceived() {
		return "/swc/message_received";
	}
	
	@GetMapping("/messageSent")
	public String MessageSent() {
		return "/swc/message_sent";
	}
	
	@GetMapping("/myInfoUpdate")
	public String MyInfoUpdate() {
		return "/swc/my_info_update";
	}
	
	@GetMapping("/myInfo")
	public String MyInfo() {
		return "/swc/my_info";
	}
	
	@GetMapping("/newPassword")
	public String NewPassword() {
		return "/swc/new_password";
	}
	
	@GetMapping("/signUp")
	public String SignUp() {
		return "/swc/signUp";
	}
	
	@GetMapping("/withdrawal")
	public String Withdrawal() {
		return "/swc/withdrawal";
	}
	
	@GetMapping("/writeMessage")
	public String WriteMessage() {
		return "/swc/write_message";
	}
	
	
	
	
}
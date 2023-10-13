package edu.kh.semiproject.link;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/link")
public class LinkController {
	
	// kdh 쪽으로 연결하는 링크모음
	@GetMapping("/likeList")
	public String LikeList() {
		return "/kdh/like_list";
	}
	
	@GetMapping("/mapMainLogin")
	public String MapMainLogin() {
		return "/kdh/map_main_login";
	}
	
	@GetMapping("/mapMainNotLogin")
	public String MapMainNotLogin() {
		return "/kdh/map_main_not_login";
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
	@GetMapping("/communityListMine")
	public String CommunityListMine() {
		return "/cje/community_list_mine";
	}
	
	@GetMapping("/communityList")
	public String CommunityList() {
		return "/cje/community_list";
	}
	
	@GetMapping("/communityreadMoreMine")
	public String CommunityreadMoreMine() {
		return "/cje/community_readMore_mine";
	}

	@GetMapping("/communityreadMoreOthers")
	public String CommunityreadMoreOthers() {
		return "/cje/community_readMore_others";
	}
	
	@GetMapping("/communityWriting")
	public String CommunityWriting() {
		return "/cje/community_writing";
	}
	
	@GetMapping("/mainLogin")
	public String MainLogin() {
		return "/cje/main_login";
	}
	
	@GetMapping("/noticeList")
	public String NoticeList() {
		return "/cje/notice_list";
	}
	
	@GetMapping("/noticeReadMoreAdmin")
	public String NoticeReadMoreAdmin() {
		return "/cje/notice_readMore_admin";
	}
	
	@GetMapping("/noticeReadMoreUser")
	public String NoticeReadMoreUser() {
		return "/cje/notice_readMore_user";
	}
	
	@GetMapping("/noticeWriting")
	public String NoticeWriting() {
		return "/cje/notice_writing";
	}
	
	@GetMapping("/onoOnOneListAdmin")
	public String OnoOnOneListAdmin() {
		return "/cje/onoOnOne_list_admin";
	}
	
	@GetMapping("/onoOnOneListUser")
	public String OnoOnOneListUser() {
		return "/cje/onoOnOne_list_user";
	}
	
	@GetMapping("/onoOnOneWritingAdmin")
	public String OnoOnOneWritingAdmin() {
		return "/cje/onoOnOne_writing_admin";
	}

	@GetMapping("/onoOnOneWriting")
	public String OnoOnOneWriting() {
		return "/cje/onoOnOne_writing";
	}
	
	
	// shs 에 들어가는 링크 모음
	@GetMapping("/declarationList")
	public String DeclarationList() {
		return "/shs/declaration_ist";
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
		return "/shs/room_up_front";
	}
	
	@GetMapping("/roomUp")
	public String RoomUp() {
		return "/shs/room_up";
	}
	
	@GetMapping("/roomUp(two_room)")
	public String RoomUp2Room() {
		return "/shs/room_up(two_room)";
	}
	
	@GetMapping("/underReview")
	public String UnderReview() {
		return "/shs/under_review";
	}
	
	
	// swc 링크
	@GetMapping("/detailReciveMessage")
	public String DetailReciveMessage() {
		return "/swc/detail_recive_message";
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
	
	@GetMapping("/messageReceived")
	public String MessageReceived() {
		return "/swc/message_received";
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
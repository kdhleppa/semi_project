package edu.kh.semiproject.message.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Message {
	
		
		private int dmNo;
		private int memberNo;
		private String dmSenderId;
		private String dmReceiverId;
		private String dmTitle;
		private String dmContent;
		
		
}

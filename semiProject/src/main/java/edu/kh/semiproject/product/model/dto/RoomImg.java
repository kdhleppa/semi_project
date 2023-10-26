package edu.kh.semiproject.product.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@NoArgsConstructor
public class RoomImg {
	private int imgNo;
	private int productNo;
	private String imgPath;
	private String imgRename;
	private String imgOriginal;
	private int imgOrder;

}

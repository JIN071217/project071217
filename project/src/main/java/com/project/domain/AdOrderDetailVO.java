package com.project.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class AdOrderDetailVO {

	/* 
	 ot.ord_code, 
	 ot.pro_num, 
	 ot.dt_amount, 
	 ot.dt_price, 
	 p.pro_name, 
	 p.pro_up_folder, 
	 p.pro_img
	*/
	
	private Long ord_code;		// 주문 코드
	private Integer	pro_num;	// 상품 번호
	private int dt_amount;		// 주문된 상품의 수량
	private int dt_price;		// 주문된 상품의 총 가격
	private String 	pro_name;	// 상품 이름
	private	String	pro_up_folder; // 상품 이미지 저장 경로 (폴더)
	private String	pro_img;	// 상품 이미지 파일
}

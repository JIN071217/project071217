package com.project.dto;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class CartListDTO {

	private int num;				// 일련번호 순서
	private Long cart_code;			// 장바구니 코드
	private String pro_up_folder;	// 상품이미지 폴더 경로
	private String pro_img;			// 상품 이미지 파일
	private int pro_num;			// 상품 번호
	private String pro_name;		// 상품 이름
	private int pro_price;			// 상품 가격
	private int cart_amount;		// 장바구니에 담긴 상품 수량
	private int unitprice;			// 상품 가격
}

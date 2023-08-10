package com.project.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CartVO {

	private Long cart_code;		// 장바구니 코드
	private Integer pro_num;	// 상품 번호
	private String mbsp_id;		// 사용자 아이디
	private int cart_amount;	// 장바구니에 담긴 상품 수량
}

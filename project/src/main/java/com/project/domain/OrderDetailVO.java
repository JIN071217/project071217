package com.project.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class OrderDetailVO {

	/*
	 CREATE TABLE ORDETAIL_TBL(
       ORD_CODE        NUMBER      NOT NULL REFERENCES ORDER_TBL(ORD_CODE),
       PRO_NUM         NUMBER      NOT NULL REFERENCES PRODUCT_TBL(PRO_NUM),
       DT_AMOUNT       NUMBER      NOT NULL,
       DT_PRICE        NUMBER      NOT NULL,  -- 역정규화
       PRIMARY KEY (ORD_CODE ,PRO_NUM) 
	);
	 */
	
	private Long ord_code;		// 주문 코드	
	private int pro_num;		// 상품 번호
	private int dt_amount;		// 상품의 주문 수량
	private int dt_price;		// 상품 주문 가격
}

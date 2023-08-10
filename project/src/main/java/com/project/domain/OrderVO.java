package com.project.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class OrderVO {

	/* CREATE TABLE ORDER_TBL(
    ORD_CODE            NUMBER,                 
    MBSP_ID             VARCHAR2(15)            NOT NULL,
    ORD_NAME            VARCHAR2(30)            NOT NULL,
    ORD_ADDR_POST        CHAR(5)                NOT NULL,
    ORD_ADDR_BASIC      VARCHAR2(50)            NOT NULL,
    ORD_ADDR_DETAIL     VARCHAR2(50)            NOT NULL,
    ORD_TEL             VARCHAR2(20)            NOT NULL,
    ORD_PRICE           NUMBER                  NOT NULL,  -- 총주문금액. 선택
    ORD_REGDATE         DATE DEFAULT SYSDATE    NOT NULL,
    FOREIGN KEY(MBSP_ID) REFERENCES MBSP_TBL(MBSP_ID)
	);*/

	private Long ord_code;			// 주문 코드
	private String mbsp_id;			// 주문 회원
	private String ord_name;		// 주문자 이름
	private String ord_addr_post;	// 주문자 주소 - 우편번호
	private String ord_addr_basic;	// 주문자 기본 주소
	private String ord_addr_detail;	// 주문자 상세 주소
	private String ord_tel;			// 주문자 전화번호
	private int ord_price;			// 주문 총액
	private Date ord_regdate;		// 주문 날짜
	
	
	private String pay_method;		// 결제 방법
	private int ord_total_price;	// 주문 총 가격
	public Integer pro_num;			// 제품 번호
}

package com.project.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class PaymentVO {
	/*
    PAY_CODE    NUMBER CONSTRAINT PK_PAY_CODE PRIMARY KEY,
    ODR_CODE    NUMBER 			NOT NULL,
    MBSP_ID     VARCHAR2(15) 	NOT NULL,
    PAY_METHOD  VARCHAR2(15) 	NOT NULL,
    PAY_PRICE   NUMBER 			NOT NULL,
    PAY_USER    VARCHAR2(15)    NOT NULL,
    PAY_BANK    VARCHAR2(15)    NOT NULL,
    PAY_DATE    DATE    DEFAULT SYSDATE,
    PAY_MEMO    VARCHAR(100)    NULL
	*/
	
	private Integer pay_code;	// 결제 코드
	private long ord_code;		// 관련 주문 코드
	private String mbsp_id;		// 결제한 주문자 ID
	private String pay_method;	// 결제 방법 (무통장 입금, 카카오페이)
	private int pay_price;		// 결제 금액
	private String pay_user;	// 결제한 사용자 이름
	private String pay_bank;	// 결제 은행이름 또는 카카오페이 
	private Date pay_date;		// 결제 일자
	private String pay_memo;	// 결제 메모
	
}

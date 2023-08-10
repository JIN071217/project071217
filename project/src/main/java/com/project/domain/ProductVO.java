package com.project.domain;

import lombok.ToString;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;

import lombok.Setter;

@Setter
@Getter
@ToString
public class ProductVO {
	
	/*
	
	CREATE TABLE PRODUCT_TBL(
        PRO_NUM             NUMBER  CONSTRAINT  PK_PRO_NUM         PRIMARY KEY,
        CAT_CODE            NUMBER            		NULL,
        PRO_NAME            VARCHAR2(50)            NOT NULL,
        PRO_PRICE           NUMBER                  NOT NULL,
        PRO_DISCOUNT        NUMBER                  NOT NULL,
        PRO_PUBLISHER       VARCHAR2(50)            NOT NULL,
        PRO_CONTENT         VARCHAR2(4000)          NOT NULL,   -- 내용이 4000BYTE 초과여부판단?
        PRO_UP_FOLDER       VARCHAR(50)             NOT NULL,
        PRO_IMG             VARCHAR(50)             NOT NULL,  -- 날짜폴더경로가 포함하여 파일이름저장
        PRO_AMOUNT          NUMBER                  NOT NULL,
        PRO_BUY             CHAR(1)                 NOT NULL,
        PRO_DATE            DATE DEFAULT SYSDATE    NOT NULL,
        PRO_UPDATEDATE      DATE DEFAULT SYSDATE    NOT NULL,
        FOREIGN KEY(CAT_CODE) REFERENCES CATEGORY_TBL(CAT_CODE)
        );
	
	 */

	private Integer pro_num;  		// 상품등록 번호
	private int cat_code;			// 상품 코드
	private String pro_name;		// 상품 이름
	private int    pro_price;		// 상품 가격
	private int    pro_discount;	// 상품 할인
	private String pro_publisher;	// 상품 제조사
	private String pro_content;		// 상품 내용
	
	private String pro_up_folder;	// 업로드 날짜
	private String pro_img;			// CKediter로 업로드할 이미지 파일
	
	private int	   pro_amount;		// 수량
	private String pro_buy;			// 판매 여부
	private Date   pro_date;		// 등록 날짜
	private Date   pro_updatedate;  // 수정 날짜
	
	// SpringFramework에서 제공하는 파일 업로드처리와 접근하기위한 인터페이스
	// 파일을 업로드할 때, 해당 파일의 데이터는 MultipartFile객체에 저장된다.
	// pro_insert.jsp 114 Line
	private MultipartFile uploadFile;
}

package com.project.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class AdminVO {

	/*
	 
	CREATE TABLE ADMIN_TBL (
    ADMIN_ID    VARCHAR2(15)    PRIMARY KEY,
    ADMIN_PW    CHAR(60)    	NOT NULL,
    ADMIN_VISIT_DATE    		DATE
	);
	
	 */
	private String admin_id;
	private String admin_pw;
	// 관리자의 마지막 방문 날짜를 저장하는 Date타입 변수
	private Date admin_visit_date;
}

package com.project.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class CategoryVO {
	
	/*	 
	 CREATE TABLE CATEGORY_TBL(
        CAT_CODE            NUMBER   	    PRIMARY KEY,    -- 카테고리 코드
        CAT_PRTCODE         NUMBER    		NULL,           -- 상위카테고리 코드
        CAT_NAME            VARCHAR2(50)    NOT NULL,
        FOREIGN KEY(CAT_PRTCODE) REFERENCES CATEGORY_TBL(CAT_CODE)
	);
	 
	 1차 카테고리 : TOP(1) PANTS(2) SHIRTS(3) OUTER(4) SHOES(5) BAG(6) ACC(7)
	 
	 2차 카테고리 
	 TOP(1)   - 긴팔티 니트 맨투맨/후드티 프린팅티 나시 반팔티/7부티
	 PANTS(2) - 밴딩팬츠 청바지 슬랙스 면바지 반바지
	 SHIRTS(3)- 헨리넥/차이나 베이직 체크/패턴 청남방 스트라이프 
	 OUTER(4) - 패딩 코트 수트/블레이져 자켓 블루종/MA-1 가디건/조끼 후드/집업
	 SHOES(5) - 스니커즈 로퍼/구두 키높이신발/깔창 슬리퍼/쪼리/샌들
	 BAG(6)   - 백팩 토트/숄더백 크로스백 클러치
	 ACC(7)   - 양말/넥타이 모자 머플러/장갑 아이웨어 벨트/시계 기타 
	 */
	
	private Integer cat_code;
	private int cat_prtcode; 
	private String cat_name;

}

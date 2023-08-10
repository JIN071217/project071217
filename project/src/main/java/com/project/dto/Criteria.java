package com.project.dto;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
// 페이지 및 검색 조건 정보 
public class Criteria {
	
	// 현재 페이지 번호, 페이지당 데이터 개수
	private int pageNum;
	private int amount;
	
	// 검색 유형 및 검색어
	private String type;
	private String keyword;
	
	// 기본 생성자 : pageNum=1, amount=10으로 초기화
	public Criteria() {
		this(1,10);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	// 검색기능에 사용될 type 정의
	// 필드가 존재하지않지만, mybatis에서 배열주입 목적으로 생성,
	// 검색 유형을 배열로 변환하여 반환 (예 : "TW" -> ['T', 'W'])
	public String[] getTypeArr() {
		return type == null? new String[] {} : type.split("");
	}
	
	// 현재 페이지 및 검색 조건을 포함한 URI 생성 후 반환
	public String getListLink() {
		
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.pageNum)
				.queryParam("getAmount", this.getAmount())
				.queryParam("getType", this.getType())
				.queryParam("getKeyword", this.getKeyword());
	
		return builder.toUriString(); 
	}
}

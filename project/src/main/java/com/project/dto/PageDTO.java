package com.project.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
// 페이징 처리를 위한 DTO
public class PageDTO {

	//현재 페이지에서 보여줄 첫 페이지와 마지막 페이지 번호 
	private int startPage;
	private int endPage;
	
	// [이전] 1 ~ 10 [다음] 표시
	private boolean prev, next;
	
	//테이블 총 데이터 수
	private int total;
	
	//페이징정보(pageNum, amount)검색필드 - Type, keyword
	private Criteria cri;
	
	// 생성자 : 주어진 total과 Criteria를 깁ㄴ으로 페이징 정보를 계산한다.
	public PageDTO(int total, Criteria cri) {
		
		this.cri = cri;
		this.total = total;
		
		//블럭당 출력할 페이지 수
		int pageSize = 10;
		//마지막 페이지 필드 값 구하기
		int endPageInfo = pageSize - 1;
		
		this.endPage = (int) Math.ceil(cri.getPageNum() / (double) pageSize) * pageSize;
		this.startPage = this.endPage - endPageInfo; 
		
		//게시판 테이블의 실제데이터 개수에 따른 마지막페이지 구하기
		int realEnd = (int) Math.ceil((total * 1.0) / cri.getAmount());
		
		//실제 페이지 수 <= (논리) 마지막 페이지 수
		if(realEnd <= this.endPage) {
			this.endPage = realEnd; // 페이지 데이터 개수에 따른 실제 페이지수 
		}
		
		// [next] 블럭에 표시할 데이터가 존재한다는 의미
		this.prev = this.startPage > 1;
		// 실제 페이지수가 더 크면 다음 블럭에 표시할 데이터가 존재한다는 의미
		this.next = this.endPage < realEnd;
	}
	
}

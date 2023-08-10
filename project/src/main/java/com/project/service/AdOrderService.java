package com.project.service;

import java.util.List;

import com.project.domain.AdOrderDetailVO;
import com.project.domain.OrderVO;
import com.project.dto.Criteria;

public interface AdOrderService {
	
	// 주문검색 및 날짜 검색
	List<OrderVO> orderList(Criteria cri, String sDate, String eDate);
	
	// 주문 총 개수 
	int getTotalCount(Criteria cri, String sDate, String eDate);
	
	// 주문코드에 따른 주문 상세 목록
	List<AdOrderDetailVO> orderDetail(Long ord_code);

	// 주문상세 삭제
    void orderDetailProductDelete(Long ord_code, Integer pro_num);

    // 주문 상세 비어 있는지 확인
    boolean isOrderDetailEmpty(Long ord_code);

    // 주문 삭제
    void deleteOrder(Long ord_code);

    // 주문 총 금액
    void refreshOrderAmount(Long ord_code);
	
	
	//주문 정보 전체삭제
	void orderInfoDelete(Long ord_code);
	
	
}

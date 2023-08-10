package com.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.domain.AdOrderDetailVO;
import com.project.domain.OrderVO;
import com.project.dto.Criteria;

public interface AdOrderMapper {
	
	//주문검색 및 날짜 검색
	List<OrderVO> orderList(@Param("cri") Criteria cri,
							@Param("sDate") String sDate,
							@Param("eDate")String eDate);
	
	// 주문 총 개수 
	int getTotalCount(@Param("cri") Criteria cri,
					  @Param("sDate") String sDate, 
					  @Param("eDate") String eDate);
	
	// 주문코드에 따른 주문 상세 목록
	List<AdOrderDetailVO> orderDetail(Long ord_code);
	
	// 2)주문삭제
	void orderDelete(Long ord_code);
	// 1)주문상세상품삭제
	void orderDetailDelete(Long ord_code);
	// 3)결제삭제
	void paymentDelete(Long ord_code);
	
	//주문 상세삭제
	//1. 주문상세내역 삭제
    void orderDetailProductDelete(@Param("ord_code") Long ord_code, @Param("pro_num") Integer pro_num);
    //2. 주문 상세 내역 수 조회
    int getOrderDetailCount(Long ord_code);
    //3. 주문상세삭제후, 가 0이면 주문삭제
    void deleteOrder(Long ord_code);
    //4. 주문 총금액 조회
    int getOrderAmount(Long ord_code);
    //5. 주문 총금액 갱신 
    void updateOrderAmount(@Param("ord_code") Long ord_code, @Param("orderAmount") int orderAmount);

	
}
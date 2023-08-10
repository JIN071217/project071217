package com.project.mapper;

import com.project.domain.OrderVO;
import com.project.domain.PaymentVO;

public interface OrderMapper {

	//주문정보 저장
	void order_save(OrderVO o_vo);
	
	//주문상세 : 장바구니 활용
	void order_detail_save(Long ord_code);
	
	//결제정보[무통장입금,카카오페이]
	void payment_save(PaymentVO p_vo);
}

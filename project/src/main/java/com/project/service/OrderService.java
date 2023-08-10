package com.project.service;

import com.project.domain.OrderVO;
import com.project.domain.PaymentVO;

public interface OrderService {
	
	// OrderVO o_vo   : 주문 정보 객체
	// PaymentVO p_vo : 결제 정보 객체
	void order_save(OrderVO o_vo, PaymentVO p_vo);

}

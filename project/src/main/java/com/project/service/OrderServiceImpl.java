package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.domain.OrderVO;
import com.project.domain.PaymentVO;
import com.project.mapper.CartMapper;
import com.project.mapper.OrderMapper;

import lombok.Setter;

@Service
public class OrderServiceImpl implements OrderService {
	
	// 주문 관련
	@Setter(onMethod_ = {@Autowired})
	private OrderMapper orderMapper;
	
	// 장바구니 관련
	@Setter(onMethod_ = {@Autowired})
	private CartMapper cartMapper;
	
	// XML에서 selectKey를 통해서  OrderVO-ord_code 공유하기떄문에 주문번호를 공유하기때문에 @Transactional를 활용한다
	@Transactional // 트랙잭션 테스트 할 것. root-context.xml에서 트랜잭션 파일 빈 설정
	@Override
	public void order_save(OrderVO o_vo, PaymentVO p_vo) {

		// 주문 저장
		orderMapper.order_save(o_vo);
		
		// 주문 상세 저장
		orderMapper.order_detail_save(o_vo.getOrd_code());
		
		// 장바구니 비우기
		cartMapper.cart_empty(o_vo.getMbsp_id());
		
		// 결제정보 저장
		p_vo.setOrd_code(o_vo.getOrd_code());
		orderMapper.payment_save(p_vo);
		
		
	}
	
	
}

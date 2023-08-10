package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.domain.AdOrderDetailVO;
import com.project.domain.OrderVO;
import com.project.dto.Criteria;
import com.project.mapper.AdOrderMapper;

import lombok.Setter;

@Service
public class AdOrderServiceImpl implements AdOrderService {

	
	
	@Setter(onMethod_ = {@Autowired})
	private AdOrderMapper adOrderMapper;

	@Override
	public List<OrderVO> orderList(Criteria cri, String sDate, String eDate) {
		// TODO Auto-generated method stub
		return adOrderMapper.orderList(cri, sDate, eDate);
	}

	@Override
	public int getTotalCount(Criteria cri, String sDate, String eDate) {
		// TODO Auto-generated method stub
		return adOrderMapper.getTotalCount(cri, sDate, eDate);
	}

	@Override
	public List<AdOrderDetailVO> orderDetail(Long ord_code) {
		// TODO Auto-generated method stub
		return adOrderMapper.orderDetail(ord_code);
	}
	
	//주문상세삭제
	//[주문상세상품 삭제]
    @Override
    public void orderDetailProductDelete(Long ord_code, Integer pro_num) {
        adOrderMapper.orderDetailProductDelete(ord_code, pro_num);
    }
    
    //[주문 상세내역 비어있는지 확인]
    @Override
    public boolean isOrderDetailEmpty(Long ord_code) {
        int orderDetailCount = adOrderMapper.getOrderDetailCount(ord_code);
        return orderDetailCount == 0;
    }
    
    //[비어있으면 주문삭제 - payment도 삭제해야하므로, 트랙잭션처리]
    @Transactional
    @Override
    public void deleteOrder(Long ord_code) {
    	//주문 상세
        adOrderMapper.deleteOrder(ord_code);
        //주문 payment
        adOrderMapper.paymentDelete(ord_code);
    }

    //[주문금액 새로갱신]
    @Override
    public void refreshOrderAmount(Long ord_code) {
        int orderAmount = adOrderMapper.getOrderAmount(ord_code);
        adOrderMapper.updateOrderAmount(ord_code, orderAmount);
    }
    
    //주문 토탈삭제
	@Transactional // 트랙잭션의미 : 하나가 오류발생이, 나머지도 롤백시킨다.
	@Override
	public void orderInfoDelete(Long ord_code) {
		
		// 주문상세삭제
		adOrderMapper.orderDetailDelete(ord_code);
		
		// 주문삭제
		adOrderMapper.orderDelete(ord_code);
		
		// 결제삭제
		adOrderMapper.paymentDelete(ord_code);
		
	}

}

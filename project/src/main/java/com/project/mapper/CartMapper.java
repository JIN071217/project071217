package com.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.domain.CartVO;
import com.project.dto.CartListDTO;

public interface CartMapper {
	
	//장바구니 데이터
	int cart_add(CartVO vo);
	
	//장바구니 담을시 출력 리스트
	List<CartListDTO> cart_list(String mbsp_id);
	
	//장바구니 수량변경
	int cart_amount_change(@Param("cart_code")Long cart_code,@Param("cart_amount") int cart_amount);
	
	//장바구니 단일 비우기 
	int cart_delete(Long cart_code);
	
	//장바구니 토탈 가격
	int cart_tot_price(String mbsp_id);
	
	//장바구니 비우기
	void cart_empty(String mbsp_id);
}

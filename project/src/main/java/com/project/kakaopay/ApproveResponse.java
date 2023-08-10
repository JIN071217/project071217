package com.project.kakaopay;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
//[2]결제승인요청시 응답데이터(두번째 요청) https://kapi.kakao.com/v1/payment/approve
public class ApproveResponse {

	private String aid;					// 결제 고유 번호
	private String tid;					// 거래 고유 번호
	private String cid;					// 가맹점 코드
	private String sid;					// 주문 정보 확인을 위한 가맹점 코드
	private String partner_order_id;	// 가맹점 주문 코드
	private String partner_user_id;		// 가맹점 회원 아이디
	private String payment_method_type; // 결제 수단
	
	private Amount amount;				// 결제 금액 정보
	
	private String item_name;			// 상품 이름
	private String item_code;			// 상품 코드
	private int quantity;				// 상품 수량
	private String created_at;			// 결제 준비 요청 시간
	private String approved_at;			// 결제 승인 시간
	private String payload;				// 추가 정보
}

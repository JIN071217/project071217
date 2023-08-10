package com.project.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.project.domain.CartVO;
import com.project.domain.MemberVO;
import com.project.dto.CartListDTO;
import com.project.service.CartService;
import com.project.util.FileUtils;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/cart/*")
public class CartController {
	
	// 장바구니 서비스 의존성 주입
	@Setter(onMethod_ = {@Autowired})
	private CartService cartService;
	
	//업로드폴더 의존성 주입
	@Resource(name = "uploadPath") 
	private String uploadPath;  
	
	//장바구니 상품 추가
	@ResponseBody
	@PostMapping("/cart_add")
	public ResponseEntity<String> cart_add(CartVO vo, HttpSession session){
		
		ResponseEntity<String> entity = null;
		
		// 로그인한 사용자 DB작업
		String mbsp_id = ((MemberVO) session.getAttribute("loginStatus")).getMbsp_id();
		vo.setMbsp_id(mbsp_id);
		
		// cartService를 사용하여 DB에 상품 추가
		if(cartService.cart_add(vo) == 1) {
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}else {
			entity = new ResponseEntity<String>("fail", HttpStatus.OK);
		}
		
		return entity;
	}
	
	//장바구니 추가, 주문 페이지로 리다이렉트
	@GetMapping("/direct_card_add")
	public String direct_card_add(CartVO vo, HttpSession session) {
		
		// 로그인한 사용자 DB작업
		String mbsp_id = ((MemberVO) session.getAttribute("loginStatus")).getMbsp_id();
		vo.setMbsp_id(mbsp_id);
		
		// 사용자 DB에 저장된 장바구니 데이터 반환 
		cartService.cart_add(vo);
		
		return "redirect:/order/order_info";
	}
	
	//장바구니 목록
	@GetMapping("/cart_list")
	public void cart_list(HttpSession session, Model model) {
		
		// 로그인한 사용자 세션
		String mbsp_id = ((MemberVO) session.getAttribute("loginStatus")).getMbsp_id();
		
		// 로그인한 사용자의 상품 목록 
		List<CartListDTO> cart_list = cartService.cart_list(mbsp_id);
		
		// 윈도우OS시스템에 따른 이미지 폴더 경로 변경
		cart_list.forEach(vo -> {
			vo.setPro_up_folder(vo.getPro_up_folder().replace("\\", "/"));
		});
		
		// 장바구니 상품목록 모델
		model.addAttribute("cart_list", cart_list);
		
		// 장바구니 총 금액 모델
		if(cart_list.size() != 0) {
			model.addAttribute("cart_tot_price", cartService.cart_tot_price(mbsp_id));
		}
		
	}
	
	//이미지 데이터 불러오기
	@ResponseBody
	@GetMapping("/displayImage")
	public ResponseEntity<byte[]> displayFile(String folderName, String fileName) throws IOException {	
		
		// 지정된 폴더와 파일 이름에 해당하는 이미지 데이터 반환
		// 이미지 파일이 저장된 기본 경로로, 'folderName'과 결합하여 전체 파일 경로 생성
		return FileUtils.getFile(uploadPath + folderName, fileName);
	}
	
	//수량변경
	@ResponseBody
	@PostMapping("/cart_amount_change")
	public ResponseEntity<String> cart_amount_change(Long cart_code, int cart_amount){
		
		ResponseEntity<String> entity = null;
		
		// 장바구니 항목 수량 변경
		if(cartService.cart_amount_change(cart_code, cart_amount) ==  1) {
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}else {
			entity = new ResponseEntity<String>("fail", HttpStatus.OK);
		}
		
		return entity;
	}
	
	//장바구니 삭제
	@ResponseBody
	@PostMapping("/cart_delete")
	public ResponseEntity<String> cart_delete(Long cart_code){
		
		ResponseEntity<String> entity = null;
		
		// cart_code에 해당하는 상품 장바구니에서 삭제
		if(cartService.cart_delete(cart_code) == 1) {
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}else {
			entity = new ResponseEntity<String>("fail", HttpStatus.OK);
		}
		
		return entity;
	}
	
	
	//장바구니 비우기
    @GetMapping("/cart_empty")
    public String cart_empty(HttpSession session) {
    	
        String mbsp_id = ((MemberVO) session.getAttribute("loginStatus")).getMbsp_id();
        
        // 사용자의 모든 장바구니 항목 삭제
        cartService.cart_empty(mbsp_id);
        
        return "redirect:/cart/cart_list";
    }
	
}

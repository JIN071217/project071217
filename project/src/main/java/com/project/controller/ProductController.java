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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.domain.CategoryVO;
import com.project.domain.MemberVO;
import com.project.domain.ProductVO;
import com.project.dto.CartListDTO;
import com.project.dto.Criteria;
import com.project.dto.PageDTO;
import com.project.service.CartService;
import com.project.service.MemberService;
import com.project.service.ProductService;
import com.project.util.FileUtils;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/product/*")
public class ProductController {

	// 상품 서비스 의존성 주입
	@Setter(onMethod_ = {@Autowired})
	private ProductService productService;
	
	// 장바구니 서비스 의존성 주입
	@Setter(onMethod_ = {@Autowired})
	private CartService cartService;
	
	// 회원 서비스 의존성 주입
	@Setter(onMethod_ = {@Autowired})
	private MemberService memberService;
	
	// 파일 업로드폴더경로 의존성 주입
	@Resource(name = "uploadPath") 
	private String uploadPath; 
	
	// 1차 카테고리에 따른 2차 카테고리 목록 조회
	@ResponseBody
	@GetMapping("/subCategory/{cat_code}") 
	public ResponseEntity<List<CategoryVO>> subCategory(@PathVariable("cat_code") Integer cat_code){
		
		ResponseEntity<List<CategoryVO>> entity = null;
		
		entity = new ResponseEntity<List<CategoryVO>>(productService.subCategoryList(cat_code), HttpStatus.OK);
		
		return entity;
	}
	
	// 상품 목록 조회 및 로그인 시, 사용자 장바구니 데이터 표시
	@GetMapping("/pro_list/{cat_code}/{cat_name}")
	public String pro_list(
			@ModelAttribute("cri")Criteria cri, 		// 페이지 정보 및 검색 기준 Criteria 객체 바인딩
			@PathVariable("cat_code") Integer cat_code, // 카테고리 코드를 경로 변수로부터 받아옴	
			@PathVariable("cat_name") String cat_name,  // 카테고리 이름을 경로 변수로부터 받아옴
			Model model, HttpSession session) {
		
		// 해당 카테고리에 속하는 상품 목록 조회
		List<ProductVO> pro_list = productService.pro_list(cat_code, cri);
		
		// 상품 목록의 각 상품의 이미지 경로의 "\\"를  "/"로 변경
		pro_list.forEach(vo -> {
			vo.setPro_up_folder(vo.getPro_up_folder().replace("\\", "/"));
		});
		
		// 조회된 상품 목록을 모델에 추가
		model.addAttribute("pro_list", pro_list);
		
		// 해당 카테고리에 속하는 상품의 총 개수 조회
		int count = productService.pro_count(cat_code, cri);
		
		// 페이지 정보 생성
		PageDTO pageDTO = new PageDTO(count, cri);
		
		// 페이지 정보를 모델에 추가
		model.addAttribute("pageMaker", pageDTO);
		
		// 로그인 사용자의 경우
		if (session.getAttribute("loginStatus") != null) {
			
			// 현재 로그인한 사용자의 아이디를 세션에서 조회
			String mbsp_id = ((MemberVO) session.getAttribute("loginStatus")).getMbsp_id();
			
			// 로그인한 사용자의 장바구니 목록 조회
			List<CartListDTO> cart_list = cartService.cart_list(mbsp_id);
			
			// 장바구니에 상품이 있을 경우
			if (!cart_list.isEmpty()) {
				
				//주문 이미지
				cart_list.forEach(cartimg -> {
					cartimg.setPro_up_folder(cartimg.getPro_up_folder().replace("\\", "/"));
				});

				//주문 상품명
				String order_productName = cart_list.get(0).getPro_name() + "외" + (cart_list.size() - 1) + " 건";
				model.addAttribute("order_productName", order_productName);
			
				//주문 목록
				model.addAttribute("cart_list", cart_list);
			
				//주문 총금액
				model.addAttribute("cart_tot_price", cartService.cart_tot_price(mbsp_id));
			}

		}
		
		return "/product/pro_list";
	}
	
	@ResponseBody
	@GetMapping("/displayImage")
	public ResponseEntity<byte[]> displayFile(String folderName, String fileName) throws IOException{
		
		// 해당 폴더 이미지 파일을 바이트 배열로 읽어와 반환
		return FileUtils.getFile(uploadPath + folderName, fileName);
	}
	
	// 상품상세-설명
	@GetMapping("pro_detail")
	public void pro_detail(Integer pro_num, @ModelAttribute("cri") Criteria cri, Model model,HttpSession session) {
		
		// 상품 번호를 이용하여 상품의 상세 정보를 조회
		ProductVO vo = productService.pro_detail(pro_num);
		// 윈도우OS에서 이미지를 출력하기위해 이미지 경로 "\" 를 "/"로 변경
		vo.setPro_up_folder(vo.getPro_up_folder().replace("\\", "/"));
		
		// 조회된 상품의 상세 정보를 뷰에 전달하기 위해 model 객체에 추가한다.
		model.addAttribute("productVO", vo);
		
		// 로그인시 장바구니 데이터 표시
		if (session.getAttribute("loginStatus") != null) {
			
			String mbsp_id = ((MemberVO) session.getAttribute("loginStatus")).getMbsp_id();
			
			List<CartListDTO> cart_list = cartService.cart_list(mbsp_id);
			
			// 장바구니 데이터
			if (!cart_list.isEmpty()) {
				
				//주문 이미지
				cart_list.forEach(cartimg -> {
					cartimg.setPro_up_folder(cartimg.getPro_up_folder().replace("\\", "/"));
				});

				//주문 상품명
				String order_productName = cart_list.get(0).getPro_name() + "외" + (cart_list.size() - 1) + " 건";
				model.addAttribute("order_productName", order_productName);
			
				//주문 목록
				model.addAttribute("cart_list", cart_list);
			
				//주문 총금액
				model.addAttribute("cart_tot_price", cartService.cart_tot_price(mbsp_id));
			}

		}
		
	}
	
	
}

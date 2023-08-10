package com.project.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.domain.AdOrderDetailVO;
import com.project.domain.OrderVO;
import com.project.dto.Criteria;
import com.project.dto.PageDTO;
import com.project.service.AdOrderService;
import com.project.util.FileUtils;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/admin/order/")
public class AdOrderController {

	// 주문관련 작업을 위한 의존성 주입
	@Setter(onMethod_ = {@Autowired})
	private AdOrderService adOrderService;
	
	// 업로드폴더 의존성 주입
	@Resource(name = "uploadPath") // servlet-context.xml 참조.
	private String uploadPath;  // C:\\dev\\upload\\pds\\
	
	// 검색 조건, 시작 및 종료 날짜를 기반으로 주문 목록 표시
	@GetMapping("/order_list")
	public void orderList(@ModelAttribute("cri") Criteria cri, 
						  @ModelAttribute("sDate") String sDate, 
						  @ModelAttribute("eDate") String eDate, 
						  Model model) {
		log.info("시작날자: " + sDate);
		log.info("종료날자: " + eDate);
		
		// 주문 목록을 가져와 모델에 추가
		List<OrderVO> orderList = adOrderService.orderList(cri, sDate, eDate);
		model.addAttribute("orderList", orderList);
		
		// 주문의 총 개수를 가져와 페이징 설정
		int totalCount = adOrderService.getTotalCount(cri, sDate, eDate);
		model.addAttribute("pageMaker", new PageDTO(totalCount, cri));
		
	}
	
	
	// 주문 상세 정보
	@ResponseBody
	@GetMapping("/order_detail")
	public ResponseEntity<List<AdOrderDetailVO>> orderDetail(Long ord_code) {
		
		ResponseEntity<List<AdOrderDetailVO>> entity = null;
		
		entity = new ResponseEntity<List<AdOrderDetailVO>>(adOrderService.orderDetail(ord_code), HttpStatus.OK);
		
		return entity;
		
	}
	
	//주문상세 디테일이미지
	@ResponseBody
	@GetMapping("/displayImage")
	public ResponseEntity<byte[]> displayFile(String folderName, String fileName) throws IOException {
		
		return FileUtils.getFile(uploadPath + folderName, fileName);
	}
	
	
	//주문정보 삭제
	@PostMapping("/orderInfoDelete")
	@ResponseBody
	public ResponseEntity<String> orderInfoDelete(Long ord_code) {
		ResponseEntity<String> entity = null;
		
		// db작업
		adOrderService.orderInfoDelete(ord_code);
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		return entity;
	};

	//주문상세 삭제
	@ResponseBody
	@PostMapping("/order_detail_product_delete")
    public ResponseEntity<String> orderDetailProductDelete(Long ord_code, Integer pro_num) {
        adOrderService.orderDetailProductDelete(ord_code, pro_num);

        // 상세 내역이 없는 경우 주문 목록에서 해당 주문을 삭제
        boolean isOrderDetailEmpty = adOrderService.isOrderDetailEmpty(ord_code);
        if (isOrderDetailEmpty) {
            adOrderService.deleteOrder(ord_code);
        } else {
            // 상세 내역이 남아있는 경우 주문 금액을 갱신
            adOrderService.refreshOrderAmount(ord_code);
        }

        return new ResponseEntity<>("success", HttpStatus.OK);
    }


	
}

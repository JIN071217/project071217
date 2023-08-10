package com.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.dto.EmailDTO;
import com.project.service.EmailService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/email/*")
public class EmailController {
	
	@Setter(onMethod_ = {@Autowired})
	private EmailService emailService;
	
	@GetMapping("/send") 
	public ResponseEntity<String> send(EmailDTO dto, HttpSession session){
		
		ResponseEntity<String> entity = null;
		
		//인증코드 6자리 랜덤 생성
		String authCode = "";
		for(int i = 0; i < 6; i++) {
			authCode += String.valueOf((int)(Math.random() * 10));
		}
		
		log.info("인증코드: " + authCode);
		
		// 생성된 인증코드를 세션에 저장, 이후 사용자가 제출한 인증 코드와 비교하기 위함
		session.setAttribute("authCode", authCode);
		
		//인증코드 메일발송
		//인증코드 성공적으로 이루어지면 "success" 메시지와 함께 상태코드 200 반환
		try {
			emailService.sendMail(dto, authCode);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		//예외가 발생하면 상태코드 500 반환하여 클라이언트에 알려준다.
		}catch (Exception ex) {
			ex.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	//인증코드 확인
	@GetMapping("/confirmAuthcode")
	public ResponseEntity<String> confirmAuthCode(String authCode, HttpSession session){
		
		ResponseEntity<String> entity = null;
		
		String confirm_authCode = (String) session.getAttribute("authCode");
		
//		log.info("인증코드확인: " + confirm_authCode);
		
		//인증코드가 일치하면 "success"메시지와 함께 상태코드 200 반환
		if(authCode.equals(confirm_authCode)) {
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
			// 인증이 성공적으로 이루어지면, 세션에서 인증코드를 제거
			session.removeAttribute("authCode");
		//인증코드가 일치하지않으면 "fail"메시지와 함께 상태코드 200 반환
		}else {
			entity = new ResponseEntity<String>("fail", HttpStatus.OK);
		}
		
		return entity;
	}
	

}

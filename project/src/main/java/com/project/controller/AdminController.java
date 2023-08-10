package com.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.domain.AdminVO;
import com.project.dto.AdminDTO;
import com.project.service.AdminService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Setter(onMethod_ = {@Autowired})
	private AdminService adminService;

	@Setter(onMethod_ = {@Autowired})	
	private PasswordEncoder passwordEncoder;
	
	//관리자 로그인 페이지 + 프로젝트 편의성을 위해 사용자UI Header부분에 Modal 관리자 로그인 구현
	@GetMapping("")
	public String adLogin() {
		
		return "/admin/adLogin";
	}
	
	//관리자로그인, 매핑 주소: admin_ok
	@PostMapping("/admin_ok")
	public String admin_ok(AdminDTO dto, HttpSession session, RedirectAttributes rttr) {
		
		log.info("관리자 로그인 정보: " + dto);
		
		AdminVO vo = adminService.admin_ok(dto.getAdmin_id());
		
		String url = "";
		String msg = "";
		
		if(vo != null) {
			if(passwordEncoder.matches(dto.getAdmin_pw(), vo.getAdmin_pw())) {
				
				// 로그인한 관리자 정보를 세션형태로 저장
				session.setAttribute("adminStatus", vo);
				
				url = "admin/admin_menu"; // 관리자 메인 페이지로 이동
				
			} else {
				//비밀번호 틀린경우
				msg = "failPW";
				url = "admin/";
			}
			}else {
				//아이디가 틀린경우
				msg = "failPW";
				url = "admin/";
			}
		
			// 로그인 결과 메시지 저장 (로그인 페이지에서 출력용)
			rttr.addFlashAttribute("msg", msg);
			
			// 로그인 검사 후 리다이렉트
			return "redirect:/" + url;
	}
	
	@GetMapping("/admin_menu")
	public void admin_menu() {
		
	}
}

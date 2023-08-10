package com.project.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.domain.MemberVO;
import com.project.dto.CartListDTO;
import com.project.dto.LoginDTO;
import com.project.service.CartService;
import com.project.service.MemberService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Setter(onMethod_ = {@Autowired})
	private MemberService memberService;
	
	@Setter(onMethod_ = {@Autowired})
	private PasswordEncoder passwordEncoder;
	
	//cartList를 불러오기위한 주입작업
	@Setter(onMethod_ = {@Autowired})
	private CartService cartService;
	
	
	//회원가입 폼 GET
	@GetMapping("join")
	public void join() {
		log.info("회원가입 폼");
	}
	
	//회원가입 폼 POST
	@PostMapping("/join")
	public String join(MemberVO vo) {
		
		// 평문 텍스트인 비밀번호를 스프링시큐리티(PasswordEncoder)사용, 암호화클래스를 이용하여 암호화한후,
		vo.setMbsp_password(passwordEncoder.encode(vo.getMbsp_password()));
		// 회원정보를 DB에 저장
		memberService.join(vo);
		// 성공적으로 저장되면, 편의성을 위해 로그인 페이지로 이동
		return "redirect:/member/login";
	}
	
	//아이디 중복체크
	//@ResponsBody를 사용하여 메서드가 JSON형식으로 데이터반환하여, 클라이언트에게 전송
	@ResponseBody
	@GetMapping("/idCheck")
	//ResponseEntity는 HTTP응답을 나타내는 Spring Framework클래스로(상태코드, 응답본문, 헤더 등 포함된다)
	public ResponseEntity<String> idCheck(String mbsp_id){
		
		log.info("아이디 중복체크 :" + mbsp_id);
		// 상태코드를 반환하기 위해, 변수를 null로 초기화
		ResponseEntity<String> entity = null;
		
		// 조건문을 통해, 중복값이 있을경우 no or yes 반환, JSP에서 다른메시지로 수정
		String isUse = "";
		if(memberService.idCheck(mbsp_id) != null) {
			isUse = "no";
		}else {
			isUse = "yes";
		}
		// HTTP상태 코드 200(HttpSatus.OK)를 반환하여 클라이언트에게 성공적으로 처리되었음 알린다.
		entity = new ResponseEntity<String>(isUse, HttpStatus.OK);
		
		return entity;
		
	}
	
	//로그인 구현
	@GetMapping("login")
	public void login() {
		log.info("로그인 폼");
	}
	
	// 사용자 로그인 정보를 받아와서, 로그인 처리 수행
	@PostMapping("/login")
	public String login(LoginDTO dto, HttpSession session, RedirectAttributes rttr, HttpServletRequest request, HttpServletResponse response) {
		// 전달받은 로그인 정보를 로그로 출력
		log.info("로그인 정보: " + dto);
		
		// 로그인 정보로 DB에서 해당 사용자 아이디를 조회
		MemberVO vo = memberService.login(dto.getMbsp_id());
		
		// 아이디 저장 체크박스 값 받기
		boolean rememberId = (request.getParameter("remember_mbsp_id") != null);
		
		if(rememberId) {
		    // "아이디 저장" 체크박스가 선택되었으면 쿠키에 저장
			Cookie idCookie = new Cookie("saved_mbsp_id", dto.getMbsp_id());
			idCookie.setMaxAge(60*60*1); // 1시간동안 쿠키에 저장
			response.addCookie(idCookie);
		} else {
			// "아이디 저장" 체크박스가 선택되지 않았으면 쿠키를 삭제
			Cookie idCookie = new Cookie("saved_mbsp_id", "");
			idCookie.setMaxAge(0);
			response.addCookie(idCookie);
		}

		
		String url = ""; // 리다이렉트할 URL을 저장하기 위한 변수
		String msg = ""; // 리다이렉트 이후에 화면에 보여줄 메시지를 저장하기 위한 변수
		
		// 사용자 정보가 존재하는 경우
		if(vo != null) {
			// 전달받은 비밀번호와 DB에 저장된 비밀번호를 비교하여 로그인 처리
			if(passwordEncoder.matches(dto.getMbsp_password(), vo.getMbsp_password())) {
				
				// 로그인한 사용자의 회원정보를 "loginStatus"이름으로 세션으로 저장, 세션을 통해 로그인 상태 유지
				session.setAttribute("loginStatus", vo);

				// 로그인이 되었을때 실행
				String targetUrl = (String)session.getAttribute("dest");
				
				// 리다이렉트 이전 페이지 URL이 존재하는 경우, 해당 페이지로 이동
				url = (targetUrl != null) ? targetUrl : "/";
				
				// 리다이렉트 이전 페이지 URL를 세션에서 제거 "/"; 으로 이동
				if(targetUrl != null) {
					session.removeAttribute("dest");
				}

			}else {
				// 비밀번호가 틀린 경우, 메시지 출력
				url = "/member/login";
				msg = "failPW";
			}
		}else {
			// 아이디가 틀린 경우, 메시지 출력
			url = "/member/login";
			msg = "failID";
		}
		
		// 리다이렉트 시에 JSP에서 수정된 메세지를 전달하기 위해, Flash Attribute로 설정
		rttr.addFlashAttribute("msg", msg); // JSP에서 jQuery Script를 통해 메시지변경 사용
		
		// 로그인 처리 후 리다이렉트할 URL 반환
		return "redirect:" + url;
	}
	
	//로그아웃 구현
	@GetMapping("logout")
	public String logout(HttpSession session) {
		
		// 세션에 저장된 로그인정보 제거
		session.invalidate();
		
		return "redirect:/";
	}
	
	//회원정보 수정 및 마이페이지 조회  GET
	//Model - Spring MVC에서 사용되는 모델 객체로 JSP로 데이터를 전달하는 역할, JSP에서는 해당 데이터를 출력,활용
	@GetMapping(value = {"/modify", "/mypage"})
	public void modify(Model model, HttpSession session, Model cartmodel) {
		
		// "loginStatus"이름으로 저장된 세션데이터를 가져온다.
		// 세션은 모든 데이터를 Object타입으로 다뤄야 하기때문에, "ModelVO"객체로 사용하려면 명시적으로 casting작업이 필요하다.
		// 세션은 스코프가 다른 경우라도, 세션에 저장된 데이터를 활용할 수 있다.
		String mbsp_id = ((MemberVO) session.getAttribute("loginStatus")).getMbsp_id();
		
		// 로그인한 사용자 정보를 담아서  model객체에 memberVO 전달한다.
		// "memberVO"는 JSP에서 사용할 때, 데이터를 가져와 "${memberVO}" 해당 이름을 통해 데이터를 참조
		model.addAttribute("memberVO", memberService.login(mbsp_id));
		
		//cartList 데이터
		//장바구니 상품
		List<CartListDTO> cart_list = cartService.cart_list(mbsp_id);
		
		// 장바구니가 비어있는지 확인한다.
	    if (!cart_list.isEmpty()) {
	        // 장바구니에 상품이 있는 경우
	    	
	    	// 장바구니에 있는 상품들의 pro_up_folder 값을 수정하여 파일 경로를 정상적인 형태로 변경
	        cart_list.forEach(vo -> {
	            vo.setPro_up_folder(vo.getPro_up_folder().replace("\\", "/"));
	        });
	        
	        // 장바구니의 첫 번째 상품 이름과 장바구니에 있는 상품 개수를 조합하여 order.productName변수에 저장
	        // 예) 상품1의 2건
	        String order_productName = cart_list.get(0).getPro_name() + "외" + (cart_list.size() - 1) + " 건";
	        
	        // 장바구니에 있는 상품들과 관련된 주문자 정보를 가져와 cartmodel에 추가한다.
	        cartmodel.addAttribute("memberVO", memberService.login(mbsp_id));
	        
	        // order_productName을 cartmodel에 추가하여 JSP에서 해당 값을 사용할 수 있다.
	        cartmodel.addAttribute("order_productName", order_productName);
	        
	        // 장바구니에 있는 상품들을 cartmodel에 추가하여 JSP에서 해당 정보를 반환
	        cartmodel.addAttribute("cart_list", cart_list);
	        
	        // 장바구니의 총 가격을 계산하여 cartmodel에 추가
	        cartmodel.addAttribute("cart_tot_price", cartService.cart_tot_price(mbsp_id));   

	    }
		
	}
	
	//회원정보 수정 POST , 패스워드 일치했을시 회원수정 정상 동작
	@PostMapping("/modify")
	public String modify(MemberVO vo, HttpSession session, RedirectAttributes rttr) {
		
		log.info("MemberVO: " + vo);


		String url = ""; // 리다이렉트할 URL을 저장하기 위한 변수
		String msg = ""; // 리다이렉트 이후에 화면에 보여줄 메시지를 저장하기 위한 변수
		
		// 세션으로부터 로그인된 사용자 정보를 확보
		String mbsp_id = ((MemberVO) session.getAttribute("loginStatus")).getMbsp_id();
		
		// DB에 저장되어있는 로그인한 사용자의 암호화된 비밀번호를 읽는 작업
		String db_mbsp_password = ((MemberVO) memberService.login(mbsp_id)).getMbsp_password();
		
		// .matches를 통해 입력된 비밀번호와 DB에 저장된 암호화된 비밀번호를 비교하여, 일치하는지 확인한다.
		if(passwordEncoder.matches(vo.getMbsp_password(), db_mbsp_password)) {
			
			//회원정보 수정 작업
			memberService.modify(vo);
			
			msg = "modify"; // 메시지를 "modify"로 설정하여 리다이렉트 이후, 성공메시지 출력
			url = "/member/modify";      // 회원 정보 수정 시, 메인 페이지로 리다이렉트
		
		}else {
			msg = "failPW"; // 메시지를 "failPW"로 설정하여 리다이렉트 이후, 실패 메시지 출력
			url = "/member/modify"; // 비밀번호가 틀렸을 시, 실패 메시지 출력과함께 수정페이지로 리다이렉트 
		}
		
		// 리다이렉트 시에 JSP에서 수정된 메세지를 전달하기 위해, Flash Attribute로 설정
		rttr.addFlashAttribute("msg", msg); // JSP에서 jQuery Script를 통해 메시지변경 사용
		
		// 조건에 따른 URL로 리다이렉트
		return "redirect:" + url;
	}
	
	// 비밀번호 변경 작업
	// 기존 비밀번호와 새로운 비밀번호를 파라미터로 받고
	@PostMapping("/pwchange")
	public ResponseEntity<String> pwchange(String old_mbsp_password, String new_mbsp_password, HttpSession session){
		
		ResponseEntity<String> entity = null;
		String body = "";
		
		//기존 비밀번호 & 신규 비밀번호를 로그에 출력
		log.info("기존 비밀번호: " + old_mbsp_password);
		log.info("신규 비밀번호: " + new_mbsp_password);
		
		// 현재 로그인된 사용자 정보를 세션에서 가져온다.
		MemberVO vo = (MemberVO) session.getAttribute("loginStatus");
		
		// 이후, 세션에서 가져온 사용자 정보로부터 아이디를 얻어온다.
		String mbsp_id = vo.getMbsp_id();
		
		// DB에서 해당 사용자의 암호된 비밀번호를 가져오는 작업
		String db_mbsp_password = ((MemberVO) memberService.login(mbsp_id)).getMbsp_password();
		
		// .matches를 통해 입력된 비밀번호와 DB에 저장된 암호화된 비밀번호를 비교하여, 일치하는지 확인한다.
		if(passwordEncoder.matches(old_mbsp_password, db_mbsp_password)) {
			// 새로운 비밀번호를 암호화 위해 PasswordEncoder.encode를 이용하여 암호화 처리
			String enc_mbsp_password = passwordEncoder.encode(new_mbsp_password);
			
			// 암호화된 새로운 비밀번호로 회원의 비밀번호를 변경하는 메서드 호출
			memberService.pwchange(mbsp_id, enc_mbsp_password);
			
			// 비밀번호 변경에 성공한 경우 응답 메시지, JSP jQuery Script 메시지변경 "비밀번호가 변경되었습니다."
			body = "success";
		}else {
			// 비밀번호 변경에 실패한 경우 응답 메시지, JSP jQuery Script 메시지변경 "비밀번호를 확인해주세요."
			body = "failPW";
		}
		entity = new ResponseEntity<String>(body,HttpStatus.OK);
		return entity;
	}
	
	//회원탈퇴 작업
	@PostMapping("/delete")
	public ResponseEntity<String> delete(String mbsp_password, HttpSession session){
		
		ResponseEntity<String> entity = null;
		String body = "";
		
		String mbsp_id = ((MemberVO) session.getAttribute("loginStatus")).getMbsp_id();
		
		//암호화된 비밀번호를 DB에서 읽어옴
		String db_mbsp_password = ((MemberVO) memberService.login(mbsp_id)).getMbsp_password();
		
		if(passwordEncoder.matches(mbsp_password, db_mbsp_password)) {
			//회원 탈퇴작업
			// 1. 장바구니에 있는 상품들을 삭제
			cartService.cart_empty(mbsp_id);
			// 2. 해당 사용자의 회원 정보를 DB에서 삭제
			memberService.delete(mbsp_id);
			// 3. 회원 탈퇴 시 현재 세션을 종료하여 로그아웃 처리
			session.invalidate(); 
			
			body = "success";
		}else {
			body = "failPW";
		}
		
		
		// 회원 탈퇴 처리결과를 ResponseEntity 객체에 담아 상태코드 200로 반환
		entity = new ResponseEntity<String>(body, HttpStatus.OK);
		return entity;
	}
	
	
}

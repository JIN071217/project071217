package com.project.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
public class EmailDTO {

	private String senderName;	 // 발신자 이름
	private String senderMail;	 // 발신자 메일주소
	private String receiverMail; // 수신자 메일주소, 즉 회원메일 주소로 사용
	private String sunject;		 // 이메일 제목
	private String message;      // 이메일 본문내용
	
	public EmailDTO() {
		this.senderName = "BIGBAG"; 
		this.senderMail = "www.BIGBAG.com"; 
		this.sunject = "BIGBAG 회원가입 메일인증 코드입니다."; 
		this.message = "메일인증을 위한 인증코드를 확인하고, 회원가입 인증코드를 입력해주세요.";
	}
}

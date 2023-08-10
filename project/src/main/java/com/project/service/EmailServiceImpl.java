package com.project.service;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.project.dto.EmailDTO;

import lombok.Setter;

@Service
public class EmailServiceImpl implements EmailService {

	// email-config.xml의 mailSender Bean주입을 받는다.
	@Setter(onMethod_ = {@Autowired})
	private JavaMailSender mailSemder;

	@Override
	public void sendMail(EmailDTO dto, String message) {
		
		//메일 구성정보를 담당하는 객체 (받는 이, 보내는 이, 전자우편 주소, 본문내용)
		MimeMessage msg = mailSemder.createMimeMessage();
		
		try {
			//받는 사람의 메일 주소설정
			msg.addRecipient(RecipientType.TO, new InternetAddress(dto.getReceiverMail()));
			//보내는 사람의 메일 주소와 이름 설정
			msg.addFrom(new InternetAddress[] {new InternetAddress(dto.getSenderMail(),dto.getMessage())});
			//메일 제목 설정
			msg.setSubject(message, "utf-8");
			
			// 실제로 이메일 메시지를 전송
			mailSemder.send(msg);
		}catch (Exception ex) {
			// 예외가 발생한 경우 스택 트레이스를 출력
			// 실제 프로덕션 코드에서는 로깅 기능을 사용하여 오류를 기록하는 것이 좋다.
			ex.printStackTrace();
		}
	}
		
}

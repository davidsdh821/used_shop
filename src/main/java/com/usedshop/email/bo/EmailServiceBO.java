package com.usedshop.email.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailServiceBO {
    @Autowired
    private JavaMailSender javaMailSender;
    
	
    public String insertEmailNumberAndsendEmail(String email) {
    	// SimpleMailMessage (단순 텍스트 구성 메일 메시지 생성할 때 이용)
    	SimpleMailMessage simpleMessage = new SimpleMailMessage();
    	//수신 대상
    	String mail_recipient;
    	
    	simpleMessage.setTo(mail_recipient);

    	
    	//메일 제목
    	simpleMessage.setSubject("Subject Sample");
    	
    	//메일 내용
    	simpleMessage.setText("Text Sample");
    	
        // 메일 발송
        javaMailSender.send(simpleMessage);    	
    	
        
        return 
    }

}

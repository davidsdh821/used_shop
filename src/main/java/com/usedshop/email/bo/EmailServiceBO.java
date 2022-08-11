package com.usedshop.email.bo;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.usedshop.email.dao.EmailServiceDAO;

@Service
public class EmailServiceBO {
    @Autowired
    private JavaMailSender javaMailSender;
    
    @Autowired
    private EmailServiceDAO emailServiceDAO;
	
    public void insertEmailNumberAndsendEmail(String email) {
    	// SimpleMailMessage (단순 텍스트 구성 메일 메시지 생성할 때 이용)
    	SimpleMailMessage simpleMessage = new SimpleMailMessage();
    	//수신 대상
    	String mail_recipient = "";
    	mail_recipient = email;
    	
    	simpleMessage.setTo(mail_recipient);

    	
    	//메일 제목
    	simpleMessage.setSubject("인증코드 입니다");
    	
    	//메일 내용
    	Random random = new Random();
		int createNum = 0;  			//1자리 난수
		String ranNum = ""; 			//1자리 난수 형변환 변수
        int letter    = 6;			//난수 자릿수:6
		String resultNum = "";
		for (int i=0; i<letter; i++) { 
			createNum = random.nextInt(9);		//0부터 9까지 올 수 있는 1자리 난수 생성
			ranNum =  Integer.toString(createNum);  //1자리 난수를 String으로 형변환
			resultNum += ranNum;			//생성된 난수(문자열)을 원하는 수(letter)만큼 더하며 나열
		}	
		int number = Integer.parseInt(resultNum); // string을 int로 변환
		
    	simpleMessage.setText(resultNum);
    	
        // 메일 발송
        javaMailSender.send(simpleMessage);    	
    	
        
        emailServiceDAO.insertEmailNumberAndsendEmail(email, number);
    }
    
    public int deleteEmailByNumber(String email, int number) {
    	
    	return emailServiceDAO.deleteEmailByNumber(email, number);
    }
    
    
    
    
    
    

}

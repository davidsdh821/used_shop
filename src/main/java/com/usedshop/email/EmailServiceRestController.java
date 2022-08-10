package com.usedshop.email;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestParam;

import com.usedshop.email.bo.EmailServiceBO;


public class EmailServiceRestController {
	
    @Autowired
    private EmailServiceBO emailServiceBO;
    public Map<String, Object> sendMail(
    		@RequestParam("email") String email
    		) {
        
    	
    	emailServiceBO.insertEmailNumberAndsendEmail(email);
    	
     Map<String, Object> result = new HashMap<>();
        result.put("result", "이메일을 전송했습니다");
    	
        
    	
        return result;
    }
	
	
}

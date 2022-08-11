package com.usedshop.email;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.usedshop.email.bo.EmailServiceBO;


@RequestMapping("/email")
@RestController
public class EmailServiceRestController {
	
    @Autowired
    private EmailServiceBO emailServiceBO;
    
    @PostMapping("/email_is_duplicated")
    public Map<String, Object> sendMail(
    		@RequestParam("email") String email
    		) {
        
    	
    	emailServiceBO.insertEmailNumberAndsendEmail(email);
    	
     Map<String, Object> result = new HashMap<>();
        result.put("result", "success");
    	
        
    	
        return result;
    }
    
    @DeleteMapping("/email_duplicated_delete")
    public Map<String, Object> deleteAndSelectMail(
    		@RequestParam("email") String email,
    		@RequestParam("number") int number) {
    	 Map<String, Object> result = new HashMap<>();
    	int resultNumber = emailServiceBO.deleteEmailByNumber(email, number);
    	
    	if(resultNumber == 0) {
    		result.put("result", "fail");
    	} else {
    		result.put("result", "success");
    	}
    	

        return result;
    }
    
    
    
	
	
}

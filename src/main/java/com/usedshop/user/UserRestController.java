package com.usedshop.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.usedshop.user.bo.UserBO;

@RequestMapping("/user")
@RestController
public class UserRestController {
	
	@Autowired 
	private UserBO userBO;
	
	
	@RequestMapping("/overlap_check")
	public Map<String, Object> overlap(
			@RequestParam("loginId") String loginId
			) {
		
		boolean exist = userBO.getUserId(loginId);
		Map<String, Object> result = new HashMap<>();
		
		result.put("result", exist);
		
		
		
		return result;
	}
	
	
	

}

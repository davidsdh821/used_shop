package com.usedshop.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/user")
@Controller
public class UserController {
	
	//http://localhost/user/user_signup_view
	@RequestMapping("/user_signup_view")
	public String test(Model model) {
		
		model.addAttribute("gnbViewName", "include/sign_up_gnb");
		model.addAttribute("viewName", "user/sign_up");
		
		return "template/layout";
	}
	
}

package com.usedshop.wish;

import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.usedshop.post.model.CardView;
import com.usedshop.wish.bo.WishBO;

@RequestMapping("/wish")
@Controller
public class WishController {
	
	@Autowired
	private WishBO wishBO;
	
	//http://localhost/wish/wish_mywish_view
	@RequestMapping("/wish_mywish_view")
	public String test(Model model,
			HttpSession session) {
		
		Object userIdObject = session.getAttribute("userId");
		int userId = (int)userIdObject;
		List<CardView> card = wishBO.getWishViewList(userId);
		
		model.addAttribute("card", card);
		
		model.addAttribute("gnbViewName", "include/gnb");
		model.addAttribute("viewName", "wish/mywish_view");
		
		
		return "template/layout";
	}

}

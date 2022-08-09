package com.usedshop.post;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/post")
@Controller
public class PostController {

	//http://localhost/post/post_list_view
		@RequestMapping("/post_list_view")
		public String PostListView(Model model) {
			
			model.addAttribute("gnbViewName", "include/gnb");
			model.addAttribute("viewName", "post/post_list_view");
			
			
			return "template/layout";
		}

		
		//http://localhost/post/post_create_view
		@RequestMapping("/post_create_view")
		public String PostCreateView(Model model) {
			
			model.addAttribute("gnbViewName", "include/gnb");
			model.addAttribute("viewName", "post/post_create_view");
			
			
			return "template/layout";
		}

		//http://localhost/post/post_page_view
		@RequestMapping("/post_page_view")
		public String PostPageView(Model model) {
			
			model.addAttribute("gnbViewName", "include/gnb");
			model.addAttribute("viewName", "post/post_page_view");
			
			
			return "template/layout";
		}
		
		//http://localhost/post/post_mypage_view
		@RequestMapping("/post_mypage_view")
		public String PostMyPageView(Model model) {
			
			model.addAttribute("gnbViewName", "include/gnb");
			model.addAttribute("viewName", "post/post_mypage_view");
			
			
			return "template/layout";
		}

		
	
}

package com.usedshop.post;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.usedshop.post.bo.PostBO;
import com.usedshop.post.model.CardView;
import com.usedshop.post.model.PageView;

@RequestMapping("/post")
@Controller
public class PostController {
	@Autowired
	private PostBO postBO;
	
	
	//http://localhost/post/post_list_view
		@RequestMapping("/post_list_view")
		public String PostListView(Model model) {
			List<CardView> card = postBO.getCardViewList();
			
			model.addAttribute("card", card);
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
		public String PostPageView(
				@RequestParam("postId") int postId,
				Model model) {
			postBO.setPostView(postId);
			PageView page = postBO.getPostById(postId);
			
			
			
			model.addAttribute("result", page);
			model.addAttribute("gnbViewName", "include/gnb");
			model.addAttribute("viewName", "post/post_page_view");
			
			
			return "template/layout";
		}
		
		//http://localhost/post/post_mypage_view
		@RequestMapping("/post_mypage_view")
		public String PostMyPageView(Model model,
			 HttpSession session) {
			Object userIdObject = session.getAttribute("userId");
			int userId = (int)userIdObject;
			
			List<CardView> card = postBO.getMyCardViewList(userId);
			model.addAttribute("card", card);
			
			model.addAttribute("gnbViewName", "include/gnb");
			model.addAttribute("viewName", "post/post_mypage_view");
			
			
			return "template/layout";
		}
		
		
		@RequestMapping("/search_view/{word}")
		public String search(
				@RequestParam("word") String word,
				Model model) {
			//word는 subject로 검색이 된다
			
			
			List<CardView> card = postBO.getCardViewListByWord(word);
			
			model.addAttribute("card", card);
			model.addAttribute("gnbViewName", "include/gnb");
			
			model.addAttribute("viewName", "post/post_search_view");
			
			
			return "template/layout";
		}
		
	
}

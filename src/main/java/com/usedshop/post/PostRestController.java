package com.usedshop.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.usedshop.post.bo.PostBO;
import com.usedshop.post.model.Post;

@RequestMapping("/post")
@RestController
public class PostRestController {
	@Autowired 
	private PostBO postBO;
	

	
	
	@PostMapping("/create")
	public Map<String, Object> create(
			@RequestParam("subject") String subject,
			@RequestParam("price") int price,
			@RequestParam("delivery") int delivery,
			@RequestParam("productStatus") String productStatus,
			@RequestParam("content") String content,
			HttpSession session ) {
		
		Map<String, Object> result = new HashMap<>();
		
		Post post = new Post();
		
		//세션에서 작성자의 정보를 꺼낸다
		Object userIdObject =  session.getAttribute("userId"); //세션의 값이 잘 안 꺼내진다면, 로그인 한 곳에서 userId setAttribute가 됬는지 확인해야한다.
		if(userIdObject == null) { //로그인 되어있지 않으면
			result.put("put", "error");
			result.put("errorMessage", "로그인 후 사용 가능합니다");
			return result;
		}
		
		//로그인 된 사용자
		int userId = (int)userIdObject;
	
		String userLoginId = (String)session.getAttribute("userLoginId"); //세션에서 유저id를 가져와 저장
		
		//insert
		postBO.addPost(userId, subject, price, delivery, productStatus, content);
		
		int postId = post.getId();
		
		result.put("postId", postId);
		result.put("userLoginId", userLoginId);
		result.put("result", "success");
		//mapper미완성
		
		return result;
	}
	
	
	
}

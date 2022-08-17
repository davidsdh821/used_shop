package com.usedshop.user;



import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.usedshop.common.EncryptUtils;
import com.usedshop.user.bo.UserBO;
import com.usedshop.user.model.User;

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
	@PostMapping("/sign_up")
	public Map<String, Object> signUp(
			@RequestParam("name") String name,
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			@RequestParam("email") String email
			) {
		String encrypts = "";
		//암호화
		try {
			encrypts = EncryptUtils.encrypt(password);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//db 저장
		userBO.addUser(name, loginId, encrypts, email);
		
		//결과 출력
		Map<String, Object> result =  new HashMap<>();
		
		
		result.put("result", "success");
		
		
		return result;
}
	
	@PostMapping("/sign_in")
	public Map<String, Object> signIn(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			HttpServletRequest request ) {
		
		//암호화
		//데이터가 db에 남기 때문에 암호화할 필요가 있다.(개발자들도 보면 안되기 때문에 암호화를 시켜주는 것이다)
		try {
			String encrypts = EncryptUtils.encrypt(password);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Map<String, Object> result = new HashMap<>();
		
		
		User user = userBO.getUser(loginId, password);
		
			
		if(user != null) { //성공
		HttpSession session = request.getSession();
		session.setAttribute("userId", user.getId());
		session.setAttribute("userLoginId", user.getLoginId());
		session.setAttribute("userName", user.getUserName());
		session.setAttribute("roll", user.getRoll());
		result.put("result", "success");
		} else {
			result.put("errorMessage", "존재하지 않는 사용자입니다");
		}
		
		return result;
		
	}
	
	@RequestMapping("/find_id")
	public Map<String, Object> findId(
			@RequestParam("userName") String userName,
			@RequestParam("email") String email
			) {
		Map<String, Object> result = new HashMap<>();	
		String user = "";
		
		user = userBO.getUserById(userName, email);
		
		if(user == null) { //조회 되지 않는 경우
			result.put("errorMessage", "존재하지 않는 사용자입니다");
			
		} else {
			result.put("result", "success");
			result.put("loginId", user);
		}
		
		
		
		
		
		
		return result;
	}
	
	@RequestMapping("/confirm_user")
	public Map<String, Object> confirmUser(
			@RequestParam("loginId") String loginId,
			@RequestParam("email") String email
			) {
			Map<String, Object> result = new HashMap<>();	
		
		
		
		
	}
	
	
	
	
	
	
		
}

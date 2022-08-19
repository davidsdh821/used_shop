<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/static/css/findStyle.css">



<div class ="find">
<h1>아이디 찾기</h1>

<label class="findNmae"><input type="text" id="name"
	class="form-control" placeholder="찾을 아이디의 사용자 이름을 입력해주세요"></label>
<br>
<br>

<label class="email d-flex"><input id="email1" type="text"
	class="form-control" placeholder="이메일을 입력해주세요">
	<button type="button" class="send1 btn btn-light">인증번호 보내기</button></label>
<br>
<div class="check-number1 d-none">
<label class="check d-flex"><input type="text" class="form-control"
	id="check1">
	<button type="button" class="check_btn1 btn btn-success">인증번호 확인</button>
	<div class="time"></div></label>
	<div id="emailCheckDuplicated1" class="small text-danger d-none">인증번호를 다시 입력해주세요</div>
	<div id="emailCheckOk1" class="small text-success d-none">이메일 인증 성공</div>
</div>	
<br>



<label class="buttons"><a href="#"><div class="find_id">아이디 찾기</div></a>
	<a href="/post/post_list_view"><div class="back">뒤로가기</div></a> </label>
	
	
	<br>
<br>
	
<h1>비밀번호 변경</h1>	
<label class="chanagePasswordById"><input type="text" id="id"
	class="form-control" placeholder="비밀번호를 변경할 아이디를 입력하세요"></label>
<br>
<br>
<label class="email d-flex"> <input type="text" class="form-control"
	id="email2" placeholder="이메일을 입력해주세요">
	<button type="button" class="send2 btn btn-primary">인증번호 보내기</button>
</label>


<div class="check-number2 d-none">
<label class="check d-flex d-none"><input type="text" class="form-control"
	id="check2">
	<button type="button" class="check_btn2 btn btn-success ">인증번호 확인</button>
	<div class="time"></div></label>
	<div id="emailCheckDuplicated2" class="small text-danger d-none">인증번호를 다시 입력해주세요</div>
	<div id="emailCheckOk2" class="small text-success d-none">이메일 인증 성공</div>
	</div>

	
<br>
<br>
<label class="buttons"><a href="#"><div class="change_pw">변경하기</div></a>
	<a href="/post/post_list_view"><div class="back">뒤로가기</div></a> </label>	
	
	
	
</div>

<script>
	$(document).ready(function() {
		$(".send1").on("click", function() {
			var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
			let email = $("#email1").val().trim();
			
	 		if(email == "") {
 				alert("이메일을 입력해주세요")
				return false;
			} else if(!email.match(emailRule)) {
					alert("이메일 형식이 맞지 않습니다");
					return false;
					
			}
			$.ajax({
				type: "post"
				,url:"/email/email_is_duplicated"
					,data:{"email": email}
				 	,success:function(data) {
				 		if(data.result == "success") {
				 			$(".check-number1").removeClass('d-none');
							alert("인증코드를 전송했습니다")
				 		}  else {
				 			alert("인증코드 전송을 실패했습니다")
				 			return;
				 		}
				 	}
				 	,error: function(e) {
			 			alert("이메일 전송에 실패했습니다.");
			 			return;
			 		} 
			
			
			});
			
		});
		 

			$(".check_btn1").on("click", function() {
				var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
				let email = $("#email1").val().trim();
				let number = $(this).siblings("input").val().trim();
				
		 		if(email == "") {
	 				alert("이메일을 입력해주세요")
					return false;
				} else if(!email.match(emailRule)) {
						alert("이메일 형식이 맞지 않습니다");
						return false;
						
				}

				$.ajax({
					type:"delete"
					,url:"/email/email_duplicated_delete"
						,data:{"email": email, "number":number}
					 	
					 	,success:function(data) {
					 		if(data.result == "success") {
					 			
					 			$("#emailCheckOk1").removeClass('d-none');
					 			return
					 		} else if(data.result == "fail") {
					 			$("#emailCheckDuplicated1").removeClass('d-none');
					 		} else {
					 			alert("중복 체크에 실패했습니다")
					 		}
					 	}
					 	,error: function(e) {
				 			alert("아이디 중복체크에 실패했습니다.");
				 		} 
						 
					 });
					
					
					
				});	
			
			
		
		$(".find_id").on("click", function() {
			var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
			let userName = $("#name").val().trim();
			let email = $("#email1").val().trim();
			
 	 		if(userName == "") {
				alert("이름을 입력해주세요");
				return;
				
			}
	 		if(email == "") {
 				alert("이메일을 입력해주세요")
				return false;
			} else if(!email.match(emailRule)) {
					alert("이메일 형식이 맞지 않습니다");
					return false;
					
			}
	 		if($('#idCheckOk1').hasClass('d-none')) {
	 			alert("옳바른 인증번호를 작성해주세요");
				return false;
			}
			if($('#emailCheckOk1').hasClass('d-none')) {
				alert("이메일 인증을 해주세요");
				return false;
			}
			
	 		$.ajax({
	 			type: "post"
	 			,url: "/user/find_id"
	 			,data: {"userName":userName, "email":email}
	 		
	 			,success:function(data) {
	 				if(data.result == "success") {
	 					alert("회원님의 아이디는" + data.loginId + "입니다")
	 					location.href = "/post/post_list_view";
	 				} else {
	 					alert(data.errorMessage);
	 					
	 				}

	 			}
 				,error: function(e) {
 					alert("아이디 찾기 실패")
 				}
	 			
	 			
	 			
	 		});
	 		
	 		
	 		
		}); 
		
		//비밀번호 변경

		$(".send2").on("click", function() {
			var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
			let email = $("#email2").val().trim();
			
	 		if(email == "") {
 				alert("이메일을 입력해주세요")
				return false;
			} else if(!email.match(emailRule)) {
					alert("이메일 형식이 맞지 않습니다");
					return false;
					
			}
			$.ajax({
				type: "post"
				,url:"/email/email_is_duplicated"
					,data:{"email": email}
				 	,success:function(data) {
				 		if(data.result == "success") {
				 			$(".check-number1").removeClass('d-none');
							alert("인증코드를 전송했습니다")
				 		}  else {
				 			alert("인증코드 전송을 실패했습니다")
				 			return;
				 		}
				 	}
				 	,error: function(e) {
			 			alert("이메일 전송에 실패했습니다.");
			 			return;
			 		} 
			
			
			});
			
		});
		
		$(".check_btn2").on("click", function() {
			var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
			let email = $("#email2").val().trim();
			let number = $(this).siblings("input").val().trim();
			
	 		if(email == "") {
 				alert("이메일을 입력해주세요")
				return false;
			} else if(!email.match(emailRule)) {
					alert("이메일 형식이 맞지 않습니다");
					return false;
					
			}

			$.ajax({
				type:"delete"
				,url:"/email/email_duplicated_delete"
					,data:{"email": email, "number":number}
				 	
				 	,success:function(data) {
				 		if(data.result == "success") {
				 			
				 			$("#emailCheckOk2").removeClass('d-none');
				 			$(".passwords").removeClass('d-none');
				 			
				 			return
				 		} else if(data.result == "fail") {
				 			$("#emailCheckDuplicated2").removeClass('d-none');
				 		} else {
				 			alert("이메일 인증 실패")
				 		}
				 	}
				 	,error: function(e) {
			 			alert("api 에러 발생");
			 		} 
					 
				 });
				
				
				
			});	
		
		
		
		//설계 다시 필요
		
		$(".change_pw").on("click", function() {
			var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
		
			let loginId = $("#id").val().trim();
			let email = $("#email2").val().trim();
			
 	 		if(loginId == "") {
				alert("아이디를 입력해주세요");
				return;
				
			}
	 		if($('#idCheckOk2').hasClass('d-none')) {
				alert("옳바른 인증번호를 작성해주세요");
				return false;
			}
			if($('#emailCheckOk2').hasClass('d-none')) {
				alert("이메일 인증을 해주세요");
				return false;
			}
			

			
	 		$.ajax({
	 			type: "post"
	 			,url: "/user/confirm_pw_chk"
	 			,data: {"loginId":loginId, "email":email}
	 		
	 			,success:function(data) {
	 				if(data.result == "success") {
	 					location.href = "/post/find_password_view";
	 				} else {
	 					alert(data.errorMessage);
	 					
	 				}

	 			}
 				,error: function(e) {
 					alert("유저 찾기 실패")
 				}
	 			
	 			
	 			
	 		});	
			
			
		});
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		

		
		
	});
	
</script>





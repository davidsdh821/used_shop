<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/static/css/sign_up_Style.css">

<div class ="sign_up">
<h1>회원가입</h1>
<label class="userName"><input type="text" id="name"
	class="form-control" placeholder="사용자의 이름을 입력해주세요"></label>
<br>
<br>

<div>
<label class="id_box d-flex"><input id="loginId" type="text"
	class="form-control" placeholder="아이디를 입력해주세요">
	<button type="button" class="overlap btn btn-light">중복확인</button></label>
	<%-- 아이디 체크 결과 --%>
	<div id="idCheckLength" class="small text-danger d-none">ID를 4자 이상 입력해주세요.</div>
	<div id="idCheckDuplicated" class="small text-danger d-none">이미 사용중인 ID입니다.</div>
	<div id="idCheckOk" class="small text-success d-none">사용 가능한 ID 입니다.</div>
</div>
<br>
<br>


<label class="password1"><input id="pass_box1" type="password"
	class="form-control" placeholder="비밀번호를 입력해주세요(대소문자, 특수문자 포함 8자 이상)"></label>
	
<br>
<br>
<label class="password2"><input id="pass_box2" type="password"
	class="form-control" placeholder="비밀번호를 한 번 더 입력해주세요"></label>
<br>
<br>
<label class="email d-flex"> <input type="text" class="form-control"
	id="email" placeholder="이메일을 입력해주세요">
	<button type="button" class="send btn btn-primary">인증번호 보내기</button>
</label>
<br>

<div class="checkBox d-none">
<label class="check d-flex"><input type="text" class="form-control"
	id="check">
	<button type="button" class="check_btn btn btn-success">인증번호 확인</button>
	<div class="time"></div></label>
	<div id="emailCheckDuplicated" class="small text-danger d-none">인증번호를 다시 입력해주세요</div>
	<div id="emailCheckOk" class="small text-success d-none">이메일 인증 성공</div>
</div>	
<br>
<br>
<label class="buttons"><a href="#" id="sign_up"><div class="join">등록하기</div></a>
	<a href="/post/post_list_view"><div class="back">뒤로가기</div></a> </label>
</div>

<%--/user/sign_up --%>
<script>
	$(document).ready(function() {
		//아이디 중복확인
/* 		idCheckLength
		idCheckDuplicated
		idCheckOk */	
		
		
		$(".overlap").on("click", function() {
			//경고, 결과 문구 초기화
			$('#idCheckLength').addClass("d-none");
			$('#idCheckDuplicated').addClass("d-none");
			$('#idCheckOk').addClass("d-none");
			
			let loginId = $("#loginId").val().trim();
			
			 if(loginId.length < 4) {
				 $('#idCheckLength').removeClass('d-none');
				 
				 return;
			 }
			 
			 
			 $.ajax({
				url:"/user/overlap_check"
				,data:{"loginId": loginId}
			 	
			 	,success:function(data) {
			 		if(data.result == true) {
			 			$("#idCheckDuplicated").removeClass('d-none');
			 			return
			 		} else if(data.result == false) {
			 			$("#idCheckOk").removeClass('d-none');
			 		} else {
			 			alert("중복 체크에 실패했습니다")
			 		}
			 	}
			 	,error: function(e) {
		 			alert("아이디 중복체크에 실패했습니다.");
		 		} 
				 
			 });
			  
			
		});
		
		$(".send").on("click", function() {
			//이메일 정규식
			var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
			
			
			let email = $(this).siblings("input").val().trim();
			//console.log(email)
 	 		if(!email.match(emailRule)) {
				alert("이메일 형식이 맞지 않습니다");
				return;
				
			} else if(email == "") {
 				alert("이메일을 입력해주세요")
				return;
			} 
			
			$.ajax({
				type: "post"
				,url:"/email/email_is_duplicated"
					,data:{"email": email}
				 	,success:function(data) {
				 		if(data.result == "success") {
				 			$(".checkBox").removeClass('d-none');
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
		
		
$(".check_btn").on("click", function() {
			var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
			let email = $("#email").val().trim();
			let number = $(this).siblings("input").val().trim();
			
 	 		if(!email.match(emailRule)) {
				alert("이메일 형식이 맞지 않습니다");
				return false;
				
			} else if(email == "") {
 				alert("이메일을 입력해주세요")
				return false;
			} 

			$.ajax({
				type:"delete"
				,url:"/email/email_duplicated_delete"
					,data:{"email": email, "number":number}
				 	
				 	,success:function(data) {
				 		if(data.result == "success") {
				 			
				 			$("#emailCheckOk").removeClass('d-none');
				 			return
				 		} else if(data.result == "fail") {
				 			$("#emailCheckDuplicated").removeClass('d-none');
				 		} else {
				 			alert("중복 체크에 실패했습니다")
				 		}
				 	}
				 	,error: function(e) {
			 			alert("아이디 중복체크에 실패했습니다.");
			 		} 
					 
				 });
				
				
				
			});
			
			$("#sign_up").on("click", function() {
				
				var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/; //이메일 정규식
				var reg = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/; //비밀번호 대소문자특수문자 포함 8자
				
				let name = $("#name").val().trim();
				let loginId = $("#loginId").val().trim();
				let password = $('#pass_box1').val();
				let confirmPassword = $('#pass_box2').val();
				let email = $("#email").val().trim();
				
				
				if(name == "" ) {
		 			alert("이릅을 입력하세요.");
		 			return false;
		 		}
				
		 		if(loginId == "" ) {
		 			alert("아이디를 입력하세요.");
		 			return false;
		 		}
	 	 		if(!password.match(reg)) {
					alert("비밀번호 형식이 맞지 않습니다");
					return false;
					
				} else if(password =="" || confirmPassword == "") {
		 			alert("비밀번호를 입력하세요");
		 			return false;
		 		} 
		 		if(password != confirmPassword) {
		 			alert("비밀번호가 일치하지 않습니다")
		 			$('#password').val("");
		 			$('#confirmPassword').val(""); //텍스트 값을 초기화
		 			return false;
		 		}
				
		 		if(email == "") {
	 				alert("이메일을 입력해주세요")
					return false;
				} else if(!email.match(emailRule)) {
						alert("이메일 형식이 맞지 않습니다");
						return false;
						
				}

		 		
				if($('#idCheckOk').hasClass('d-none')) {
					alert("아이디 중복확인을 해주세요");
					return false;
				}
				if($('#emailCheckOk').hasClass('d-none')) {
					alert("이메일 인증을 해주세요");
					return false;
				}
				
				
				$.ajax({
					type:"post"
						,url:"/user/sign_up"
							,data:{"name": name, "loginId":loginId, "password":password, "email":email}
						 	
						 	,success:function(data) {
						 		if(data.result == "success") {
						 			alert("가입 성공, 로그인해주세요")
						 			location.href = "/post/post_list_view";
						 		} else {
						 			alert("회원가입중 오류가 발생했습니다")
						 		}
						 	}
						 	,error: function(e) {
					 			alert("회원가입에 실패했습니다.");
					 		} 					
				});
				
	
				
			});
			
			
			
			
			
			
			
 	 		
		
		
		
	});	
		
			


</script>




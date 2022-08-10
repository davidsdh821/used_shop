<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/static/css/sign_up_Style.css">

<div class ="sign_up">
<h1>회원가입</h1>
<form id="signUpForm" method="post" action="/user/sign_up">
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
	class="form-control" placeholder="비밀번호를 입력해주세요"></label>
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
<br>
<div class="checkBox d-none">
<label class="check d-flex"><input type="text" class="form-control"
	id="check">
	<button type="button" class="check_btn btn btn-success">인증번호 확인</button>
	<div class="time"></div></label>
</div>	
<br>
<br>
<label class="buttons"><a href="#"><div class="join">등록하기</div></a></form>
	<a href="/post/post_list_view"><div class="back">뒤로가기</div></a> </label>
</div>


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
		
		
		
		
		
		
		
		
		
	});


</script>




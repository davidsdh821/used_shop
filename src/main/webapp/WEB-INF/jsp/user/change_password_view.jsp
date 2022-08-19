<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<h1>비밀번호 변경</h1>	
<div>
<label class="password1 d-none"><input id="pass_box1" type="password"
	class="form-control" placeholder="비밀번호를 입력해주세요"></label>
<br>
<br>
<label class="password2 d-none"><input id="pass_box2" type="password"
	class="form-control" placeholder="비밀번호를 한 번 더 입력해주세요"></label>
	
<br>
<br>


</div>

<script>
var reg = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/; //비밀번호 대소문자특수문자 포함 8자

$(".change_pw").on("click", function() {
	var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
	var reg = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/; //비밀번호 대소문자특수문자 포함 8자

	let password = $('#pass_box1').val();
	let confirmPassword = $('#pass_box2').val();
	

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
	
	
		$.ajax({
			type: "post"
			,url: "/user/confirm_pw"
			,data: {"loginId":loginId, "email":email}
		
			,success:function(data) {
				if(data.result == "success") {
					location.href = "/post/find_password_view";
				} else {
					alert(data.errorMessage);
					
				}

			}
			,error: function(e) {
				alert("아이디 찾기 실패")
			}
			
			
			
		});	
	
	
});



</script>
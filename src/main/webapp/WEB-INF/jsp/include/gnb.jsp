<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<link rel="stylesheet" href="/static/css/gnbStyle.css">
 

<div class="header">
<div class="logo">임시 로고</div>
        <div class="search">
          <div class="search-box">
            <input type="text" placeholder="검색어 입력" id="search-word"/>
            <button class="button"><a class="s-word" href="#">검색</a></button>
          </div>
        </div>
        
  		<c:choose>
  		<c:when test="${not empty userLoginId}">
  		<div class="sell"><a href="/post/post_create_view">판매하기</a></div>
        <div class="mypage"><a href="post_mypage_view">${userLoginId}</a></div>
        <div class="logout"><a href="/user/logout">로그아웃</a></div>
  		</c:when>
  		<c:otherwise>
		<a class="log-button" href="#" data-toggle="modal" data-target="#loginModal">로그인/회원가입</a>
		</c:otherwise>
		</c:choose>

</div>

<!-- Modal -->
<div class="modal fade" id="loginModal">
  <div class="modal-dialog modal-sm modal-dialog-centered">
    <div class="modal-content">
      	<%-- modal 창 안에 내용 넣기 --%>
      	
      	<div class="login">
        <div class="login-s">
        <h2 class="text-log">로그인</h2>
        
        <input id="loginId" type="text" name="loginId" class="form-control" placeholder="아이디를 입력해주세요">
        <div class="void2"></div>
        <input id="password" type="password" name="password" class="form-control" placeholder="비밀번호를 입력해주세요">
        <div class="void2"></div>
        <a href="#" type="submit"><div class="loginBtn">로그인</div></a>
        <div class="op">
        <label class="keep"><input type="checkbox">로그인 유지</label>
        <a class="find" href="/user/user_find_view">아이디/비밀번호 찾기</a>
    </div>
        <div class="text">아직 계정이 없으신가요? <a class="join" href="/user/user_signup_view"><u>회원가입</u></a></div>
    </div>
    </div>

      	      	
    </div>
  </div>
</div>
<!-- collectionUtils.isEmpty(String) null검사나 비어있는  string검사할때 쓴다-->

<script>
	$(document).ready(function() {
		

		$(".loginBtn").on("click", function(e){
			e.preventDefault();
			let loginId = $("#loginId").val().trim();
			let password = $("#password").val();
			
	 		if(loginId == "" ) {
	 			alert("아이디를 입력하세요.");
	 			return false;
	 		}
	 		if(password == "" ) {
	 			alert("비밀번호를 입력하세요.");
	 			return false;
	 		}
	 		
	 		//폼방식
/* 	 		let url = $(this).attr("action");
	 		let params = $(this).serialize();
	 		
	 		$.post(url, params)
	 		.done(function(data) {
	 			if(data.result =="success") {	
	 				location.reload(true);
	 			} else {
	 				alert(data.errorMessage)
	 				}
	 			
	 		});	 */
	 		$.ajax({
	 			type: "post"
	 			,url: "/user/sign_in"
	 			,data: {"loginId": loginId, "password":password}
	 			
	 			,success:function(data) {
		 			if(data.result =="success") {	
		 				location.reload(true);
		 			} else {
		 				alert(data.errorMessage)
		 				}
	 			}
				,error: function(e) {
					alert("로그인 실패");
				}
	 			
	 		});
	 		
	 		
		
	 		
			
		});
		
		
		//검색
		$(".button").on('click', function() {
			let word = $("#search-word").val().trim();
			
			if(word == "") {
				alert("검색어를 입력해주세요")
				return;
			}
			
			$.ajax({
				type: "post"
				,url: "/post/search"
				,data: {"word", word}
			
			
				,success: function(data) {
					if(data.result == "success") {
						
					} else {
						alert(data.errorMessage)
					}
				}
				,error: function(e) {
					alert("error" + e)
				}
				
				
				
			});
			
			
			
			
		});
		
		
		
		
		
		
	});


</script>
















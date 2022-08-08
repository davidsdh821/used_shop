<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/gnbStyle.css">
 

<div class="header">
<div class="logo">임시 로고</div>
        <div class="search">
          <div class="search-box">
            <input type="text" placeholder="검색어 입력" id="search-word"/>
            <button class="button"><a class="s-word" href="#">검색</a></button>
          </div>
        </div>
        <div class="user-data">
	<a class="log-button" href="#" data-toggle="modal" data-target="#loginModal">로그인/회원가입</a>
	
</div>
</div>

<!-- Modal -->
<div class="modal fade" id="loginModal">
  <div class="modal-dialog modal-sm modal-dialog-centered">
    <div class="modal-content">
      	<%-- modal 창 안에 내용 넣기 --%>
      	<div class="login">
        <div class="login-s">
        <h2 class="text-log">로그인</h2>
        
        <input id="email" type="text" class="form-control" placeholder="이메일을 입력해주세요">
        <div class="void2"></div>
        <input id="password" type="password" class="form-control" placeholder="비밀번호를 입력해주세요">
        <div class="void2"></div>
        <a href="#"><div class="loginBtn">로그인</div></a>
        <div class="op">
        <label class="keep"><input type="checkbox">로그인 유지</label>
        <a class="find" href="#">아이디/비밀번호 찾기</a>
    </div>
        <div class="text">아직 계정이 없으신가요? <a class="join" href="#"><u>회원가입</u></a></div>
    </div>
    </div>

      	      	
    </div>
  </div>
</div>
















<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/static/css/sign_up_Style.css">

<div class ="sign_up">
<h1>회원가입</h1>

<label class="userName"><input type="text" id="name"
	class="form-control" placeholder="사용자의 이름을 입력해주세요"></label>
<br>
<br>

<label class="id d-flex"><input id="id_box" type="text"
	class="form-control" placeholder="아이디를 입력해주세요">
	<button type="button" class="overlap btn btn-light">중복확인</button></label>
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
<label class="check d-flex"><input type="text" class="form-control"
	id="check">
	<button type="button" class="check_btn btn btn-success">인증번호 확인</button>
	<div class="time"></div></label>
<br>
<br>
<label class="buttons"><a href="#"><div class="join">등록하기</div></a>
	<a href="#"><div class="back">뒤로가기</div></a> </label>
</div>
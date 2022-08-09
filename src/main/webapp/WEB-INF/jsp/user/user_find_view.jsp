<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/static/css/findStyle.css">



<div class ="find">
<h1>아이디/비번 찾기</h1>

<label class="findNmae"><input type="text" id="name"
	class="form-control" placeholder="찾을 아이디의 사용자 이름을 입력해주세요"></label>
<br>
<br>

<label class="email d-flex"><input id="email_box" type="text"
	class="form-control" placeholder="이메일을 입력해주세요">
	<button type="button" class="email_dup btn btn-light">인증번호 보내기</button></label>
<br>
<div class="check-number d-none">
<label class="check d-flex"><input type="text" class="form-control"
	id="check">
	<button type="button" class="check_btn btn btn-success">인증번호 확인</button>
	<div class="time"></div></label>
</div>	
<br>



<label class="buttons"><a href="#"><div class="join">등록하기</div></a>
	<a href="#"><div class="back">뒤로가기</div></a> </label>
	
	
	<br>
<br>
	
	
<label class="chanagePasswordById"><input type="text" id="name"
	class="form-control" placeholder="비밀번호를 변경할 아이디를 입력하세요"></label>
<br>
<br>
<label class="email d-flex"> <input type="text" class="form-control"
	id="email" placeholder="이메일을 입력해주세요">
	<button type="button" class="send btn btn-primary">인증번호 보내기</button>
</label>


<div class="check-number d-none">
<label class="check d-flex d-none"><input type="text" class="form-control"
	id="check">
	<button type="button" class="check_btn btn btn-success ">인증번호 확인</button>
	<div class="time"></div></label>
	</div>
<br>

	<label class="password1 d-none"><input id="pass_box1" type="password"
	class="form-control" placeholder="비밀번호를 입력해주세요"></label>
<br>
<br>
<label class="password2 d-none"><input id="pass_box2" type="password"
	class="form-control" placeholder="비밀번호를 한 번 더 입력해주세요"></label>
<br>
<br>
<label class="buttons"><a href="#"><div class="join">등록하기</div></a>
	<a href="#"><div class="back">뒤로가기</div></a> </label>	
	
	
	
</div>


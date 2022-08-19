<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
    
<link rel="stylesheet" href="/static/css/mywishStyle.css">

<h2>${userLoginId}</h2>
<hr>
<div class="choose d-flex">
	<a id="my-goods" href="/post/post_mypage_view"><div class="my-goods">
		내상품
	</div></a>
	<a id="my-wish" href="/wish/wish_mywish_view"><div class="my-wish">
		찜목록
	</div></a>
</div>
<div class="void"></div>
<div class="content">
          <div class="box">
            <a href="#">
              <img src="/static/img/테스트사진.jpg" alt="" />
              <div class="title">제목</div>
              <div class="price">가격</div>
            </a>
          </div>	

</div>
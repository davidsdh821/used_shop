<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  <link rel="stylesheet" href="/static/css/listStyle.css">
  
  
      <div class="content">
        <div class="line">
        
        <c:forEach var ="card" items="${card}">
        <a href="/post/post_page_view?postId=${card.post.id}">
          <div class="box">
              <img src="${card.image}" alt="이미지" />
              <div class="title">${card.post.subject}</div>
              <div class="price">${card.post.price}</div>
          </div>
         </a>
         </c:forEach>
         
		</div>		
       
      
</div>
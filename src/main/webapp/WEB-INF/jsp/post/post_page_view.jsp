<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  <link rel="stylesheet" href="/static/css/pageStyle.css">
    
      <div class="content" >
        <div class="infos">
        	<div class="img-boxs">
			<ul class="slide">
				<c:forEach var="images" items="${result.images}">
					<li class="imgs">
						<img alt="이미지" src="${images}">
					</li>
				</c:forEach>

			</ul>
				<c:if test="${fn:length(result.images)> 1}">
					<span class="prev">&lt;</span>
        			<span class="next">&gt;</span>
				</c:if>	
		</div>	
          <div class="text_info">
            <h2>${result.post.subject}</h2>
            <h1>${result.post.price} 원</h1>
            <div class="buttons2">
              <a href="#" class="wish-btn" data-post-id="${result.post.id}"><div class="good"><img class="good_img" src="/static/img/좋아요.png" alt="찜">
              ${result.wish}
             </div></a>
              <div class="time">
                <img class="clock" src="/static/img/시계.png" alt="시간" />
              		7시간 전  
              </div>
              <div class="view">
                <img class="view_img" src="/static/img/눈알.png" alt="" />${result.post.view}
              </div>
              <a href="#"><div class="report">신고하기</div></a>
            </div>
            <br />
            <ul class="send_info">
              <li class="send_price">배송비: ${result.post.delivery}</li>
              <li class="state">제품 상태: ${result.post.productStatus}</li>
            </ul>
            <div class="detail">
              <p>${result.post.content}</p>
            </div>
          </div>
        </div>
      </div>
      <div class="comment_seller_info">
        <div class="comment_box">
        <div class="height"></div>
          <h3>상품문의</h3>
          <textarea class="form-control" id="comment"></textarea>
        </div>
        <div class="seller_info">
          <div class="d_box">
            <div class="profile">
              <a href="#"><img class="profile_img" src="/static/img/테스트사진.jpg" alt="">${result.loginId}</a>
            </div>
            	<c:forEach var="card" items="${result.userPost}">
              	<a href="/post/post_page_view?postId=${card.post.id}"><div class="sell"><img class="sell_img" src="${card.image}" alt="사진">${card.post.subject}</div></a>
             	</c:forEach>
          </div>
        </div>
</div>




<script>
$(document).ready(function() {
	
	
	var count = document.getElementsByClassName('imgs').length;   
	var size = 500 * count;
	
	
	$('.slide').css('width', size);
	
    $('.prev').click(function(){
    	$('.slide li:last').prependTo('.slide');
    	$('.slide').css('margin-left',-500);
    	$('.slide').stop().animate({marginLeft:0}, 800)
    });
    $('.next').click(function(){
    	$('.slide').stop().animate({marginLeft:-500},800, function(){
    		$('.slide li:first').appendTo('.slide');
    		$('.slide').css({marginLeft:0})
    	})
    });
    
	$('.wish-btn').on('click', function(e) {
		e.preventDefault();
		let postId = $(this).data('post-id');
		
		
		
		 $.ajax({
			type: "post"
			,url: "/wish/" + postId
			
			,success: function(data) {
				if(data.result == "success") {
					location.reload(true);
				} else {
					alert(data.errorMessage);
				}	
				
			}
				
			,error: function(e) {
				alert("error" + e)
			}
			
		});  
		
	});
	
	
});	
</script>



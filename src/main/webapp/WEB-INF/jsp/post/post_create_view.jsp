<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
	  <link rel="stylesheet" href="/static/css/createStyle.css">
	


        <div class="content">
            
            <div class="subject-item">
            <h2 class="subject-word">제목</h2>
            <input type="text" class="form-control subject" id="subject" placeholder="제목을 입력해주세요">
        </div>
            <hr>
        <h2>이미지 업로드</h2>
        <div class="img-item d-flex">
            <div class="img-upload">
            <input type="file" id="file" accept=".gif,.jpg,.png,.jpeg" class="d-none" multiple="multiple">
            <a href="#" id="fileUploadBtn">
                    <svg xmlns="http://www.w3.org/2000/svg" width="150" height="150" viewBox="0 0 24 24"><path d="M9 16h6v-6h4l-7-7-7 7h4zm-4 2h14v2H5z"/></svg>
            </a>
        </div>
			<img id="imgs" style="width: 150; height: 150px;">
        
        </div>
        <hr>
        <div class="price-item">
            <h2 class="price-word">가격입력</h2>
            <input type="number" class="form-control price" id="price" placeholder="가격을 입력해주세요">
        </div>
        <hr>
        <!-- 배송비 부터 -->
        
        <div class="goods-item">
        <div class="delivery-box d-flex">
        <h3 class="delivery-word">배송비</h3>
        <input type="number" class="form-control delivery" id="delivery" placeholder="배송비를 입력해주세요">
        </div>
        <div class="state-box d-flex">	
        <h3 class="state-word">상품 상태</h3>
          <label class="radios"><input type="radio" name="state" value=1> 중고</label>
          <label class="radios"><input type="radio" name="state" value=0> 새제품</label>
        </div>
        </div>
        <hr>
        <div class="explanation-box d-flex">
        <h3 class="explanation-word">내용</h3>
        <textarea class="form-control" rows="10" cols="100" id="explanation" placeholder="10자 이상 판매할 제품의 내용을 적어주세요"></textarea>
        </div>
        
	
		<br>	
		 <button type="button" class="createBtn btn btn-primary" id="createBtn">등록</button>		
	        
		<br>
		<br>	        
</div>





<script>
    $(document).ready(function() {
        $('#fileUploadBtn').on('click', function() {
            $('#file').click();

        });
		$('#file').on('change', function(event) {
		    var files = event.target.files[0];

		    var reader = new FileReader(); 
		    reader.onload = function(e) {

		        $("#imgs").attr("src", e.target.result);
		    }
			
		    reader.readAsDataURL(files);
		});
		
		$("#createBtn").on("click", function() {
			let formData = new FormData();
			let subject = $("#subject").val().trim();
			let file = $("#file").val();
			let price = $("#price").val().trim();
			let delivery = $("#delivery").val().trim();
			//1이면 중고 0이면 새재품
			let state = $('input:radio[name="state"]:checked').val();
			let explanation $("#explanation").val().trim();
			

			
			if(subject == "" ) {
	 			alert("제목을 입력하세요.");
	 			return false;
	 		}
			if(file == "" ) {
	 			alert("사진은 하나 이상이어야 합니다");
	 			return false;
	 		}
			if(price == "" ) {
	 			alert("가격을 입력하세요.");
	 			return false;
	 		}
			if(delivery == "" ) {
	 			alert("배달비를 입력하세요");
	 			return false;
	 		}
			if(state == "" ) {
	 			alert("제품의 상태를 선택하세요.");
	 			return false;
	 		}
			if(explanation == "" ) {
	 			alert("내용을 입력하세요.");
	 			return false;
	 		} else if(explanation < 10) {
	 			alert("소개내용은 10자 이상이어야 합니다!")
	 			return false;
	 		}
			
			
			formData.append("subject", subject);
			formData.append("file", $('#file')[0].files[0]);
			formData.append("price", price);
			formData.append("delivery", delivery);
			formData.append("state", state);
			formData.append("explanation", explanation);
			
			//로그인이 안되있을때 막아주는 것도 필요
			
			$.ajax({
				type:"post"
					,url:"/post/create"
						,data: formData
						,encType:"multipart/form-data" //파일 업로드 필수 설정, 무조건 넣어야한다(이미지 넣을때만)
						,processData: false //파일 업로드 필수 설정, data에 있는 것을 string으로 바꿔주는 것을 비활성화
						,contentType: false //파일 업로드 필수 설정		 	
				
			
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
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
        	<div class="imgs" style="width: 150; height: 150px;">
        		
        	</div>
        
        </div>
        <hr>
        <div class="price-item">
            <h2 class="price-word">가격입력</h2>
            <input type="number" class="form-control price" id="subject" placeholder="가격을 입력해주세요">
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
          <label class="radios"><input type="radio" name="state" value="used"> 중고</label>
          <label class="radios"><input type="radio" name="state" value="new"> 새제품</label>
        </div>
        </div>
        <hr>
        <div class="explanation-box d-flex">
        <h3 class="explanation-word">내용</h3>
        <textarea class="form-control" rows="10" cols="100" id="explanation" placeholder="10자 이상 판매할 제품의 내용을 적어주세요"></textarea>
        </div>
        
	
		<br>	
		 <button type="button" class="createBtn btn btn-primary" id="createBtn">등록</button>		
        </div>



<script>
    $(document).ready(function() {
        $('#fileUploadBtn').on('click', function() {
            $('#file').click();

        });
		$('#file').on('change', function(event) {
		    var file = event.target.files[0];

		    var reader = new FileReader(); 
		    reader.onload = function(e) {

		        $("#imgs").attr("src", e.target.result);
		    }
			
		    reader.readAsDataURL(file);
		});



    });

	

</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
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
            <input type="file" id="file" accept=".gif,.jpg,.png,.jpeg" class="d-none">
            <a href="#" id="fileUploadBtn">
                    <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" viewBox="0 0 24 24"><path d="M9 16h6v-6h4l-7-7-7 7h4zm-4 2h14v2H5z"/></svg>
            </a>
        </div>
        </div>
        <hr>
        <div class="price-item">
            <h2 class="price-word">가격입력</h2>
            <input type="number" class="form-control price" id="subject" placeholder="가격을 입력해주세요">
        </div>
        <hr>
        <!-- 배송비 부터 -->



        </div>



<script>
    $(document).ready(function() {
        $('#fileUploadBtn').on('click', function() {
            $('#file').click();

        }); 

    });


</script>
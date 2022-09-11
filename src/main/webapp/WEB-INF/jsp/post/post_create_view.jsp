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
            <input type="file" id="file" accept=".gif,.jpg,.png,.jpeg" class="d-none multi" multiple="10" name="urls">
            <a href="#" id="fileUploadBtn">
                    <svg xmlns="http://www.w3.org/2000/svg" width="150" height="150" viewBox="0 0 24 24"><path d="M9 16h6v-6h4l-7-7-7 7h4zm-4 2h14v2H5z"/></svg>
            </a>
        </div>
		<div id="img-preview">
      <!-- <img id="imgs" style="width: 150; height: 150px" /> -->
    	</div>
        
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
          <label class="radios"><input type="radio" name="state" value="중고"> 중고</label>
          <label class="radios"><input type="radio" name="state" value="새재품"> 새제품</label>
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
    	
    	var imgs = []; //이미지가 들어갈 배열
    	var imgsNames = []; //이미지 이름이 들어갈 배열

    	let fileTag = document.querySelector("#file");
        $('#fileUploadBtn').on('click', function() {
            $('#file').click();

        });
        $('#file').change(function() {
           let imgTag = document.querySelector("#imgs");
            	imgs.push($(this).get(0).files[i]);
            	imgsNames.push($(this).get(0).files[i].name);
					
            	console.log(imgs[i])
            	console.log(imgsNames[i])
            }


            
         });
        
        
        
        

		$("#createBtn").on("click", function() {
			let formData = new FormData();
			let formData2 = new FormData($('#uploadForm')[0]);
			
			let subject = $("#subject").val().trim();
			let price = $("#price").val().trim();
			let delivery = $("#delivery").val().trim();
			//1이면 중고 0이면 새재품
			let state = $('input:radio[name="state"]:checked').val();
			let explanation = $("#explanation").val().trim();
			

			
			if(subject == "" ) {
	 			alert("제목을 입력하세요.");
	 			return false;
	 		}
			if(imgs.length < 1 ) {
	 			alert("사진은 하나 이상이어야 합니다");
	 			return false;
	 		}

			if (imgs != "") { //파일이 비어있지 않는 경우만 검증
				for(let i = 0; i < imgs.length; i++) {
				let ext = [];
				name = imgsNames[i]
				ext[i] = name.split(".").pop().toLowerCase(); //파일 경로를 .으로 나누고 마지막 문자열 배열 저장후 소문자로 변경
				if ($.inArray(ext[i], [ "gif", "jpg", "jpeg", "png", "PNG", "GIF", "JPG", "JPEG" ]) == -1) { //해당문자와 같지 않으면 -1로 표시가 된다
					//js에서는 []안에 값만 넣으면 바로 배열이 된다.
					alert("gif, jpg, jpeg, png 파일만 업로드 할 수 있습니다")
					imgs = []; //파일을 비운다

					return;
				}
			}

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
			
			
			for(let i = 0; i< imgs.length; i++) {
				formData2.append("files", imgs[i]);
			}

			formData.append("price", price);
			formData.append("delivery", delivery);
			formData.append("productStatus", state);
			formData.append("content", explanation);
			
			//로그인이 안되있을때 막아주는 것도 필요
			
				
			$.ajax({
				type:"post"
					,url:"/post/create"
						,data: formData
						,async: false //동기식, 이게 있으면 뒤에있는 함수는 이 작업이 끝난 후 진행 됨.
					    ,processData: false
					    ,contentType: false
						,success:function(data) {
					 		if(data.result == "success") {
					 			formData2.append("postId", data.postId);
					 			formData2.append("userLoginId", data.userLoginId);
					 			$.ajax({
					 				type:"post"
					 				,url: "/images/createimgs"
					 				,data: formData2
					 				,encType:"multipart/form-data" //파일 업로드 필수 설정, 무조건 넣어야한다(이미지 넣을때만)
					 				,processData: false //파일 업로드 필수 설정, data에 있는 것을 string으로 바꿔주는 것을 비활성화
					 				,contentType: false //파일 업로드 필수 설정
					 				
					 				,success:function(data) {
					 					if(data.result2 == "succsess") {
					 						alert("작성성공")
					 						location.href = "/post/post_list_view";
					 						
					 					} else {
					 						alert("예기치 못한 오류가 발생하였습니다(이미지 전송)");
					 					}
					 					
					 				}
					 				 	,error: function(e) {
					 			 			alert("작성 실패(이미지)");
					 			 			
					 			 		} 	
					 				 	
					 					
					 				
					 				
					 				
					 			}); //ajax2
					 			
					 			//다른 방법도 있지만 일단 이것부터 시도한다 예: promise
					 		
					 		} else {
					 			alert(data.errorMessage)
					 		}
					 	}
					 	,error: function(e) {
				 			alert("작성 실패");
				 			
				 		} 	
					 	
					 	
					 	
			});//ajax1
			
			
			
	
		

		
		

			
			
			
			
			
			
			
		});
		
		
		
		


    });

	

</script>
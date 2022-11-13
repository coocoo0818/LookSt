<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=dege">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>REGISTER PRODUCT</title>
	<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>
	
	

	<script type="text/javascript">
	
	function sendToServer(){ //기본정보 작성 안되어 있을 시 튕겨내기
	    if($('.cmode1').val() == ''){
	        alert('상품 분류를 선택해주세요');
	        return false;
	    }
	    if($('input[name=item_name]').val() == ''){
	        alert('상품명을 입력해주세요');
	        return false;
	    }
	    if($('input[name=price]').val() == ''){
	        alert('판매가격을 입력해주세요');
	        return false;
	    }
	    if($('input[type=file]').val() == ''){
	        alert('파일 이미지를 업로드해주세요');
	        return false;
	    }
	}

	$(function(){
	    

	    //파일업로드시 썸네일
	    $('#upload_image').change(function(e){
	    const images = e.target.files
	    $('.img-box').empty();
	    for(let i=0 ; i<images.length; i++){
	        const Reader = new FileReader();
	        Reader.readAsDataURL(images[i]);
	        Reader.onload = function(){
	            const img = '<img src="'+ Reader.result +'" alt="사진">';
	            $('.img-box').append(img);
	        }
	    }
	        
	    })
	})




	</script>
	
	<style type="text/css">
	
	#orderpagetitle {
		margin-top: 30px;
		margin-bottom: 30px;
		padding: 3px;
	}
	img {
		max-height: 350px;
		max-width: 340px;
		margin: 3px;
	}
	
	</style>
</head>
<body>

<%@ include file="/WEB-INF/views/fix/sellerheader.jsp" %>

<h2 id="orderpagetitle" class="disply-2 text-center py-4">REGISTER PRODUCT</h2>

<div class="container">
<div class="border border-3 p-sm-5">
        <form action="/seller/register" method="POST" enctype="multipart/form-data" onsubmit="return sendToServer()">
            <div class="item-content">
            
            <div class="input-group input-group-sm mb-4">
			  <label class="input-group-text text-white bg-dark" for="inputGroupSelect01">카테고리</label>
			  <select class="form-select" id="inputGroupSelect01">
			    <option selected>선택</option>
			    <option value="1">TOP</option>
			    <option value="2">BOTTOM</option>
			    <option value="3">ACC</option>
			    <option value="4">SHOES</option>
			  </select>
			</div>

                <div class="input-group input-group-sm mb-4">
  					<span class="input-group-text text-white bg-dark" id="inputGroup-sizing-default">상품명</span>
 				 	<input type="text" name="item_name" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
				</div>
				<div class="input-group input-group-sm mb-4">
  					<span class="input-group-text text-white bg-dark" id="inputGroup-sizing-default">판매가격</span>
 				 	<input type="text" name="price" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
				</div>	
				<div class="input-group input-group-sm mb-4">
						<span class="input-group-text text-white bg-dark" id="inputGroup-sizing-default">상품이미지</span>
  						<div class="imgupload"><div class="discription-box">
                            <div class="discription-blue">파일 저장시 상품내용 저장 후 적용됩니다</div>
                        </div>
                        <input type="file" name="upload_image" for="upload_image" id="upload_image" multiple="multiple">
                        </div>
                        <div class="img-box"></div>       
				</div>
				<div class="input-group input-group-sm mb-4">
  					<span class="input-group-text text-white bg-dark" id="inputGroup-sizing-default">상세 설명</span>
 				 	<div class="input-group input-group">
                		<textarea class="form-control" name="info" style="height: 300px;"></textarea>
           			</div>  
				</div>	
                
				
				<div class="input-group input-group-sm mb-4">
  					<span class="input-group-text text-white bg-dark" id="inputGroup-sizing-default">COLOR</span>
 				 	<input type="text" name="item_name" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
				</div>
				<div class="input-group input-group-sm mb-4">
  					<span class="input-group-text text-white bg-dark" id="inputGroup-sizing-default">SIZE</span>
 				 	<input type="text" name="item_name" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
				</div>
				<div class="input-group input-group-sm mb-4">
  					<span class="input-group-text text-white bg-dark" id="inputGroup-sizing-default">STOCK</span>
 				 	<input type="text" name="item_name" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
				</div>
            </div>
</div>      
     <div class="bottombtn pt-5 pb-5">
            	<input type="button" class="btn btn-outline-dark" value="목록">
                <input type="submit" class="btn btn-outline-danger" value="등록">
     </div>              
		</form>


</div>

   

<%@ include file="/WEB-INF/views/fix/footer.jsp" %>


</body>
</html>
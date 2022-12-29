<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=dege">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>REGISTER PRODUCT</title>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.css"> <!-- header-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>

<script type="text/javascript">

   $(function() {

      //파일업로드시 썸네일
      $('#upload_image').change(function(e) {
         const images = e.target.files
         $('.img-box').empty();
         for (let i = 0; i < images.length; i++) {
            const Reader = new FileReader();
            Reader.readAsDataURL(images[i]);
            Reader.onload = function() {
               const img = '<img src="'+ Reader.result +'" alt="사진">';
               $('.img-box').append(img);
            }
         }

      })
   })
</script>
<script type="text/javascript">
      $(document).ready(function() {
    	  
    	  $('.summernote').summernote({
              height: 445,                 // 에디터 높이
              focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
              lang: "ko-KR",                    // 한글 설정
              placeholder: '최대 2048자까지 쓸 수 있습니다',    //placeholder 설정
              disableResizeEditor: true,    // 크기 조절 기능 삭제
              toolbar: [
                 ['fontname', ['fontname']],
                 ['fontsize', ['fontsize']],
                 ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
                 ['color', ['forecolor','color']],
                 ['table', ['table']],
                 ['para', ['ul', 'ol', 'paragraph']],
                 ['height', ['height']],
                 ['insert',['picture','link','video']],
                 ['view',['help']]
              ]
    	  
          });
      })   	  
              
              
//     			// 이미지 업로드시 ajax로 파일 업로드를 하고 성공 후 파일 경로를 return받음
// 	          function uploadSummernoteImageFile(file, editor) {
// 	          data = new FormData();
// 	          data.append("file", file);
// 	          $.ajax({
// 	              url : "/summernoteImage",
// 	              data : data,
// 	              type : "POST",
// 	              contentType : false,
// 	              processData : false,
// 	              beforeSend : function(xhr){
// 	                  xhr.setRequestHeader(($("meta[name='_csrf_header']").attr("content")), ($("meta[name='_csrf']").attr("content")));
// 	              },
// 	              success : function(data) {
// 	                  //항상 업로드된 파일의 url이 있어야 한다.
// 	                  $(editor).summernote('insertImage', contextPath+data.url);
//     	  			}
//   			})
//}

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

   <%@ include file="/WEB-INF/views/fix/sellerheader.jsp"%>

   <h2 id="orderpagetitle" class="disply-2 text-center py-4">REGISTER
      PRODUCT</h2>

   <div class="container mb-5 pb-5">
      <div class="border border-3 p-sm-5">

<div align="center">
<form name="frm" id="frm" modelAttribute="product" enctype="multipart/form-data" action="registerPrdt" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<table>
				<tr>
					<th class="input-group-text mb-1">카테고리</th>
					<td>
						<select class="form-select mb-1" id="product_kind" name="product_kind">
							<option value="TOP">TOP</option>
							<option value="BOTTOM">BOTTOM</option>
							<option value="ACC">ACC</option>
							<option value="SHOES">SHOES</option>
						</select>
					</td>
				</tr>
				<tr>
					<th class="input-group-text mb-1">상품이름</th>
					<td>
						<input class="form-control mb-1" type="text" id="product_name" name="product_name" placeholder="상품이름입력" size="40" 
						style="padding:10px;" value="${product.product_name}">
					</td>
				</tr>
				<tr>
					<th class="input-group-text mb-1">상품판매가</th>
					<td>
						<input class="form-control mb-1" type="int" name="product_price" id="product_price" placeholder="상품판매가" size="40" 
						style="padding:10px;" value="${product.product_price}">
					</td>
				</tr>
				
				<tr>
					<th class="input-group-text mb-1">상품설명</th>
					<td>
					<input class="form-control mb-1"  type="text" name="product_info" id="product_info" placeholder="상품설명" size="40" 
					style="padding:10px;" value=<c:if test="${type eq 'modify'}">${map.GOODS_ATT_AMOUNT}</c:if>>
					</td>
				</tr>
				
				<tr>
					<th class="input-group-text mb-1">상품이미지</th>
					<td>
						<div class="imgupload">
						<div class="discription-box"></div>
                     		<input class="form-control mb-1" multiple="multiple" type="file" name="file" id="upload_image" size="40" >
                  		</div>
                  		<div class="img-box"></div>
                  </td>
				</tr>

				<tr>
					<th class="input-group-text mb-1">상품사이즈</th>
					<td>
						<input class="form-control mb-1" type="text" name="prdt_option_size" id="prdt_option_size" placeholder="상품사이즈" size="40" 
						style="padding:10px;" value=<c:if test="${type eq 'modify'}">"${map.GOODS_SELL_PRICE}"</c:if>>
					</td>
				</tr>
				
				<tr>
					<th class="input-group-text mb-1">상품색상</th>
					<td>
						<input class="form-control mb-1" type="text" name="prdt_option_color" id="prdt_option_color" placeholder="컬러" size="40" 
						style="padding:10px;" value=<c:if test="${type eq 'modify'}">${map.GOODS_ATT_COLOR}</c:if>>
					</td>
				</tr>
				
				<tr>
					<th class="input-group-text mb-1">상품수량</th>
					<td>
					<input class="form-control mb-1"  type="text" name="prdt_option_stock" id="prdt_option_stock" placeholder="상품수량" size="40" 
					style="padding:10px;" value=<c:if test="${type eq 'modify'}">${map.GOODS_ATT_AMOUNT}</c:if>>
					</td>
				</tr>
				
								
				<tr>
					<th class="input-group-text mb-1">상품내용</th>
					<td>
						<textarea class="summernote" name="prdt_cont" id="prdt_cont">
						<c:if test="${type eq 'modify'}">${map.GOODS_CONTENT}</c:if>
						</textarea>
					</td>
				</tr>
<%-- 				<input type="hidden" id="IDX" name="IDX" value="${map.GOODS_NO}">  --%>
		</table>
	
	<br>	
	<div align="center">
		<input type="button" class="btn btn-outline-dark" value="목록">
    	<input type="submit" class="btn btn-outline-danger" value="등록">
	</div>
</form>
</div>
</div>
</div>

<%@ include file="/WEB-INF/views/fix/footer.jsp"%>
</body>
</html>
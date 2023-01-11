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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.css"> <!-- header-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>

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
      
    	  // onImageUpload callback
    	     $('#summernote').summernote({
    	       callbacks: {
    	         onImageUpload: function(files) {
    	           // upload image to server and create imgNode...
    	           $summernote.summernote('insertNode', imgNode);
    	         }
    	       }
    	     });

    	     // summernote.image.upload
    	     $('#summernote').on('summernote.image.upload', function(we, files) {
    	       // upload image to server and create imgNode...
    	       $summernote.summernote('insertNode', imgNode);
    	     });	  
      }) 	  
              
	function uploadSummernoteImageFile(file, editor) {
		data = new FormData();
		data.append("file", file);
		$.ajax({
			data : data,
			type : "POST",
			url : "/uploadSummernoteImageFile",
			beforeSend : function(xhr){
				xhr.setRequestHeader(($("meta[name='_csrf_header']").attr("content")), ($("meta[name='_csrf']").attr("content")));
			},
			contentType : false,
			processData : false,
			success : function(data) {
            	//항상 업로드된 파일의 url이 있어야 한다.
				$(editor).summernote('insertImage', data.url);
			}
		});
	}
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
   <script type="text/javascript">
         $(document).ready(function() {   /* main() */
         $("#writeBtn").on("click", function() {
            let form = $("#form")
            form.attr("action", "<c:url value='/seller/registerPrdt/write' />")
            form.attr("method", "post")
            
            if(formCheck())
               form.submit()
         })
         
         let formCheck = function() {
            let form = document.getElementById("form")
            if(form.product_info.value == ""){
               alert("내용을 입력해주세요.")
               form.product_info.focus()
               return false
            }
            if(form.pfiles.value == ""){
                alert("사진을 선택해주세요.")
                form.pfiles.focus()
                return false
             }
            return true;
         }
         
         })
   </script>
   <h2 id="orderpagetitle" class="disply-2 text-center py-4">REGISTER
      PRODUCT</h2>

   <div class="container mb-5 pb-5">
      <div class="border border-3 p-sm-5">

<div align="center">
<form id="form" enctype="multipart/form-data" class="txt" action="" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<input type="hidden" name="product_no" value="${product.product_no }">
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
					style="padding:10px;" value="${product.product_info}">
					</td>
				</tr>
				
				<tr>
					<th class="input-group-text mb-1">상품이미지</th>
					<td>
							
						<!-- 이미지 첨부-->
			            <div class="img container">
			               <div class="imgupload">
			                  
			                     <input type="file" class="hidden_input" id="input_imgs" name="pfiles" multiple />
			                
			                  
			                  <div id="preview"></div>
			
			
			               </div>
			            </div>	
                  		
                  </td>
				</tr>

				<tr>
					<th class="input-group-text mb-1">상품사이즈</th>
					<td>
						<input class="form-control mb-1" type="text" name="prdt_option_size" id="prdt_option_size" placeholder="상품사이즈" size="40" 
						style="padding:10px;" value="${prdt_option.prdt_option_size}">
					</td>
				</tr>
				
				<tr>
					<th class="input-group-text mb-1">상품색상</th>
					<td>
						<input class="form-control mb-1" type="text" name="prdt_option_color" id="prdt_option_color" placeholder="컬러" size="40" 
						style="padding:10px;" value="${prdt_option.prdt_option_color}">
					</td>
				</tr>
				
				<tr>
					<th class="input-group-text mb-1">상품수량</th>
					<td>
					<input class="form-control mb-1"  type="int" name="prdt_option_stock" id="prdt_option_stock" placeholder="상품수량" size="40" 
					style="padding:10px;" value="${prdt_option.prdt_option_stock}">
					</td>
				</tr>
				
								
				<tr>
					<th class="input-group-text mb-1">상품내용</th>
					<td>
						<textarea class="summernote" name="product_detail" id="product_detail">${product.product_detail}
						</textarea>
					</td>
				</tr>
		</table>
	
	<br>	
	<div align="center">
		<button type="button" class="btn btn-outline-dark" onclick="location.href='/lookst/seller/prdtList' ">목록</button>
    	<button type="button" id="writeBtn" class="btn btn-outline-danger" name="sign">등록</button>
	</div>
</form>
</div>
</div>
</div>
   <script type="text/javascript">
      // 이미지 썸네일
      $(document)
            .ready(
                  function(e) {
                     $("input[type='file']").change(
                           function(e) {

                              if ($(".delBtn").length > 0) {
                                 deleteFile();
                              }
                              //div 내용 비워주기
                              $('#preview').empty();

                              var files = e.target.files;
                              var arr = Array.prototype.slice
                                    .call(files);

                              //업로드 가능 파일인지 체크
                              for (var i = 0; i < files.length; i++) {
                                 if (!checkExtension(files[i].name,
                                       files[i].size)) {
                                    return false;
                                 }
                              }

                              preview(arr);

                           });//file change

                     function checkExtension(fileName, fileSize) {

                        var regex = new RegExp(
                              "(.*?)\.(exe|sh|zip|alz)$");
                        var maxSize = 20971520; //20MB

                        if (fileSize >= maxSize) {
                           alert('파일 사이즈 초과');
                           $("input[type='file']").val(""); //파일 초기화
                           return false;
                        }

                        if (regex.test(fileName)) {
                           alert('업로드 불가능한 파일이 있습니다.');
                           $("input[type='file']").val(""); //파일 초기화
                           return false;
                        }
                        return true;
                     }

                     function preview(arr) {
                        arr
                              .forEach(function(f) {

                                 //파일명이 길면 파일명...으로 처리
                                 var fileName = f.name;
                                 if (fileName.length > 10) {
                                    fileName = fileName.substring(
                                          0, 7)
                                          + "...";
                                 }

                                 var imgdiv = $(".img_div");

                                 //div에 이미지 추가
                                 var str = '<div class="img_div" style="display: inline-flex; padding: 10px;"><li>';
                                 str += '<span>' + fileName
                                       + '</span><br>';

                                 //이미지 파일 미리보기
                                 if (f.type.match('image.*')) {
                                    var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
                                    reader.onload = function(e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
                                       str += '<img class="img_list" src="'+e.target.result+'" title="'+f.name+'" width=200 height=200 />';
                                       str += '</li></div>';
                                       $(str).appendTo('#preview');
                                    }
                                    reader.readAsDataURL(f);
                                 } else {
                                    str += '<img class="img" src="/resources/img/fileImg.png" title="'+f.name+'" width=200 height=200 />';
                                    $(str).appendTo('#preview');
                                 }
                              });//arr.forEach

                     }// preview(arr) 끝

                  });
   </script>
<%@ include file="/WEB-INF/views/fix/footer.jsp"%>
</body>
</html>
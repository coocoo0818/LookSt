<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>

<title>Upload</title>
<style>
img {
	max-width: 296px;
	max-height: 360px;
	margin: 10px;
}
</style>


<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var msg = '${msg}';
		if (msg != '') {
			alert(msg);
		}

	})
</script>

</head>
<body>
	<%@ include file="/WEB-INF/views/fix/header.jsp"%>
	<script type="text/javascript">
         $(document).ready(function() {   /* main() */
         $("#uploadBtn").on("click", function() {
            let form = $("#form")
            form.attr("action", "<c:url value='/sns/postUpload' />")
            form.attr("method", "post")
            
            if(formCheck())
               form.submit()
         })
         
         let formCheck = function() {
            let form = document.getElementById("form")
            if(form.post_content.value == ""){
               alert("내용을 입력해주세요.")
               form.post_content.focus()
               return false
            }
            if(form.files.value == ""){
                alert("사진을 선택해주세요.")
                form.files.focus()
                return false
             }
            return true;
         }
         
         })
   </script>
	<!-- Upload -->
	<div class="container">
		<div class="row justify-content-md-center">
			<h2 class="col-auto my-5">Upload</h2>
		</div>
	</div>
	<!-- Upload 끝 -->
	<form id="form" enctype="multipart/form-data" class="txt" action="" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<input type="hidden" name="post_no" value="${pDto.post_no }">
		<div class="upload container mb-5">
			<div class="line border border-4 p-sm-5">

				<!-- 이미지 첨부-->
				<div class="img container">
					<div class="imgupload">
						<button type="button" class=" btn btn-outline-dark mb-3">
							<label class="select_img" for="input_imgs"><i
								class="bi bi-camera fs-2"></i>&nbsp;이미지 선택</label>
							<input type="file" class="hidden_input" id="input_imgs" name="files" multiple style="display:none" />
						</button>
						
						<div id="preview"></div>


					</div>
				</div>

				<div class="img-box mb-5"></div>
				<!-- 이미지 첨부 끝-->
				<!-- 상품 태그-->
				<div class="prdtTag container mb-5">
					<button type="button" class=" btn btn-outline-dark mb-3"
						data-bs-toggle="modal" data-bs-target="#prdtTag-Modal">
						<label class="prdtTag-icon"><i class="bi bi-tag fs-2"></i>&nbsp;상품
							검색</label>
					</button>

					<div class="search-container">
						<!-- <form action="<c:url value="/board/list" />" class="search-form" method="get"> 
                        <input type="text" name="keyword" class="search-input"placeholder="검색어를 입력해주세요" >  
                                value="${parma.keyword }"  
                        <input type="submit" class="search-button" value="검색" >
                     </form>  -->
					</div>
				</div>
				<!-- 상품 태그-->
				<!-- 글 작성-->
				<div class="content container">
					<label class="content-icon mb-3"><i
						class="bi bi-pencil fs-2"></i></label>
					<div class="input-group">
						<textarea name="post_content" style="resize: none;" id="textarea"
							value="${pDto.post_content }" placeholder="내용을 입력하세요."></textarea>


					</div>
				</div>
				<!-- 글 작성 끝-->


				<!-- 업로드버튼 -->
				<div class="upload-btn row">
					<button class="btn btn-outline-dark mb-3" type="button"
						id="uploadBtn" name="sign">업로드</button>
				</div>
				<div class="upload-btn row">
					<button class="btn btn-outline-dark mb-3" type="button" name="save"
						onclick="${contextPath}/sns/snsProfile/?member_id=${member_id}">취소</button>
				</div>
			</div>
		</div>
	</form>
	
	
	<!-- Modal -->
	<div class="modal fade" id="prdtTag-Modal" tabindex="-1"
		aria-labelledby="prdtTag-ModalLabel" aria-hidden="true">
		<div
			class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="prdtTag-ModalLabel">상품 검색</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<!-- <form action="<c:url value="/board/list" />" class="search-form" method="get"> -->
					<input type="text" name="keyword" class="search-input"
						placeholder="Search">
					<!-- value="${parma.keyword }" -->
					<button class="btn btn-secondary" type="submit">
						<i class="d-flex fa fa-search"></i>
					</button>
					<!-- </form> -->
				</div>
				<div class="modal-footer">
					<button type="button" class="select btn btn-primary">선택</button>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/fix/footer.jsp"%>
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
</body>
</html>



















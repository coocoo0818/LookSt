<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<script type="text/javascript">
	// 이미지 업로드 썸네일
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

	// 팔로워 프로필화면 이동
	$('.uploadbutton').on('click', function() {
		let member_id = $(login_id)
		location.href = '${contextPath}/sns/snsProfile/?member_id='+ member_id;
	});
</script>

</head>
<body>
	<%@ include file="/WEB-INF/views/fix/header.jsp"%>
	<!-- Upload -->
	<div class="container">
		<div class="row justify-content-md-center">
			<h2 class="col-auto my-5">Upload</h2>
		</div>
	</div>
	<!-- Upload 끝 -->
	<form name="fileForm" action="postUpload" method="post"
		enctype="multipart/form-data">
		<div class="upload container mb-5">
			<div class="line border border-4 p-sm-5">
				<!-- 이미지 첨부-->
				<div class="img container">
					<div class="imgupload">
						<input multiple="multiple" type="file" name="file"
							id="upload_image" />
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
						<textarea class="form-control"></textarea>

					</div>
				</div>
				<!-- 글 작성 끝-->
				<div class="upload-btn row">
					<div>
						<a href="${contextPath}/sns/snsProfile/?member_id=${login_id}"
							class="followerIDbox" style="text-decoration-line: none;">
							<button type="submit" class="uploadbutton btn btn-primary mt-5"
								style="float: right;">
								<input class="btn btn-primary" type="submit" value="업로드" />
							</button>
						</a>

					</div>
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
</body>
</html>



















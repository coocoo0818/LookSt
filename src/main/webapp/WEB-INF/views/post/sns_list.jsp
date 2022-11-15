<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<title>LOOKST</title>

<style type="text/css">
#profile_img {
	width: 40px;
	height: 40px;
	border-radius: 50%
}

.like_comment 
	button:first-child
	.active {
	color: red;
	/* display: flex;
		height: 40px;
		margin-top: 4px;
		background-color: transparent;
		width: 40px;
		font-size: 25px;
		margin-right: 10px;
		border: 0; */
	cursor: pointer;
}

#product_img {
	width: 40px;
	height: 40px;
	border-radius: 10%;
	margin: 10px 0 5px 0;
	padding: 0;
}

#heart-fill {
	font-size: 22px;
	line-height: 22px;
	color: crimson;
}
</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/fix/header.jsp"%>

	<script type="text/javascript">
		function clickBtn() {
			let _buttonI = event.target;
			const childElement = _buttonI.firstChild;

			if (_buttonI.classList.contains("likeBtn")) {
				if (childElement.classList.contains("far")) {
					childElement.classList.add("fas");
					childElement.classList.add("active");
					childElement.classList.remove("far");
				} else {
					childElement.classList.remove("fas");
					childElement.classList.remove("active");
					childElement.classList.add("far");
				}
			} else {
				if (_buttonI.classList.contains("far")) {
					_buttonI.classList.add("fas");
					_buttonI.classList.add("active");
					_buttonI.classList.remove("far");
				} else {
					_buttonI.classList.remove("fas");
					_buttonI.classList.remove("active");
					_buttonI.classList.add("far");
				}
			}
		}
	</script>

<%-- <c:forEach var="post_list" items="${post_list}">
${post_list.post_img_img}
</c:forEach> --%>
	<div class="container">
		<!-- 상단 인기/최신/팔로우 탭 -->
		<ul class="nav nav-pills col-4 mx-auto my-4" id="pills-tab"
			role="tablist">
			<li class="nav-item mx-auto" role="presentation">
				<button class="nav-link active" id="pills-home-tab"
					data-bs-toggle="pill" data-bs-target="#pills-home" type="button"
					role="tab" aria-controls="pills-home" aria-selected="true">인기
				</button>
			</li>
			<li class="nav-item mx-auto" role="presentation">
				<button class="nav-link" id="pills-profile-tab"
					data-bs-toggle="pill" data-bs-target="#pills-profile" type="button"
					role="tab" aria-controls="pills-profile" aria-selected="false">최신
				</button>
			</li>
			<li class="nav-item mx-auto" role="presentation">
				<button class="nav-link " id="pills-contact-tab"
					data-bs-toggle="pill" data-bs-target="#pills-contact" type="button"
					role="tab" aria-controls="pills-contact" aria-selected="false">팔로우
				</button>
			</li>
		</ul>
		<!-- 메인 해시태그 탭 -->
		<div class="d-grid gap-2 d-md-block text-center">
			<button type="button" class="btn btn-light"
				onclick="location.href='./'">#나이키</button>
			<button type="button" class="btn btn-light"
				onclick="location.href='./'">#에어포스</button>
			<button type="button" class="btn btn-light"
				onclick="location.href='./'">#스투시</button>
			<button type="button" class="btn btn-light"
				onclick="location.href='./'">#스타일컬렉터</button>
			<button type="button" class="btn btn-light"
				onclick="location.href='./'">#OOTD</button>
		</div>
		<!-- sns 메인 -->
		<!-- sns 리스트 #1 -->
		<div class="row row-cols-1 row-cols-md-3 g-4">
		<c:forEach var="post_list" items="${post_list}">
			<div class="col">
				<div class="card">
					<img
						src="${pageContext.request.contextPath }/resources/post/img/${post_list.post_img_img}"
						class="card-img-top" onclick="location.href='${pageContext.request.contextPath }/post/mylist'">
					<div class="card-body">
						<div class="row justify-content-start d-flex">
							<div class="col-3">
								<img
									src="${pageContext.request.contextPath }/resources/post/img/프사2.jpg"
									onclick="location.href='./'" id="profile_img">
							</div>
							<div class="col-5 my-auto" onclick="location.href='./'">
								MyMelody</div>
							<div class="tag_link" style="margin-top: 10px; margin-bottom: 10px;">
								<p class="tag_text" onclick="location.href='./'" style="display: inline;"><b>#LOOKST챌린지</b></p>
								<p class="tag_text" onclick="location.href='./'" style="display: inline;"><b>#나이키</b></p>
								<p class="tag_text" onclick="location.href='./'" style="display: inline;"><b>#조던</b></p>
							</div>
							<div class="like_comment">
								<button onclick="clickBtn()" class="border border-white "
									style="background-color: transparent;">
									<i class="far fa-heart fa-lg"></i>
								</button>
								<button onclick="clickBtn()" class="border border-white"
									style="background-color: transparent;">
									<i class="fa-regular fa-comment-dots fa-lg"></i>
								</button>
							</div>
							<c:forEach var="prod_info" items="${prodinfo }">
							<div class="productDetail d-flex row justify-content-start ">
								<img
									src="${pageContext.request.contextPath }/resources/post/img/${prodinfo.prdt_img_name}"
									onclick="location.href='./'" id="product_img" class="col-3">
								<span class="d-inline-block text-truncate" style="max-width: 280px; font-size: 14px; padding-top: 10px;">
  									<!-- Jordan 1 x Travis Scott x Fragment Retro Low OG SP Military Blue -->${prodinfo.product_name}<br><!-- 1,983,000원 -->${prodinfo.product_price}
								</span>
							</div>
							</c:forEach>
							<div class="productDetail d-flex row justify-content-start">
								<img src="${pageContext.request.contextPath }/resources/post/img/maison_margiela.png"
									id="product_img" class="col-3 ">
								<span class="d-inline-block text-truncate" style="max-width: 280px; font-size: 14px; padding-top: 10px;">
  									MM6 Maison Margiela x Eastpak Mini Shoulder Bag Black<br>399,000원
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			</c:forEach>
			<!-- sns 리스트 #2 -->
			<%-- <div class="col">
				<div class="card">
					<img
						src="${pageContext.request.contextPath }/resources/post/img/KREAM1.jpeg"
						class="card-img-top" alt="...">
					<div class="card-body">
						<div class="row justify-content-start d-flex">
							<div class="col-3">
								<img
									src="${pageContext.request.contextPath }/resources/post/img/프사2.jpg"
									onclick="location.href='./'" id="profile_img">
							</div>
							<div class="col-5 my-auto" onclick="location.href='./'">
								MyMelody</div>
							<div class="tag_link" style="margin-top: 10px; margin-bottom: 10px;">
								<p class="tag_text" onclick="location.href='./'" style="display: inline;"><b>#LOOKST챌린지</b></p>
								<p class="tag_text" onclick="location.href='./'" style="display: inline;"><b>#나이키</b></p>
								<p class="tag_text" onclick="location.href='./'" style="display: inline;"><b>#조던</b></p>
							</div>
							<div class="like_comment">
								<button onclick="clickBtn()" class="border border-white "
									style="background-color: transparent;">
									<i class="far fa-heart fa-lg"></i>
								</button>
								<button onclick="clickBtn()" class="border border-white"
									style="background-color: transparent;">
									<i class="fa-regular fa-comment-dots fa-lg"></i>
								</button>
							</div>
							<div class="productDetail d-flex row justify-content-start ">
								<img
									src="${pageContext.request.contextPath }/resources/post/img/adidas-yeezy-foam-runner-sand-fy4567_1.jpg"
									onclick="location.href='./'" id="product_img" class="col-3">
								<span class="d-inline-block text-truncate" style="max-width: 280px; font-size: 14px; padding-top: 10px;">
  									Adidas Yeezy Foam RNNR Sand<br>174,000원
								</span>
							</div>
							<div class="productDetail d-flex row justify-content-start">
								<img src="${pageContext.request.contextPath }/resources/post/img/a_b4cd98023c4541ad80e3b8743923a812.jpg"
									id="product_img" class="col-3 ">
								<span class="d-inline-block text-truncate" style="max-width: 280px; font-size: 14px; padding-top: 10px;">
  									Yeezy Gap Engineered By Balenciaga Flame Cap Black<br>170,000원
								</span>
							</div>
						</div>
					</div>
				</div>
			</div> --%>
			<!-- sns 리스트 #3 -->
			<%-- <div class="col">
				<div class="card">
					<img
						src="${pageContext.request.contextPath }/resources/post/img/KREAM2.jpeg"
						class="card-img-top" alt="...">
					<div class="card-body">
						<div class="row justify-content-start d-flex">
							<div class="col-3">
								<img
									src="${pageContext.request.contextPath }/resources/post/img/프사2.jpg"
									onclick="location.href='./'" id="profile_img">
							</div>
							<div class="col-5 my-auto" onclick="location.href='./'">
								MyMelody</div>
							<div class="tag_link" style="margin-top: 10px; margin-bottom: 10px;">
								<p class="tag_text" onclick="location.href='./'" style="display: inline;"><b>#LOOKST챌린지</b></p>
								<p class="tag_text" onclick="location.href='./'" style="display: inline;"><b>#나이키</b></p>
								<p class="tag_text" onclick="location.href='./'" style="display: inline;"><b>#조던</b></p>
							</div>
							<div class="like_comment">
								<button onclick="clickBtn()" class="border border-white "
									style="background-color: transparent;">
									<i class="far fa-heart fa-lg"></i>
								</button>
								<button onclick="clickBtn()" class="border border-white"
									style="background-color: transparent;">
									<i class="fa-regular fa-comment-dots fa-lg"></i>
								</button>
							</div>
							<div class="productDetail d-flex row justify-content-start ">
								<img
									src="${pageContext.request.contextPath }/resources/post/img/airforce.png"
									onclick="location.href='./'" id="product_img" class="col-3">
								<span class="d-inline-block text-truncate" style="max-width: 280px; font-size: 14px; padding-top: 10px;">
  									(W) Nike Air Force 1 '07 LV8 Photon Dust Cashmere<br>300,000원
								</span>
							</div>
							<div class="productDetail d-flex row justify-content-start">
								<img
									src="${pageContext.request.contextPath }/resources/post/img/vivienne.webp"
									id="product_img" class="col-3 ">
								<span class="d-inline-block text-truncate" style="max-width: 280px; font-size: 14px; padding-top: 10px;">
  									Vivienne Westwood Mayfair Bas Relief Pendant Silver<br>170,000원
								</span>
							</div>
						</div>
					</div>
				</div>
			</div> --%>
			<!-- sns 리스트 #4 -->
			<%-- <div class="col">
				<div class="card">
					<img
						src="${pageContext.request.contextPath }/resources/post/img/master.jpg"
						class="card-img-top" alt="...">
					<div class="card-body">
						<div class="row justify-content-start d-flex">
							<div class="col-3">
								<img
									src="${pageContext.request.contextPath }/resources/post/img/프사2.jpg"
									onclick="location.href='./'" id="profile_img">
							</div>
							<div class="col-5 my-auto" onclick="location.href='./'">
								MyMelody</div>
							<div class="main_hash d-inline-flex p-2">
								<a href="">#LookSt</a><a href="">#스타일컬렉터</a> #OOTD
								</p>
							</div>
							<div class="like_comment">
								<button onclick="clickBtn()" class="border border-white "
									style="background-color: transparent;">
									<i class="far fa-heart fa-lg"></i>
								</button>
								<button onclick="clickBtn()" class="border border-white"
									style="background-color: transparent;">
									<i class="fa-regular fa-comment-dots fa-lg"></i>
								</button>
							</div>
							<div class="productDetail d-flex row justify-content-start ">
								<img
									src="${pageContext.request.contextPath }/resources/post/img/mircoday.jpg"
									onclick="location.href='./'" id="product_img" class="col-3">
								<span class="d-inline-block text-truncate" style="max-width: 280px; font-size: 14px; padding-top: 10px;">
  									(W) Nike Air Force 1 '07 LV8 Photon Dust Cashmere<br>300,000원
								</span>
							</div>
							<div class="productDetail d-flex row justify-content-start">
								<img
									src="${pageContext.request.contextPath }/resources/post/img/mircoday.jpg"
									id="product_img" class="col-3 ">
								<span class="d-inline-block text-truncate" style="max-width: 280px; font-size: 14px; padding-top: 10px;">
  									(W) Nike Air Force 1 '07 LV8 Photon Dust Cashmere<br>300,000원
								</span>
							</div>
						</div>
					</div>
				</div>
			</div> --%>
			<!-- sns 리스트 #5 -->
			<%-- <div class="col">
				<div class="card">
					<img
						src="${pageContext.request.contextPath }/resources/post/img/master.jpg"
						class="card-img-top" alt="...">
					<div class="card-body">
						<div class="row justify-content-start d-flex">
							<div class="col-3">
								<img
									src="${pageContext.request.contextPath }/resources/post/img/프사2.jpg"
									onclick="location.href='./'" id="profile_img">
							</div>
							<div class="col-5 my-auto" onclick="location.href='./'">
								MyMelody</div>
							<div class="main_hash d-inline-flex p-2">
								<a href="">#LookSt</a><a href="">#스타일컬렉터</a> #OOTD
								</p>
							</div>
							<div class="like_comment">
								<button onclick="clickBtn()" class="border border-white "
									style="background-color: transparent;">
									<i class="far fa-heart fa-lg"></i>
								</button>
								<button onclick="clickBtn()" class="border border-white"
									style="background-color: transparent;">
									<i class="fa-regular fa-comment-dots fa-lg"></i>
								</button>
							</div>
							<div class="productDetail d-flex row justify-content-start ">
								<img
									src="${pageContext.request.contextPath }/resources/post/img/mircoday.jpg"
									onclick="location.href='./'" id="product_img" class="col-3">
								<span class="d-inline-block text-truncate" style="max-width: 280px; font-size: 14px; padding-top: 10px;">
  									(W) Nike Air Force 1 '07 LV8 Photon Dust Cashmere<br>300,000원
								</span>
							</div>
							<div class="productDetail d-flex row justify-content-start">
								<img
									src="${pageContext.request.contextPath }/resources/post/img/mircoday.jpg"
									id="product_img" class="col-3 ">
								<span class="d-inline-block text-truncate" style="max-width: 280px; font-size: 14px; padding-top: 10px;">
  									(W) Nike Air Force 1 '07 LV8 Photon Dust Cashmere<br>300,000원
								</span>
							</div>
						</div>
					</div>
				</div>
			</div> --%>
			<!-- sns 리스트 #6 -->
			<%-- <div class="col">
				<div class="card">
					<img
						src="${pageContext.request.contextPath }/resources/post/img/master.jpg"
						class="card-img-top" alt="...">
					<div class="card-body">
						<div class="row justify-content-start d-flex">
							<div class="col-3">
								<img
									src="${pageContext.request.contextPath }/resources/post/img/프사2.jpg"
									onclick="location.href='./'" id="profile_img">
							</div>
							<div class="col-5 my-auto" onclick="location.href='./'">
								MyMelody</div>
							<div class="main_hash d-inline-flex p-2">
								<a href="">#LookSt</a><a href="">#스타일컬렉터</a> #OOTD
								</p>
							</div>
							<div class="like_comment">
								<button onclick="clickBtn()" class="border border-white "
									style="background-color: transparent;">
									<i class="far fa-heart fa-lg"></i>
								</button>
								<button onclick="clickBtn()" class="border border-white"
									style="background-color: transparent;">
									<i class="fa-regular fa-comment-dots fa-lg"></i>
								</button>
							</div>
							<div class="productDetail d-flex row justify-content-start ">
								<img
									src="${pageContext.request.contextPath }/resources/post/img/mircoday.jpg"
									onclick="location.href='./'" id="product_img" class="col-3">
								<span class="d-inline-block text-truncate" style="max-width: 280px; font-size: 14px; padding-top: 10px;">
  									(W) Nike Air Force 1 '07 LV8 Photon Dust Cashmere<br>300,000원
								</span>
							</div>
							<div class="productDetail d-flex row justify-content-start">
								<img
									src="${pageContext.request.contextPath }/resources/post/img/mircoday.jpg"
									id="product_img" class="col-3 ">
								<span class="d-inline-block text-truncate" style="max-width: 280px; font-size: 14px; padding-top: 10px;">
  									(W) Nike Air Force 1 '07 LV8 Photon Dust Cashmere<br>300,000원
								</span>
							</div>
						</div>
					</div>
				</div>
			</div> --%>
			<!-- sns 리스트끝  -->
		</div>
		<!-- sns 메인 끝 -->

	</div>









		<a href="<c:url value="/admin/memberlist"/>">admin</a>
		<%@ include file="/WEB-INF/views/fix/footer.jsp"%>
</body>
</html>

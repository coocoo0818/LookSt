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
.prod_detail {
	max-width: 150px;
	font-size: 12px; 
	text-overflow: ellipsis; 
	display: -webkit-box; 
	overflow: hidden; 
	-webkit-box-orient: vertical; 
	-webkit-line-clamp: 2;
}
.like_comment 
	button:first-child
	.active {
	color: red;
	cursor: pointer;
}
.like_comment {
	margin: 10px 0 10px 0;
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

	<div class="container">
		<!-- 상단 인기/최신/팔로우 탭 -->
		<div class="nav_tab sticky-top" style="background-color: white;">
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
			<hr/>
		</div>
		
		<!-- sns 리스트 상세#1 -->
		<div class="list_container row justify-content-center">
			<div class="card mb-3 w-50 p-3 " style="position: relative;">
				<!-- sns 프로필/닉네임 -->
				<div class="d-flex justify-content-between">
					<div class=" mb-2 mt-2 align-self-center">
						<img
							src="${pageContext.request.contextPath }/resources/post/img/프사2.jpg"
							onclick="location.href='./'" id="profile_img">
						<p class="my-auto d-inline ms-3" onclick="location.href='./'">MyMelody</p>
					</div>
					<!-- sns 팔로우버튼 -->
					<button type="button"
						class="btn btn-outline-dark h-75 align-self-center"><p>팔로우</p></button>
				</div>
				<!-- sns 캐러셀 #1 -->
				<div id="carouselExampleIndicators" class="carousel slide"
					data-bs-ride="true">
					<div class="carousel-indicators">
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="0" class="active" aria-current="true"
							aria-label="Slide 1"></button>
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="1" aria-label="Slide 2"></button>
						<!-- <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button> -->
					</div>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img
								src="${pageContext.request.contextPath }/resources/post/img/p_25b2d5ab0b7a433aa72c98b1c468deef.jpeg"
								class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img
								src="${pageContext.request.contextPath }/resources/post/img/carousel1_2.jpeg"
								class="d-block w-100" alt="...">
						</div>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
				<!-- sns 캐러셀 #1 끝 -->
				<!-- 상품 상세 설명 -->
				<div class="card-body" style="padding: 10px;">
					<p class="card-text">
						<small class="text-muted">Last updated 3 mins ago</small>
					</p>
					<p class="card-title"><b>상품태그 2개</b></p>
					<div class="row row-cols-1 row-cols-md-3 g-4">
					  <div class="col">
					    <div class="card">
					      <img src="${pageContext.request.contextPath }/resources/post/img/Jordan_1.png" class="card-img-top" onclick="location.href='./'">
					      <div class="card-body">
					        <span class="prod_detail">
  									Jordan 1 x Travis Scott x Fragment Retro Low OG SP Military Bluebr
							</span>
							<p>170,000원</p>
					      </div>
					    </div>
					  </div>
					  <div class="col">
					    <div class="card">
					      <img src="${pageContext.request.contextPath }/resources/post/img/maison_margiela.png" class="card-img-top" onclick="location.href='./'">
					      <div class="card-body">
					        <span class="prod_detail">
  									MM6 Maison Margiela x Eastpak Mini Shoulder Bag Black
							</span>
							<p>399,000원</p>
					      </div>
					    </div>
					  </div>
					</div>
					<!-- 상품 상세 설명 끝 -->
					<!-- 좋아요 / 댓글 / 공유 버튼 -->
					<div class="like_comment">
						<button onclick="clickBtn()" class="border border-white "
									style="background-color: transparent;">
							<i class="far fa-heart fa-2x"></i>
						</button>
						<button onclick="clickBtn()" class="border border-white"
									style="background-color: transparent;">
							<i class="fa-regular fa-comment-dots fa-2x"></i>
						</button>
						<button onclick="clickBtn()" class="border border-white position-absolute end-0"
									style="background-color: transparent; margin-right:20px;">
							<i class="fa-regular fa-bookmark fa-2x"></i>
						</button>
					</div>
					<!-- 좋아요 개수-->
					<p class="card-title"><b>좋아요 10개</b></p>
					<!-- 게시글 / 태그 -->
					<p class="card-text">EZEN</p>
					<div class="tag_link">
						<p class="tag_text" onclick="location.href='./'" style="display: inline;"><b>#LOOKST챌린지</b></p>
						<p class="tag_text" onclick="location.href='./'" style="display: inline;"><b>#나이키</b></p>
						<p class="tag_text" onclick="location.href='./'" style="display: inline;"><b>#조던</b></p>
					</div>
					<!-- 댓글 -->
					<div class="comment_box" style="display: inline;">
                    	<div class="profile_info" style="display: flex; ">
                     		<img src="${pageContext.request.contextPath }/resources/post/img/프사2.jpg" id="profile_img" >
                   			<div class="comment_detail" style="margin-left: 10px;">
	                      		<div class="comment_main">
	                        		<span class="user_nm">ezen_0111</span>
	                        		<span class="comment_txt">감망이감망이감망이</span>
	                      		</div>
	                      		<div class="sub">
	                        		<span class="upload-time">8분전</span>
                      			</div>
                    		</div>
                   		</div>
                   		<div class="profile_info" style="display: flex; ">
                     		<img src="${pageContext.request.contextPath }/resources/post/img/프사2.jpg" id="profile_img" >
                   			<div class="comment_detail" style="margin-left: 10px;">
	                      		<div class="comment_main">
	                        		<span class="user_nm">ezen_0111</span>
	                        		<span class="comment_txt">감망이감망이감망이</span>
	                      		</div>
	                      		<div class="sub">
	                        		<span class="upload-time">8분전</span>
                      			</div>
                    		</div>
                   		</div>
                  	</div>
                  	<button type="button" class="btn btn-secondary">댓글 더보기...</button>
				</div>
			</div>
		</div>
		<!-- sns 리스트 상세#2 -->
		<div class="list_container row justify-content-center">
			<div class="card mb-3 w-50 p-3 " style="position: relative;">
				<!-- sns 프로필/닉네임 -->
				<div class="d-flex justify-content-between">
					<div class=" mb-2 mt-2 align-self-center">
						<img
							src="${pageContext.request.contextPath }/resources/post/img/프사2.jpg"
							onclick="location.href='./'" id="profile_img">
						<p class="my-auto d-inline ms-3" onclick="location.href='./'">MyMelody</p>
					</div>
					<!-- sns 팔로우버튼 -->
					<button type="button"
						class="btn btn-outline-dark h-75 align-self-center"><p>팔로우</p></button>
				</div>
				<!-- sns 캐러셀 #2 -->
				<div id="carouselExampleIndicators1" class="carousel slide" data-bs-ride="true">
				  <div class="carousel-indicators">
				    <button type="button" data-bs-target="#carouselExampleIndicators1" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
				    <button type="button" data-bs-target="#carouselExampleIndicators1" data-bs-slide-to="1" aria-label="Slide 2"></button>
				    <button type="button" data-bs-target="#carouselExampleIndicators1" data-bs-slide-to="2" aria-label="Slide 3"></button>
				  </div>
				  <div class="carousel-inner">
				    <div class="carousel-item active">
				      <img src="${pageContext.request.contextPath }/resources/post/img/KREAM2.jpeg" class="d-block w-100" alt="...">
				    </div>
				    <div class="carousel-item">
				      <img src="${pageContext.request.contextPath }/resources/post/img/KREAM3.jpeg" class="d-block w-100" alt="...">
				    </div>
				    <div class="carousel-item">
				      <img src="${pageContext.request.contextPath }/resources/post/img/KREAM4.jpeg" class="d-block w-100" alt="...">
				    </div>
				  </div>
				  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators1" data-bs-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Previous</span>
				  </button>
				  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators1" data-bs-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Next</span>
				  </button>
				</div>
				<!-- sns 캐러셀 #2 끝 -->
				<!-- 상품 상세 설명 -->
				<div class="card-body" style="padding: 10px;">
					<p class="card-text">
						<small class="text-muted">Last updated 3 mins ago</small>
					</p>
					<p class="card-title"><b>상품태그 2개</b></p>
					<div class="row row-cols-1 row-cols-md-3 g-4">
					  <div class="col">
					    <div class="card">
					      <img src="${pageContext.request.contextPath }/resources/post/img/airforce.png" class="card-img-top" onclick="location.href='./'">
					      <div class="card-body">
					        <span class="prod_detail">
  									(W) Nike Air Force 1 '07 LV8 Photon Dust Cashmere
							</span>
							<p>300,000원</p>
					      </div>
					    </div>
					  </div>
					  <div class="col">
					    <div class="card">
					      <img src="${pageContext.request.contextPath }/resources/post/img/vivienne.webp" class="card-img-top" onclick="location.href='./'">
					      <div class="card-body">
					        <span class="prod_detail">
  									Vivienne Westwood Mayfair Bas Relief Pendant Silver
							</span>
							<p>170,000원</p>
					      </div>
					    </div>
					  </div>
					</div>
					<!-- 상품 상세 설명 끝 -->
					<!-- 좋아요 / 댓글 / 공유 버튼 -->
					<div class="like_comment">
						<button onclick="clickBtn()" class="border border-white "
									style="background-color: transparent;">
							<i class="far fa-heart fa-2x"></i>
						</button>
						<button onclick="clickBtn()" class="border border-white"
									style="background-color: transparent;">
							<i class="fa-regular fa-comment-dots fa-2x"></i>
						</button>
						<button onclick="clickBtn()" class="border border-white position-absolute end-0"
									style="background-color: transparent; margin-right:20px;">
							<i class="fa-regular fa-bookmark fa-2x"></i>
						</button>
					</div>
					<!-- 좋아요 개수-->
					<p class="card-title"><b>좋아요 10개</b></p>
					<!-- 게시글 / 태그 -->
					<p class="card-text">EZEN</p>
					<div class="tag_link">
						<p class="tag_text" onclick="location.href='./'" style="display: inline;"><b>#LOOKST챌린지</b></p>
						<p class="tag_text" onclick="location.href='./'" style="display: inline;"><b>#나이키</b></p>
						<p class="tag_text" onclick="location.href='./'" style="display: inline;"><b>#조던</b></p>
					</div>
					<!-- 댓글 -->
					<div class="comment_box" style="display: inline;">
                    	<div class="profile_info" style="display: flex; ">
                     		<img src="${pageContext.request.contextPath }/resources/post/img/프사2.jpg" id="profile_img" >
                   			<div class="comment_detail" style="margin-left: 10px;">
	                      		<div class="comment_main">
	                        		<span class="user_nm">ezen_0111</span>
	                        		<span class="comment_txt">감망이감망이감망이</span>
	                      		</div>
	                      		<div class="sub">
	                        		<span class="upload-time">8분전</span>
                      			</div>
                    		</div>
                   		</div>
                   		<div class="profile_info" style="display: flex; ">
                     		<img src="${pageContext.request.contextPath }/resources/post/img/프사2.jpg" id="profile_img" >
                   			<div class="comment_detail" style="margin-left: 10px;">
	                      		<div class="comment_main">
	                        		<span class="user_nm">ezen_0111</span>
	                        		<span class="comment_txt">감망이감망이감망이</span>
	                      		</div>
	                      		<div class="sub">
	                        		<span class="upload-time">8분전</span>
                      			</div>
                    		</div>
                   		</div>
                  	</div>
                  	<button type="button" class="btn btn-secondary">댓글 더보기...</button>
				</div>
			</div>
		</div>
		
	</div>











		<a href="<c:url value="/admin/memberlist"/>">admin</a>
		<%@ include file="/WEB-INF/views/fix/footer.jsp"%>
</body>
</html>

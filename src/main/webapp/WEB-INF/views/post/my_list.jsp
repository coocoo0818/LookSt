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
	input { width: 100%; height: 35px; margin: 5px 0px 10px 0px; border: 1px solid #e9e8e8; padding: 8px; background: #f8f8f8; outline-color: #e6e6e6; }
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
		
		// 프로필화면 이동
		$(document).ready(function() {
			$('.IDbox').on('click', function() {
				let member_id = $(this).children().attr("data-member_id")
				alert(member_nick)
				location.href = '${contextPath}/sns/snsProfile/?member_id='+member_id;
			});
		});
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
			<c:forEach var="postComTaglist" items="${postComTaglist}">
				<!-- sns 프로필/닉네임 -->
				<div class="d-flex justify-content-between">
					<a href="<!-- javascript:IDbox(); -->${contextPath}/sns/snsProfile/?member_id=${postComTaglist.member_id}" class="IDbox">
						<div class="nickbox mb-2 mt-2 align-self-center" data-memberID="${postComTaglist.member_id}">
							<img
								src="${pageContext.request.contextPath }/resources/img/profile/${postComTaglist.profile_img} "
								 id="profile_img">
							<p class="my-auto d-inline ms-3" >${postComTaglist.member_nick}</p>
						</div>
					</a>
					<!-- sns 팔로우버튼 -->
					<button type="button"
						class="btn btn-outline-dark h-75 align-self-center"><p>팔로우</p></button>
				</div>
				<!-- sns 캐러셀 #1 -->
				<div id="carouselExampleIndicators" class="carousel slide"
					data-bs-ride="true">
					<div class="carousel-indicators">
						<button tymember_nickpe="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="0" class="active" aria-current="true"
							aria-label="Slide 1"></button>
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="1" aria-label="Slide 2"></button>
						<!-- <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button> -->
					</div>
					<div class="carousel-inner">
					<c:forEach var="postImgListCarousel" items="${postImgListCarousel}">
						<div class="carousel-item active">
							<img
								src="${pageContext.request.contextPath }/resources/img/post/${postImgListCarousel.post_img_img}"
								class="d-block w-100" alt="...">
						</div>					
					</c:forEach>
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
						<div class="row row-cols-1 row-cols-md-3 g-4">
						<c:forEach var="postImgListPrdt" items="${postImgListPrdt}">
						  <div class="col">
						    <div class="card">
						      <img src="${pageContext.request.contextPath }/resources/img/post/${postImgListPrdt.post_tag_img}" class="card-img-top" onclick="location.href='./'">
						      <div class="card-body">
						        <span class="prod_detail">
	  									${postImgListPrdt.post_tag_name}	
								</span>
								<span>
									<!-- 399,000원 -->${postImgListPrdt.post_tag_price}
								</span>
						      </div>
						    </div>
						  </div>
						 </c:forEach> 
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
					<p class="card-text">${postComTaglist.post_content}</p>
					<div class="tag_link" style="margin-bottom:20px;">
						<p class="tag_text" onclick="location.href='./'" style="display: inline; margin-bottom:40px;"><b>${postComTaglist.tag_content}</b></p>
						<!--  <p class="tag_text" onclick="location.href='./'" style="display: inline;"><b>#나이키</b></p>
						<p class="tag_text" onclick="location.href='./'" style="display: inline;"><b>#조던</b></p>-->
					</div>
					댓글  <input type="text" name="comment" style="margin-bottom: 10px;"/><br/>
					<button id="insertBtn" type="button">댓글작성</button>
					<button id="modBtn" type="button">수정하기</button><hr>
			</c:forEach>
					<!-- 댓글 -->
						<div class="comment_box" style="display: inline; ">
							<c:forEach var="snscommentlist" items="${snscommentlist}">
			                    <div class="profile_info" style="display: flex; margin-top:10px">
			                     	<img src="${pageContext.request.contextPath }/resources/img/profile/${snscommentlist.profile_img}" id="profile_img" >
			                   		<div class="comment_detail" style="margin-left: 10px;">
				                      	<div class="comment_main">
				                        	<span class="user_nm">${snscommentlist.member_nick}</span>
				                        	<span class="comment_txt">${snscommentlist.sns_comment_con}</span>
				                      	</div>
				                      	<div class="sub">
				                        	<span class="upload-time">${snscommentlist.sns_comment_date}</span>
			                      		</div>
			                    	</div>
			                   	</div>
		                   		<%-- <div class="profile_info" style="display: flex; ">
		                     		<img src="${pageContext.request.contextPath }/resources/img/post/프사2.jpg" id="profile_img" >
		                   			<div class="comment_detail" style="margin-left: 10px;">
			                      		<div class="comment_main">
				                        	<span class="user_nm">ezen_0111</span>
				                        	<span class="comment_txt">감망이감망이감망이</span>
			                      		</div>
			                      		<div class="sub">
			                        		<span class="upload-time">8분전</span>
		                      			</div>
		                    		</div>
		                   		</div> --%>
	                   		</c:forEach>
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
					<a href="<!-- javascript:IDbox(); -->${contextPath}/sns/snsProfile/?member_id=${postComTaglist.member_id}" class="IDbox">
						<div class=" mb-2 mt-2 align-self-center" data-memberID="${postComTaglist.member_id}">
							<img
								src="${pageContext.request.contextPath }/resources/img/post/프사2.jpg"
								 id="profile_img">
							<p class="my-auto d-inline ms-3">"${postComTaglist.member_nick}</p>
						</div>
					</a>
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
				      <img src="${pageContext.request.contextPath }/resources/img/post/KREAM2.jpeg" class="d-block w-100" alt="...">
				    </div>
				    <div class="carousel-item">
				      <img src="${pageContext.request.contextPath }/resources/img/post/KREAM3.jpeg" class="d-block w-100" alt="...">
				    </div>
				    <div class="carousel-item">
				      <img src="${pageContext.request.contextPath }/resources/img/post/KREAM4.jpeg" class="d-block w-100" alt="...">
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
					      <img src="${pageContext.request.contextPath }/resources/img/post/airforce.png" class="card-img-top" onclick="location.href='./'">
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
					      <img src="${pageContext.request.contextPath }/resources/img/post/vivienne.webp" class="card-img-top" onclick="location.href='./'">
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
                     		<img src="${pageContext.request.contextPath }/resources/img/post/프사2.jpg" id="profile_img" >
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
                     		<img src="${pageContext.request.contextPath }/resources/img/post/프사2.jpg" id="profile_img" >
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

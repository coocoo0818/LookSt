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
	
</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/fix/header.jsp"%>

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
		<!-- sns 리스트 상세 -->
		<div class="list_container row justify-content-center">
			<div class="card mb-3 w-50 p-3 " style="position: relative;">
				<!-- sns 프로필/닉네임 -->
				<div class="row justify-content-start d-flex">
					<div class="col-2">
						<img src="${pageContext.request.contextPath }/resources/post/img/프사2.jpg" onclick="location.href='./'" id="profile_img">
				</div>
				<div class="col-5 my-auto" onclick="location.href='./'">MyMelody</div>
				<!-- sns 팔로우버튼 -->
				
				
		 	 	<!-- sns 캐러셀 #1 -->
		 	 	<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
 				 	<div class="carousel-indicators">
					    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
					    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
					    <!-- <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button> -->
  					</div>
			  		<div class="carousel-inner">
			   			<div class="carousel-item active">
			     		 	<img src="${pageContext.request.contextPath }/resources/post/img/p_25b2d5ab0b7a433aa72c98b1c468deef.jpeg" class="d-block w-100" alt="...">
			    		</div>
			    		<div class="carousel-item">
			     		 	<img src="${pageContext.request.contextPath }/resources/post/img/carousel1_2.jpeg" class="d-block w-100" alt="...">
			    		</div>
			    		<!-- <div class="carousel-item">
			      			<img src="..." class="d-block w-100" alt="...">
			    		</div> -->
			  		</div>
					<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
					  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
					  <span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
					  <span class="carousel-control-next-icon" aria-hidden="true"></span>
					  <span class="visually-hidden">Next</span>
					</button>
				</div>
				<!-- sns 캐러셀 #1 끝 -->
		  		<div class="card-body">
		    		<h5 class="card-title">Card title</h5>
		    		<p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
		    		<p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
		  		</div>
			</div>
		</div>
	</div>
	


	








	<a href="<c:url value="/admin/memberlist"/>">admin</a>
	<%@ include file="/WEB-INF/views/fix/footer.jsp"%>
</body>
</html>

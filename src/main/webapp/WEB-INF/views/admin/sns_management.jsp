<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member management</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"
	type="text/javascript"></script>
<meta name="viewport" content="width=device-width">
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css"> -->
<link rel="stylesheet"
	href="${contextPath}/resources/admin/css/member_management.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
</head>
<body>
	<%@ include file="/WEB-INF/views/fix/adminheader.jsp"%>

	<!-- 리스트 -->

	<div class="container">
		<h2 id="orderpagetitle" class="disply-2 text-center py-4">SNS MANAGEMENT</h2>
		<!--  -->
		<div class="row py-3">
			<div class="col mt-1">
				<select id="inputState" class="form-select form-select-md">
					<option selected>전체</option>
					<option value="1">아이디</option>
					<option value="2">번호</option>
				</select>
			</div>
			<form class="d-flex col-md-9 mt-1">
				<input class="form-control form-control me-1" type="text"
					placeholder="Search" style="float: right;">
				<button class="btn btn-secondary" type="submit">
					<i class="d-flex fa fa-search"></i>
				</button>
			</form>
		</div>
		<!--  -->

				<!-- sns 메인 -->
		<!-- sns 리스트 #1 -->
		<div class="row row-cols-1 row-cols-md-4 g-4">
			<div class="col">
				<div class="card border-0">
					<img
						src="${contextPath}/resources/post/img/p_25b2d5ab0b7a433aa72c98b1c468deef.jpeg"
						class="card-img-top rounded" onclick="location.href='${contextPath}/post/mylist'">
					<div class="card-body">
						<div class="row justify-content-start d-flex">
							<div class="col-2">
								<img class="rounded-circle" style="width: 40px; height: 40px;"
									src="${contextPath}/resources/post/img/프사2.jpg"
									onclick="location.href='./'" id="profile_img">
							</div>
							<div class="col-6 my-auto" onclick="location.href='./'"> MyMelody</div>
							<button class="col-3 btn btn-outline-danger btn-sm rounded">버튼</button>

						</div>
					</div>
				</div>
			</div>
			<!-- sns 리스트 #2 -->
		<div class="col">
				<div class="card border-0">
					<img
						src="${contextPath}/resources/post/img/p_25b2d5ab0b7a433aa72c98b1c468deef.jpeg"
						class="card-img-top rounded" onclick="location.href='${contextPath}/post/mylist'">
					<div class="card-body">
						<div class="row justify-content-start d-flex">
							<div class="col-2">
								<img class="rounded-circle" style="width: 40px; height: 40px;"
									src="${contextPath}/resources/post/img/프사2.jpg"
									onclick="location.href='./'" id="profile_img">
							</div>
							<div class="col-6 my-auto" onclick="location.href='./'"> MyMelody</div>
							<button class="col-3 btn btn-outline-danger btn-sm rounded">버튼</button>

						</div>
					</div>
				</div>
			</div>
			<!-- sns 리스트 #3 -->
			<div class="col">
				<div class="card border-0">
					<img
						src="${contextPath}/resources/post/img/p_25b2d5ab0b7a433aa72c98b1c468deef.jpeg"
						class="card-img-top rounded" onclick="location.href='${contextPath}/post/mylist'">
					<div class="card-body">
						<div class="row justify-content-start d-flex">
							<div class="col-2">
								<img class="rounded-circle" style="width: 40px; height: 40px;"
									src="${contextPath}/resources/post/img/프사2.jpg"
									onclick="location.href='./'" id="profile_img">
							</div>
							<div class="col-6 my-auto" onclick="location.href='./'"> MyMelody</div>
							<button class="col-3 btn btn-outline-danger btn-sm rounded">버튼</button>

						</div>
					</div>
				</div>
			</div>
			<!-- sns 리스트 #4 -->
			<div class="col">
				<div class="card border-0">
					<img
						src="${contextPath}/resources/post/img/p_25b2d5ab0b7a433aa72c98b1c468deef.jpeg"
						class="card-img-top rounded" onclick="location.href='${contextPath}/post/mylist'">
					<div class="card-body">
						<div class="row justify-content-start d-flex">
							<div class="col-2">
								<img class="rounded-circle" style="width: 40px; height: 40px;"
									src="${contextPath}/resources/post/img/프사2.jpg"
									onclick="location.href='./'" id="profile_img">
							</div>
							<div class="col-6 my-auto" onclick="location.href='./'"> MyMelody</div>
							<button class="col-3 btn btn-outline-danger btn-sm rounded">버튼</button>

						</div>
					</div>
				</div>
			</div>
			<!-- sns 리스트 #5 -->
			<div class="col">
				<div class="card border-0">
					<img
						src="${contextPath}/resources/post/img/p_25b2d5ab0b7a433aa72c98b1c468deef.jpeg"
						class="card-img-top rounded" onclick="location.href='${contextPath}/post/mylist'">
					<div class="card-body">
						<div class="row justify-content-start d-flex">
							<div class="col-2">
								<img class="rounded-circle" style="width: 40px; height: 40px;"
									src="${contextPath}/resources/post/img/프사2.jpg"
									onclick="location.href='./'" id="profile_img">
							</div>
							<div class="col-6 my-auto" onclick="location.href='./'"> MyMelody</div>
							<button class="col-3 btn btn-outline-danger btn-sm rounded">버튼</button>

						</div>
					</div>
				</div>
			</div>
			<!-- sns 리스트 #6 -->
			<div class="col">
				<div class="card border-0">
					<img
						src="${contextPath}/resources/post/img/p_25b2d5ab0b7a433aa72c98b1c468deef.jpeg"
						class="card-img-top rounded" onclick="location.href='${contextPath}/post/mylist'">
					<div class="card-body">
						<div class="row justify-content-start d-flex">
							<div class="col-2">
								<img class="rounded-circle" style="width: 40px; height: 40px;"
									src="${contextPath}/resources/post/img/프사2.jpg"
									onclick="location.href='./'" id="profile_img">
							</div>
							<div class="col-6 my-auto" onclick="location.href='./'"> MyMelody</div>
							<button class="col-3 btn btn-outline-danger btn-sm rounded">버튼</button>

						</div>
					</div>
				</div>
			</div>
						<!-- sns 리스트 #7 -->
			<div class="col">
				<div class="card border-0">
					<img
						src="${contextPath}/resources/post/img/p_25b2d5ab0b7a433aa72c98b1c468deef.jpeg"
						class="card-img-top rounded" onclick="location.href='${contextPath}/post/mylist'">
					<div class="card-body">
						<div class="row justify-content-start d-flex">
							<div class="col-2">
								<img class="rounded-circle" style="width: 40px; height: 40px;"
									src="${contextPath}/resources/post/img/프사2.jpg"
									onclick="location.href='./'" id="profile_img">
							</div>
							<div class="col-6 my-auto" onclick="location.href='./'"> MyMelody</div>
							<button class="col-3 btn btn-outline-danger btn-sm rounded">버튼</button>

						</div>
					</div>
				</div>
			</div>
						<!-- sns 리스트 #8 -->
			<div class="col">
				<div class="card border-0">
					<img
						src="${contextPath}/resources/post/img/p_25b2d5ab0b7a433aa72c98b1c468deef.jpeg"
						class="card-img-top rounded" onclick="location.href='${contextPath}/post/mylist'">
					<div class="card-body">
						<div class="row justify-content-start d-flex">
							<div class="col-2">
								<img class="rounded-circle" style="width: 40px; height: 40px;"
									src="${contextPath}/resources/post/img/프사2.jpg"
									onclick="location.href='./'" id="profile_img">
							</div>
							<div class="col-6 my-auto" onclick="location.href='./'"> MyMelody</div>
							<button class="col-3 btn btn-outline-danger btn-sm rounded">버튼</button>

						</div>
					</div>
				</div>
			</div>
			<!-- sns 리스트끝  -->
		</div>
		<!-- sns 메인 끝 -->
		<!--  -->
		<ul class="pagination" style="justify-content: center;">
			<li class="page-item disabled"><a class="page-link" href="#">&laquo;</a>
			</li>
			<li class="page-item active"><a class="page-link" href="#">1</a>
			</li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#">4</a></li>
			<li class="page-item"><a class="page-link" href="#">5</a></li>
			<li class="page-item"><a class="page-link" href="#">&raquo;</a>
			</li>
		</ul>
		<!--  -->
	</div>
	<!-- 리스트 -->

	<script
		src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<%@ include file="/WEB-INF/views/fix/footer.jsp"%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=dege">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>productList</title>
</head>

<body>
<%@ include file="/WEB-INF/views/fix/header.jsp"%>

	<!-- Page Content -->
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<h2 id="orderpagetitle" class="disply-2 text-center py-4">상의</h2>

				<div class="list-group">
					<button onclick="location.href='#'" type="button"
						class="btn btn-outline-primary">상의</button>
					<button onclick="location.href='#'" type="button"
						class="btn btn-outline-primary">하의</button>
					<button onclick="location.href='#'" type="button"
						class="btn btn-outline-primary">신발</button>
					<!--<a href="#" class="list-group-item">신발</a>-->
				</div>
			</div>
			<!-- <h2 id="orderpagetitle" class="disply-2 text-center py-4">상의</h2>  -->
			<!-- /.col-lg-3 -->

			<style>
/* 캐러셀(이미지슬라이드) 이미지 크기변경 */
.carousel-inner {
	width: 100%;
	height: 200px; /* 이미지 높이 변경 */
}

.carousel-item {
	width: 100%;
	height: 200px;
}

.d-block {
	display: block;
	width: 100%;
	height: 200px;
	padding: 20px;
}
</style>

			<div class="col-lg-9">
				<div id="carouselExampleFade" class="carousel slide carousel-fade"
					data-bs-ride="carousel">
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="${contextPath}/resources/fix/img/banner1.jpg"
								class="d-block w-100" alt="...">
							<div class="carousel-caption d-none d-md-block">
								<h6>겨울 필수 액세서리 셀렉션</h6>
							</div>
						</div>
						<div class="carousel-item">
							<img src="${contextPath}/resources/fix/img/banner2.jpg"
								class="d-block w-100" alt="...">
							<div class="carousel-caption d-none d-md-block">
								<h6>런업이 추천하는 브랜드관 컬렉션</h6>
							</div>
						</div>
						<div class="carousel-item">
							<img src="${contextPath}/resources/fix/img/banner3.jpg"
								class="d-block w-100" alt="...">
							<div class="carousel-caption d-none d-md-block">
								<h6>Tag Your Style</h6>
							</div>
						</div>

						<button class="carousel-control-prev" type="button"
							data-bs-target="#carouselExampleFade" data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next" type="button"
							data-bs-target="#carouselExampleFade" data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Next</span>
						</button>
					</div>
					<!-- 검색 시작 -->
					<div>
						<form class="d-flex row py-3"
							action="${contextPath}/admin/seller_request/" method="get">
							<div class="col mt-1">
								<select id="inputState" class="form-select form-select-md"
									name="option">
									<option selected>전체</option>
									<!--<option value="B" ${pr.sc.option=='I' || pr.sc.option=='' ? "selected" : ""}>판매자명</option>-->
									<option value="N" ${pr.sc.option=='N'? "selected" : ""}>상품명</option>
									<option value="A" ${pr.sc.option=='A'? "selected" : ""}>판매자명</option>
								</select>
							</div>
							<div class="d-flex col-md-9 mt-1">
								<input class="form-control form-control me-1" type="text"
									placeholder="Search" style="float: right;" name="keyword"
									value="${param.keywork}">
								<button class="btn btn-secondary" type="submit">
									<i class="d-flex fa fa-search"></i>
								</button>
							</div>
						</form>
					</div>
					<!-- 검색 끝 -->

					<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
						href="#" role="button" aria-haspopup="true" aria-expanded="false"
						style="text-align: right;">상품정렬방식</a>
					<div class="dropdown-menu dropdown-menu-end dropdown-menu-xs-start"
						style="">
						<a class="dropdown-item" href="#">최신 상품순</a> <a
							class="dropdown-item" href="#">인기 상품순</a>
					</div>


					<!-- <div class="btn-group" role="group" aria-label="Button group with nested dropdown">
           <button type="button" class="btn btn-primary">상품정렬</button>
           <div class="btn-group" role="group">
             <button id="btnGroupDrop1" type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>
             <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
               <a class="dropdown-item" href="#">최신 상품순</a>
               <a class="dropdown-item" href="#">인기 상품순</a>
             </div>
           </div>
         </div>-->


					<div class="row">
						<div class="col-lg-4 col-md-6 mb-4">
							<div class="card h-100">
								<a href="#"><img class="card-img-top"
									src="${contextPath}/resources/img/product/1.png" alt="" /></a>
								<div class="card-body">
									<h4 class="card-title">
										<a href="#">Nike</a>
									</h4>
									<h5>762,000 원</h5>
									<p class="card-text">Nike x Peaceminusone Air Force 1 Low
										Para-Noise 2.0</p>
								</div>
								<div class="card-footer">
									<small class="text-muted">&#9733; &#9733; &#9733;
										&#9733; &#9734;</small>
								</div>
							</div>
						</div>

						<div class="col-lg-4 col-md-6 mb-4">
							<div class="card h-100">
								<a href="#"><img class="card-img-top"
									src="${contextPath}/resources/img/product/2.png" alt=""></a>
								<div class="card-body">
									<h4 class="card-title">
										<a href="#">Nike</a>
									</h4>
									<h5>139,000 원</h5>
									<p class="card-text">Nike Dunk Low Retro Black</p>
								</div>
								<div class="card-footer">
									<small class="text-muted">&#9733; &#9733; &#9733;
										&#9733; &#9734;</small>
								</div>
							</div>
						</div>

						<div class="col-lg-4 col-md-6 mb-4">
							<div class="card h-100">
								<a href="#"><img class="card-img-top"
									src="${contextPath}/resources/img/product/3.png" alt=""></a>
								<div class="card-body">
									<h4 class="card-title">
										<a href="#">Nike</a>
									</h4>
									<h5>148,000 원</h5>
									<p class="card-text">(W) Nike Dunk Low Black</p>
								</div>
								<div class="card-footer">
									<small class="text-muted">&#9733; &#9733; &#9733;
										&#9733; &#9734;</small>
								</div>
							</div>
						</div>

						<div class="col-lg-4 col-md-6 mb-4">
							<div class="card h-100">
								<a href="#"><img class="card-img-top"
									src="${contextPath}/resources/img/product/nike.jpg" alt=""></a>
								<div class="card-body">
									<h4 class="card-title">
										<a href="#">Nike</a>
									</h4>
									<h5>280,000 원</h5>
									<p class="card-text">Nike x HUF SB Dunk Low San Francisco</p>
								</div>
								<div class="card-footer">
									<small class="text-muted">&#9733; &#9733; &#9733;
										&#9733; &#9734;</small>
								</div>
							</div>
						</div>

						<div class="col-lg-4 col-md-6 mb-4">
							<div class="card h-100">
								<a href="#"><img class="card-img-top"
									src="${contextPath}/resources/img/product/Jordan_1.png" alt=""></a>
								<div class="card-body">
									<h4 class="card-title">
										<a href="#">Jordan</a>
									</h4>
									<h5>270,000 원</h5>
									<p class="card-text">(GS) Jordan 1 Retro High OG Chicago
										2022</p>
								</div>
								<div class="card-footer">
									<small class="text-muted">&#9733; &#9733; &#9733;
										&#9733; &#9734;</small>
								</div>
							</div>
						</div>

						<div class="col-lg-4 col-md-6 mb-4">
							<div class="card h-100">
								<a href="#"><img class="card-img-top"
									src="${contextPath}/resources/img/product/converse.png" alt=""></a>
								<div class="card-body">
									<h4 class="card-title">
										<a href="#">Converse</a>
									</h4>
									<h5>63,000 원</h5>
									<p class="card-text">Converse Chuck 70 Hi Black</p>
								</div>
								<div class="card-footer">
									<small class="text-muted">&#9733; &#9733; &#9733;
										&#9733; &#9734;</small>
								</div>
							</div>
						</div>

					</div>
				</div>
				<!-- /.row -->
			</div>
			<!-- /.col-lg-9 -->
		</div>
		<!-- /.row -->



	</div>

	<!-- 페이지 시작 -->
	<ul class="pagination" style="justify-content: center;">
		<c:if test="${totalCnt == null || totalCnt == 0}">
			<div></div>
		</c:if>
		<c:if test="${totalCnt != null || totalCnt != 0}">
			<c:if test="${pr.showPrev}">
				<li class="page-item disabled"><a class="page-link"
					href="${contextPath}/seller/prdtList${pr.sc.getQueryString(pr.beginPage-1)}">&laquo;</a></li>
			</c:if>

			<c:forEach var="i" begin="${pr.beginPage}" end="${pr.endPage}">
				<c:if test="${pr.sc.page == i }">
					<c:if test="${pr.sc.page > 0 }">
						<li class="page-item active"><a class="page-link"
							href="${contextPath}/seller/prdtList${pr.sc.getQueryString(i)}">${i}</a></li>
					</c:if>
				</c:if>
				<c:if test="${pr.sc.page != i }">
					<c:if test="${pr.sc.page > 0 }">
						<li class="page-item"><a class="page-link"
							href="${contextPath}/seller/prdtList${pr.sc.getQueryString(i)}">${i}</a></li>
					</c:if>
				</c:if>
			</c:forEach>
			<c:if test="${pr.showNext}">
				<li class="page-item"><a class="page-link"
					href="${contextPath}/seller/prdtList${pr.sc.getQueryString(pr.endPage+1)}">&raquo;</a></li>
			</c:if>
		</c:if>
	</ul>
	<!-- 페이지 끝  -->

	<%@ include file="/WEB-INF/views/fix/footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"
		integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"
		integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha"
		crossorigin="anonymous">
   </script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/resources/seller/js/dashboard.js"></script>
</body>
</html>
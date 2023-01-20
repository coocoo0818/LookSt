<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=dege">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>productList</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js" ></script>	
<!-- <script type="text/javascript">
	
	function setCookie(name, value, expiredays) {
		var todayDate = new Date();
		todayDate.setDate(todayDate.getDate() + expiredays);
		console.log(todayDate)
		document.cookie = name + "=" + value + "; path=/; expires=" + todayDate.toGMTString() + ";";
	}
	
	function getCookie() {
			var cookiedata = document.cookie;
			
			document.cookie = "prdtNo=1"
	}
	$(function() {
		getcookie();
		
		$('#cartbtn').click(function(){
			setCookie("prdtNo","1",1);
		});
	});
	
</script> -->
</head>

<body>
<%@ include file="/WEB-INF/views/fix/header.jsp"%>
<style> @import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap'); </style>
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
	padding: 20px 0 20px 0;
}
h4 {
	font-family: '도현', 산세리프;
}

</style>


	<!-- Page Content -->
	<div class="container">
		<h2 class="col-auto my-5" style="text-align:center;">SHOP</h2>
		<div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="${contextPath}/resources/fix/img/banner1.jpg" class="d-block w-100" alt="...">
					<div class="carousel-caption d-none d-md-block">
						<h6>겨울 필수 액세서리 셀렉션</h6>
					</div>
				</div>
				<div class="carousel-item">
					<img src="${contextPath}/resources/fix/img/banner2.jpg"class="d-block w-100" alt="...">
					<div class="carousel-caption d-none d-md-block">
						<h6>런업이 추천하는 브랜드관 컬렉션</h6>
					</div>
				</div>
				<div class="carousel-item">
					<img src="${contextPath}/resources/fix/img/banner3.jpg"class="d-block w-100" alt="...">
					<div class="carousel-caption d-none d-md-block">
						<h6>Tag Your Style</h6>
					</div>
				</div>
				<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-3">
				<h2 id="orderpagetitle" class="disply-2 text-center py-4">
					<c:choose>
						<c:when test="${param.kind=='T' }">TOP</c:when>
						<c:when test="${param.kind=='B' }">PANTS</c:when>
						<c:when test="${param.kind=='S' }">SHOES</c:when>
						<c:when test="${param.kind=='G'}">BAG</c:when>
						<c:otherwise>ACC</c:otherwise>
					</c:choose>
				</h2>
				
				<div class="d-grid gap-2 col-6 mx-auto">  <!-- 클릭시(onclick) GET 매핑방식으로 해당 url을 요청을 하게됨 -->
				  <button class="btn btn-light border border-2" onclick="location.href='<c:url value="/post/productList?kind=T"/>'">TOP</button>
				  <button id="pantsBtn" class="btn btn-light border border-2" onclick="location.href='<c:url value="/post/productList?kind=B"/>'">PANTS </button>
				  <button class="btn btn-light border border-2" onclick="location.href='<c:url value="/post/productList?kind=S"/>'">SHOES</button>
				  <button class="btn btn-light border border-2" onclick="location.href='<c:url value="/post/productList?kind=G"/>'">BAG</button>
				  <button class="btn btn-light border border-2" onclick="location.href='<c:url value="/post/productList?kind=A"/>'">ACC</button>
				</div>	<!-- 카테고리별로 상의T, 하의P, 신발S, 가방B, 악세사리A로 부여 -->
			
				
				<div id="carouselExampleControls" class="carousel slide d-grid gap-2 col-6 mx-auto" data-bs-ride="carousel">
				  <div class="carousel-inner">
				    <div class="carousel-item active">
				      <img src="${contextPath}/resources/img/product/float_banner01.jpg" class="d-block w-100" alt="...">
				    </div>
				    <div class="carousel-item">
				      <img src="${contextPath}/resources/img/product/float_banner02.jpg" class="d-block w-100" alt="...">
				    </div>
				  </div>
				  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Previous</span>
				  </button>
				  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Next</span>
				  </button>
				</div>
			</div>
		

			<div class="col-lg-9">
				<!-- 검색 시작 -->
				<form class="d-flex row py-3" action="${contextPath}/post/productList" method="get">
					<div class="d-flex justify-content-between">
						<div class="col mt-1 me-3">
							<select id="inputState" class="form-select form-select-md" name="option">
								<option selected>전체</option>
								<!--<option value="B" ${pr.sc.option=='I' || pr.sc.option=='' ? "selected" : ""}>판매자명</option>-->
								<option value="T" ${pr.sc.option=='T'? "selected" : ""}>전체</option>
								<option value="N" ${pr.sc.option=='N'? "selected" : ""}>상품명</option>
							</select>
						</div>
						<div class="d-flex col-md-9 mt-1">
							<input type="hidden" name="kind" value="${param.kind }"/>
							<input class="form-control form-control me-1" type="text"
								placeholder="Search" style="float: right;" name="keyword"
								value="${param.keyword}">
							<button class="btn btn-secondary" type="submit">
								<i class="d-flex fa fa-search"></i>
							</button>
						</div>
					</div>
					<!-- 검색 끝 -->
					<div class="mt-1 d-flex justify-content-end">
						<div>
							<select class="form-select form-select-md col-3" name="sort">
								<option value="R" ${pr.sc.sort=='R'? "selected" : ""}>최신 상품순</option>
								<option value="U" ${pr.sc.sort=='U'? "selected" : ""}>낮은 가격순</option>
								<option value="D" ${pr.sc.sort=='D'? "selected" : ""}>높은 가격순</option>
							</select>
						</div>
						<div class="mt-1" >
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							<button class="btn btn-secondary" type="submit">
								<i class="d-flex fa fa-search"></i>
							</button>
						</div>
					</div>
				</form>
				<div class="row">
				<%-- <form action ="${contextPath}/post/shoppingBag" method="get" id="product_form"> --%>
					<c:forEach var="shopTotalList" items="${shopTotalList}"> <!-- m에 담겨있는 아이템 리스트의 개수(6)만큼 반복 -->
						<div class="col-lg-4 col-md-6 mb-4">
								<div class="card h-100">
									<a href="${contextPath}/admin/productDetail/?product_no=${shopTotalList.product_no}">
										<img class="card-img-top" src="${contextPath}/resources/img/product/${shopTotalList.prdt_Img.prdt_img_name}" alt="" /></a>
										<div class="card-body">
											<h4 class="card-title">
												<a href="${contextPath}/admin/productDetail/?product_no=${shopTotalList.product_no}" style="text-decoration:none;">${shopTotalList.product_name}</a>
											</h4>
											<h5><fmt:formatNumber value="${shopTotalList.product_price}" pattern="#,###" />원</h5>
											<p class="card-text">${shopTotalList.product_info}</p>
											<input type="hidden" value="${shopTotalList.product_no}" />
											<button type="button" id = cartbtn class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal" name="prdtcart" style="float:left; bottom:0;" onclick="gotoShoppingBag(this)">ADD CART</button>
										</div>
									<!-- </form> -->
	<!-- 								<div class="card-footer">
										<small class="text-muted">&#9733; &#9733; &#9733;
											&#9733; &#9734;</small>
									</div> -->
								</div>
							
						</div>
					</c:forEach>
				<!-- </form>	 -->		
				</div>
				
				<!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h1 class="modal-title fs-5" id="exampleModalLabel">장바구니 담기</h1>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body text-center">
				        상품이 장바구니에 담겼습니다.</br></br>장바구니에서 상품을 확인하시겠습니까?
				      </div>
				      <div class="modal-footer">
				      	<button type="button" class="btn btn-primary" onclick="location.href='${contextPath}/post/shoppingBag';">장바구니로 이동</button>
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
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
				<li class="page-item"><a class="page-link" href="${contextPath}/post/productList${pr.sc.getQueryString(pr.beginPage-1)}">&laquo;</a></li>
			</c:if>

			<c:forEach var="i" begin="${pr.beginPage}" end="${pr.endPage}">
				<c:if test="${pr.sc.page == i }">
					<c:if test="${pr.sc.page > 0 }">
						<li class="page-item active"><a class="page-link"
							href="${contextPath}/post/productList${pr.sc.getQueryString(i)}">${i}</a></li>
					</c:if>
				</c:if>
				<c:if test="${pr.sc.page != i }">
					<c:if test="${pr.sc.page > 0 }">
						<li class="page-item"><a class="page-link"
							href="${contextPath}/post/productList${pr.sc.getQueryString(i)}">${i}</a></li>
					</c:if>
				</c:if>
			</c:forEach>
			<c:if test="${pr.showNext}">
				<li class="page-item"><a class="page-link"
					href="${contextPath}/post/productList${pr.sc.getQueryString(pr.endPage+1)}">&raquo;</a></li>
			</c:if>
		</c:if>
	</ul>
	<!-- 페이지 끝  -->

	<%@ include file="/WEB-INF/views/fix/footer.jsp"%>
	<script type="text/javascript">
		window.onload = function() {
		  var ctx = document.getElementById("myChart");
		  var lineChart = new Chart(ctx, {
		    type: 'line',
		    data: {
		      labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
		      datasets: [{
		        label: "2015",
		        data: [10, 8, 6, 5, 12, 8, 16, 17, 6, 7, 6, 10]
		      }]
		    }
		  })
		}
		
		
		
		function gotoShoppingBag(element) {
			let product_no = element.previousElementSibling.value
			/* let form = $('#product_form') */
			/* var form = document.createElement("form");
			
			form.setAttribute('action',);
			form.setAttribute('method','post')
			
			
			var hiddenField = document.createElement("input");

	         hiddenField.setAttribute("type", "hidden");
	         hiddenField.setAttribute("name", "product_no");
	         hiddenField.setAttribute("value", product_no);
	
	         form.appendChild(hiddenField);
	         document.body.appendChild(form);
	         
	         var token = document.createElement("input");

	         token.setAttribute("type", "hidden");
	         token.setAttribute("name", "${_csrf.parameterName}");
	         token.setAttribute("value", "${_csrf.token}"); 
	
	         form.appendChild(token);
	         document.body.appendChild(form); 
	         
			form.submit();*/
			let cookie = getCookie('id')
			setCookie('id', cookie +'/'+product_no, '3');
			alert(getCookie('id'));
			
			
		}
		function setCookie(cookieName, value, exdays){
    		let exdate = new Date();
    		exdate.setDate(exdate.getDate()+exdays);
    		let cookieValue = escape(value) + ((exdays==null)?"":"; expires="+exdate.toGMTString());
    		document.cookie = cookieName + "=" + cookieValue;
    	}
    	function deleteCookie(cookieName){
    		let expireDate = new Date;
    		expireDate.setDate(expireDate.getDate() - 1);
    		document.cookie = cookieName + "=" + "; expires="+ expireDate.toGMTString();
    	}
    	function getCookie(name){
    	    var nameOfCookie = name + "=";
    	    var x = 0;
    	    while (x <= document.cookie.length){
    	    	var y = (x + nameOfCookie.length);
    	        if (document.cookie.substring(x, y) == nameOfCookie) {
    	        	if ((endOfCookie = document.cookie.indexOf(";", y)) == -1) {
    	            	endOfCookie = document.cookie.length;
    	            }
    	        	return unescape (document.cookie.substring(y, endOfCookie));
    	    	}
    	        x = document.cookie.indexOf (" ", x) + 1; if (x == 0) break;
    	    }
    	    return "";
    	}
		</script>
 	<script
		src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"
		integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE"
		crossorigin="anonymous"></script>
<!-- 	<script 
		src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"
		integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha"
		crossorigin="anonymous">
    </script> -->
 	<script type="text/javascript"
		src="${pageContext.request.contextPath }/resources/seller/js/dashboard.js"></script>
</body>
</html>
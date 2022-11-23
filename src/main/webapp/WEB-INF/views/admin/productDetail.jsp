<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<title>member management</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/admin/css/productDetail.css">
</head>
<body>
	<%@ include file="/WEB-INF/views/fix/header.jsp"%>
	<!-- partial:index.partial.html -->
		<div class="container">
	<section class="productCard">
		<div class="container">
			<div class="info">
				<h3 class="name">${productInfo.product_kind}</h3>
				<h1 class="slogan">${productInfo.product_name}</h1>
				<p class="price">${productInfo.product_price}원</p>
				<div class="attribs">
					<div class="attrib size">
						<p class="header">Select Size</p>
						<div class="options">
							<c:forEach var="productSize" items="${productSize}">
								<div class="option">${productSize.prdt_option_size}</div>
							</c:forEach>
						</div>
					</div>
					<div class="attrib color">
						<p class="header">Select Color</p>
						<div class="options">
							<div class="option" style="color: #60aec1;"></div>
							<div class="option" style="color: #ef525e;"></div>
							<div class="option" style="color: #000000;" disabled></div>
						</div>
					</div>
				</div>
				<div class="buttons">
					<div class="button">Add to cart</div>
					<div class="button colored">Buy now</div>
				</div>
			</div>
			<div class="colorLayer"></div>
			<div class="preview">
				<h1 class="brand">EZEN</h1>
				<div class="imgs">
					<c:forEach var="productImg"  items="${productImg}" varStatus="status">	
						<img class="<c:if test='${status.index == 1}'>activ</c:if>" src="${contextPath}/resources/img/product/${productImg.prdt_img_name}" alt="img ${status.index + 1}"> 
					</c:forEach>
					
					<!-- <img src="https://firebasestorage.googleapis.com/v0/b/fotos-3cba1.appspot.com/o/tenis%2Ffila%2Ft3.png?alt=media&token=b2352ce3-be90-411d-b112-cfc6453760a0" alt="img 2"> 
					<img src="https://firebasestorage.googleapis.com/v0/b/fotos-3cba1.appspot.com/o/tenis%2Ffila%2Ft1.png?alt=media&token=9b161cad-8068-418e-a0d3-ee2e0975e6f4" alt="img 3"> -->
				</div>
				<div class="zoomControl"></div>
				<div class="closePreview"></div>
				<div class="movControls">
					<div class="movControl left"></div>
					<div class="movControl right"></div>
				</div>
			</div>
		</div>
	</section>
	</div>
	<!-- partial -->
	<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js'></script>
	<script type="text/javascript" src="${contextPath}/resources/admin/js/productDetail.js"></script>
	<%@ include file="/WEB-INF/views/fix/footer.jsp"%>
</body>
</html>
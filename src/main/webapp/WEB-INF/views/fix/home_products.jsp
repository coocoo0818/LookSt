<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>home products</title>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.productDetail').on('click', function() {
			let product_no = $(this).children().children().attr("data-productNo")
			location.href = '${contextPath}/admin/productDetail/?product_no='+product_no;
		});
	});
</script>
</head>
<body>
	<div class="style_title">
		<h3>New Product Picks!</h3>
	</div>
	
	<%-- ${new_prdt.prdt_img_name} --%>
	<!-- 신상 시작 -->
	<div class="container products">
		<div class="row row-cols-1 row-cols-md-4 g-4">
			<c:forEach var="new_prdt" items="${new_prdt}">
				<a href="javascript:productDetail();" class="text-decoration-none productDetail">
					<div class="col">
						<div class="card border-0" data-productNo="${new_prdt.product_no}">
							<img src="${new_prdt.prdt_img_name}" class="card-img-top rounded" alt="...">
							<div class="card-body">
								<h5 class="card-title text-decoration-underline">${new_prdt.product_name}</h5>
								<p class="card-text">${new_prdt.product_info}</p>
								<p class="fw-bold"><fmt:formatNumber value="${new_prdt.product_price}" pattern="#,###" />원</p>
								<h6 class="text-muted">즉시 구매가</h6>
							</div>
						</div>
					</div>
				</a> 
			</c:forEach>
		</div>
	</div>
	<!-- 신상 끝 -->
	
</body>
</html>
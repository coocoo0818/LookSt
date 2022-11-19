<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=dege">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>PRODUCT LIST</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"
	type="text/javascript"></script>
<meta name="viewport" content="width=device-width">
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css"> -->
<link
	href="${pageContext.request.contextPath }/resources/seller/css/list.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>

<style type="text/css">
#orderpagetitle {
	margin-top: 30px;
	margin-bottom: 30px;
	padding: 3px;
}

.pagination {
	justify-content: center;
}

.card-img-top {
	max-height: 100px;
	max-width: 100px;
}
</style>





</head>
<body>
	<%@ include file="/WEB-INF/views/fix/sellerheader.jsp"%>


	<h2 id="orderpagetitle" class="disply-2 text-center py-4">PRODUCT
		LIST</h2>

	<div class="container">
	
		<form class="d-flex row py-3"
			action="<c:url value="/seller/prdtList" />" class="search-form"
			method="get">
			<div class="col mt-1">
				<select id="inputState" class="form-select form-select-md" name="option">
					<option value="A" ${pr.sc.option=='' ? "selected" : ""}>전체</option>
					<option value="C" ${pr.sc.option=='C' ? "selected" : ""}>카테고리</option>
					<option value="M" ${pr.sc.option=='M' ? "selected" : ""}>상품이름</option>
					<option value="P" ${pr.sc.option=='P' ? "selected" : ""}>상품번호</option>		
				</select>
			</div>
			<div class="d-flex col-md-9 mt-1">
				<input class="form-control form-control me-1" type="text"
					name="keyword" value="${param.keyword}" placeholder="Search"
					style="float: right;">
				<button class="btn btn-secondary" type="submit">
					<i class="d-flex fa fa-search"></i>
				</button>
			</div>
		</form>
	</div>



	<!-- partial:index.partial.html -->
	<div class="container py-1">
		<table class="responsive-table">

			<thead>
				<tr>

					<th scope="col">상품번호</th>
					<th scope="col">상품이미지</th>
					<th scope="col">카테고리</th>
					<th scope="col">상품명</th>
					<th scope="col">판매가</th>
					<th scope="col">재고</th>
					<th scope="col"></th>
				</tr>
			</thead>
			<tfoot>

			</tfoot>
			<tbody>
				<c:forEach var="prdtListDto" items="${prdtlist }">
					<tr>
						<th scope="row" data-title="prdtnum">${prdtListDto.product_no }</th>
						<td data-title="PrdtImg"><img class="card-img-top"
							src="${pageContext.request.contextPath }/resources/seller/img/${prdtListDto.prdt_img_name}"
							alt="..." /></td>
						<td data-title="PrdtCate">${prdtListDto.product_kind }</td>
						<td data-title="PrdtInfo">${prdtListDto.product_name }</td>
						<td data-title="PrdtPrice" data-type="currency">${prdtListDto.product_price }</td>
						<td data-title="PtdtStock" data-type="currency"><input
							type="number" class="ptdtStock" min="0" max="100"
							value="${prdtListDto.prdt_option_stock }"></td>
						<td data-title="Detail" data-type="currency"><button
								type="button" class="btn btn-dark btn-sm">삭제</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- partial -->

	<div class="container">
		<div class="row">
			<div>
				<button type="button" class="btn btn-outline-dark"
					style="float: left;">수정</button>
				<button type="button" class="btn btn-outline-dark ms-1">저장</button>
				<a role="button" class="btn btn-outline-danger ms-1"
					href="<c:url value="/seller/registerPrdt"/>" style="float: right">상품
					등록</a>
			</div>
		</div>
	</div>

	<div class="row my-5"></div>

	<!-- 페이지 시작 -->
		<ul class="pagination" style="justify-content: center;">
			<c:if test="${totalCnt == null || totalCnt == 0}">
				<div>게시물이 없습니다.</div>
			</c:if>
			<c:if test="${totalCnt != null || totalCnt != 0}">
				<c:if test="${pr.showPrev}">
					<li class="page-item disabled"><a class="page-link" href="${contextPath}/seller/prdtList${pr.sc.getQueryString(pr.beginPage-1)}">&laquo;</a></li>
				</c:if>
				
				<c:forEach var="i" begin="${pr.beginPage}" end="${pr.endPage}">

					<c:if test="${pr.sc.page == i }">
						<c:if test="${pr.sc.page > 0 }">
							<li class="page-item active"><a class="page-link" href="${contextPath}/seller/prdtList${pr.sc.getQueryString(i)}">${i}</a></li>
						</c:if>
					</c:if>
					<c:if test="${pr.sc.page != i }">
						<c:if test="${pr.sc.page > 0 }">
							<li class="page-item"><a class="page-link" href="${contextPath}/seller/prdtList${pr.sc.getQueryString(i)}">${i}</a></li>
						</c:if>
					</c:if>
				</c:forEach>
				
				<c:if test="${pr.showNext}">
					<li class="page-item"><a class="page-link" href="${contextPath}/seller/prdtList${pr.sc.getQueryString(pr.endPage+1)}">&raquo;</a></li>
				</c:if>
				
			</c:if>
		</ul>
		<!-- 페이지 끝  -->





	<%@ include file="/WEB-INF/views/fix/footer.jsp"%>
</body>
</html>
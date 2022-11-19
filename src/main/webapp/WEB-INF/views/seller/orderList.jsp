
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=dege">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<title>ORDER LIST</title>
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
<script type="text/javascript">
	$(document).ready(function() {

		$('.myModal').click(function() {
			let prdt_order_no = $(this).attr("data-prdt_order_no") // <li>태그는 <button>의 부모임.
			$.ajax({
				type : 'post',
				url : '${contextPath}/seller/selectOrderinfo',
				data : {
					prdt_order_no : prdt_order_no
				},
				success : function(data) {
					$('#modal_con').load(location.href + '#modal_con');

				},
				error : function() {
					alert("error")
				} //에러가 발생했을 때 호출될 함수
			})
		})
	})
</script>



<style type="text/css">
#orderpagetitle {
	margin-top: 30px;
	margin-bottom: 30px;
	padding: 3px;
}

.pagination {
	justify-content: center;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/fix/sellerheader.jsp"%>



	<h2 id="orderpagetitle" class="disply-2 text-center py-4">ORDER
		LIST</h2>

	<div class="container">
	
		<form class="d-flex row py-3"
			action="<c:url value="/seller/orderList" />" class="search-form"
			method="get">
			<div class="col mt-1">
				<select id="inputState" class="form-select form-select-md" name="option">
					<option value="A" ${pr.sc.option=='' ? "selected" : ""}>전체</option>
					<option value="C" ${pr.sc.option=='C' ? "selected" : ""}>구매자</option>
					<option value="N" ${pr.sc.option=='N' ? "selected" : ""}>주문번호</option>
					<option value="P" ${pr.sc.option=='P' ? "selected" : ""}>상품이름</option>		
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
					<th scope="col">주문번호</th>
					<th scope="col">구매자</th>
					<th scope="col">상품정보</th>
					<th scope="col">결제금액</th>
					<th scope="col">주문일자</th>
					<th scope="col">주문상태</th>
					<th scope="col">상세</th>
				</tr>
			</thead>
			<tfoot>

			</tfoot>
			<tbody>
				<c:forEach var="orderListDto" items="${orderlist }">
					<tr>
						<th scope="row" data-title="OrderNum">${orderListDto.prdt_order_no }</th>
						<td data-title="Buyer">${orderListDto.member_name }</td>
						<td data-title="PrdtInfo">${orderListDto.product_name }[${orderListDto.product_no }]</td>
						<td data-title="TotalPay" data-type="currency">${orderListDto.payment }</td>
						<td data-title="PayDate" data-type="currency">${orderListDto.prdt_order_date }</td>
						<td data-title="OrderStaus" data-type="currency">${orderListDto.prdt_order_type }</td>
						<td data-title="Detail" data-type="currency"><button
								type="button" class="btn btn-outline-dark btn-sm myModal"
								id="myModal" data-bs-toggle="modal"
								data-bs-target="#staticBackdrop"
								data-prdt_order_no="${orderListDto.prdt_order_no }">VIEW</button></td>
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
					<li class="page-item disabled"><a class="page-link" href="${contextPath}/seller/orderList${pr.sc.getQueryString(pr.beginPage-1)}">&laquo;</a></li>
				</c:if>
				
				<c:forEach var="i" begin="${pr.beginPage}" end="${pr.endPage}">

					<c:if test="${pr.sc.page == i }">
						<c:if test="${pr.sc.page > 0 }">
							<li class="page-item active"><a class="page-link" href="${contextPath}/seller/orderList${pr.sc.getQueryString(i)}">${i}</a></li>
						</c:if>
					</c:if>
					<c:if test="${pr.sc.page != i }">
						<c:if test="${pr.sc.page > 0 }">
							<li class="page-item"><a class="page-link" href="${contextPath}/seller/orderList${pr.sc.getQueryString(i)}">${i}</a></li>
						</c:if>
					</c:if>
				</c:forEach>
				
				<c:if test="${pr.showNext}">
					<li class="page-item"><a class="page-link" href="${contextPath}/seller/orderList${pr.sc.getQueryString(pr.endPage+1)}">&raquo;</a></li>
				</c:if>
				
			</c:if>
		</ul>
		<!-- 페이지 끝  -->
		













<!-- 	<!-- pagination --> -->
<!-- 	<div class="pagination" style="justify-content: center;"> -->
<!-- 		<div class="paging"> -->
<%-- 			<c:if test="${totalCnt == null || totalCnt == 0 }"> --%>
<!-- 				<div>게시물이 없습니다.</div> -->
<%-- 			</c:if> --%>
<%-- 			<c:if test="${totalCnt != null || totalCnt != 0 }"> --%>
<%-- 				<c:if test="${pr.showPrev }"> --%>
<!-- 					<a class="page" -->
<%-- 						href="<c:url value="/seller/orderList${pr.sc.getQueryString(pr.beginPage-1) }" />"> --%>
<!-- 						&lt; </a> -->
<%-- 				</c:if> --%>
<%-- 				<c:forEach var="i" begin="${pr.beginPage }" end="${pr.endPage }"> --%>
<!-- 					<a class="page" -->
<%-- 						href="<c:url value="/seller/orderList${pr.sc.getQueryString(i)}" />">${i }</a> --%>
<%-- 				</c:forEach> --%>
<%-- 				<c:if test="${pr.showNext }"> --%>
<!-- 					<a class="page" -->
<%-- 						href="<c:url value="/seller/orderList${pr.sc.getQueryString(pr.endPage+1) }" />"> --%>
<!-- 						&gt; </a> -->
<%-- 				</c:if> --%>
<%-- 			</c:if> --%>
<!-- 		</div> -->
<!-- 	</div> -->
	<!-- Modal -->

	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true"
		id="modal_con">
		<div
			class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
			role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="staticBackdropLabel">Detail
						Information</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="detail-info">
						<ul>
							<br />
							<li><span id="Context">주문번호${dto.prdt_order_no }
									${Payment}${od }</span></li>
						</ul>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<script
		src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<%@ include file="/WEB-INF/views/fix/footer.jsp"%>
</body>
</html>
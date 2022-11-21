<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=dege">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>REFUND LIST</title>
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
</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/fix/sellerheader.jsp"%>


	<h2 id="orderpagetitle" class="disply-2 text-center py-4">REFUND
		LIST</h2>

	<div class="container">
	
		<form class="d-flex row py-3"
			action="<c:url value="/seller/refundList" />" class="search-form"
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
					<th scope="col">주문상태</th>
					<th scope="col">주문일자</th>
					<th scope="col">요청상태</th>
					<th scope="col">상세</th>
				</tr>
			</thead>
			<tfoot>

			</tfoot>
			<tbody>
				<c:forEach var="refundListDto" items="${refundlist }">
					<tr>
						<th scope="row" data-title="Ordernum">${refundListDto.prdt_order_no }</th>
						<td data-title="Buyer">${refundListDto.member_name }</td>
						<td data-title="PrdtInfo">${refundListDto.product_name }[${refundListDto.product_no }]</td>
						<td data-title="TotalPay" data-type="currency">${refundListDto.payment }</td>
						<td data-title="OrderStaus" data-type="currency">
						<c:if test="${refundListDto.prdt_order_type eq 'W'}">결제대기</c:if>
						<c:if test="${refundListDto.prdt_order_type eq 'C'}">결제완료</c:if>
						<c:if test="${refundListDto.prdt_order_type eq 'P'}">배송준비중</c:if>
						<c:if test="${refundListDto.prdt_order_type eq 'S'}">배송중</c:if>
						<c:if test="${refundListDto.prdt_order_type eq 'Y'}">배송완료</c:if>
						<td data-title="PayDate" data-type="currency">${refundListDto.prdt_order_date }</td>
						<td data-title="ReqStaus" data-type="currency">
						<c:if test="${refundListDto.prdt_order_cancel eq 'D'}">취소접수</c:if>
						<c:if test="${refundListDto.prdt_order_cancel eq 'B'}">반품처리중</c:if>
						<c:if test="${refundListDto.prdt_order_cancel eq 'H'}">환불처리중</c:if>
						<c:if test="${refundListDto.prdt_order_cancel eq 'V'}">반품완료</c:if>
						<c:if test="${refundListDto.prdt_order_cancel eq 'R'}">환불완료</c:if>
						</td>
						<td data-title="Detail" data-type="currency"><button
								type="button" class="btn btn-outline-dark btn-sm"
								data-bs-toggle="modal" data-bs-target="#staticBackdrop">VIEW</button></td>
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
					<li class="page-item disabled"><a class="page-link" href="${contextPath}/seller/refundList${pr.sc.getQueryString(pr.beginPage-1)}">&laquo;</a></li>
				</c:if>
				
				<c:forEach var="i" begin="${pr.beginPage}" end="${pr.endPage}">

					<c:if test="${pr.sc.page == i }">
						<c:if test="${pr.sc.page > 0 }">
							<li class="page-item active"><a class="page-link" href="${contextPath}/seller/refundList${pr.sc.getQueryString(i)}">${i}</a></li>
						</c:if>
					</c:if>
					<c:if test="${pr.sc.page != i }">
						<c:if test="${pr.sc.page > 0 }">
							<li class="page-item"><a class="page-link" href="${contextPath}/seller/refundList${pr.sc.getQueryString(i)}">${i}</a></li>
						</c:if>
					</c:if>
				</c:forEach>
				
				<c:if test="${pr.showNext}">
					<li class="page-item"><a class="page-link" href="${contextPath}/seller/refundList${pr.sc.getQueryString(pr.endPage+1)}">&raquo;</a></li>
				</c:if>
				
			</c:if>
		</ul>
		<!-- 페이지 끝  -->
		


	<!-- Modal -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div
			class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="staticBackdropLabel">Detail
						Information</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="detail-info">
						<span>수령인 :</span> <span text="${order.name}">박이름</span><br /> <span>수령주소
							:</span>
						<!--수정필요-->
						<span text="${order.address}">서울시 00구 00동 00-00 00호</span><br />
						<span>전화번호 :</span>
						<!--수정필요-->
						<span text="${order.phonenumber}">010-1234-1234</span><br /> <span>주문번호
							:</span> <span text="${order.number}">178789</span><br /> <span>상품번호
							:</span> <span text="${product.itemIdx}">1659826</span><br /> <span>상품명
							:</span> <span text="${order.itemName}">예쁜 트렌치코트</span><br /> <span>상품가격
							:</span> <span text="${order.orderPrice}">34000원</span><br /> <span>구매수량
							:</span>
						<!--수정필요-->
						<span text="${order.number}">2</span><br /> <span>결제일시 :</span> <span
							text="${order.orderedAt}">2022-10-17</span><br /> <span>결제수단
							:</span>
						<!--수정필요-->
						<span text="${order.payment}">카드결제</span><br /> <span>환불금액
							:</span>
						<!--수정필요-->
						<span text="${order.orderPrice}">68000원</span><br /> <span>주문상태
							:</span>
						<!--수정필요-->
						<span text="${order.status}">결제완료</span><br /> <span>요청상태
							:</span>
						<!--수정필요-->
						<span text="${order.reqstatus}">취소접수</span><br />
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>


	<%@ include file="/WEB-INF/views/fix/footer.jsp"%>
</body>
</html>
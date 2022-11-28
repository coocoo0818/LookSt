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
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
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
<script type="text/javascript">

	$(document).ready(function() {
		let page = ${pr.sc.page}
		let pageSize = ${pr.sc.pageSize}
		
		
		$('.ReqOrderStatusMod').click(function() {
			let prdt_order_no = $(this).parent().attr("data-prdt_order_no")
			let index = $(this).parent().attr("data-index")
			let ReqOrderStatus = document.getElementById("ReqOrder_status"+index).value;
			
			$.ajax({
				type : 'post',
				url : '${contextPath}/seller/RstatusMod',
				data : {
						prdt_order_no : prdt_order_no,
						ReqOrderStatus : ReqOrderStatus
				},
				success : function(data) {
					alert("취소상태가 변경되었습니다.")
					location.reload()
				},
				error : function() {alert("error")}	
			})
		})
		
		
		
		
		$(".myModal").on('click', function(){
		
	        
			$('#prdt_order_no').text($(this).data("prdt_order_no")),
			$('#member_name').text($(this).data("member_name")),
			$('#product_name').text($(this).data("product_name")),
			$('#product_no').text($(this).data("product_no")),
			$('#payment').text($(this).data("payment")),
			$('#prdt_order_date').text($(this).data("prdt_order_date")),
			$('#prdt_order_type').text($(this).data("prdt_order_type")),
			$('#prdt_order_person').text($(this).data("prdt_order_person")),
			$('#prdt_order_addr').text($(this).data("prdt_order_addr")),
			$('#prdt_order_addr2').text($(this).data("prdt_order_addr2")),
			$('#prdt_order_phone').text($(this).data("prdt_order_phone")),
			$('#prdt_order_quan').text($(this).data("prdt_order_quan")),
			$('#product_price').text($(this).data("product_price")),
			$('#prdt_order_way').text($(this).data("prdt_order_way"))
			$('#prdt_order_cancel').text($(this).data("prdt_order_cancel"))
		});
		
		
		
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
				<c:forEach var="refundListDto" items="${refundlist }" varStatus="status">
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
						<td data-title="PayDate" data-type="currency"><fmt:formatDate value="${refundListDto.prdt_order_date }" pattern="yyyy-MM-dd" type="date" /></td>
						<td data-title="ReqStaus" data-type="currency" class="rStatus">
						<select class="form-select form-select-sm"
							aria-label=".form-select-sm example"
							id="ReqOrder_status${status.index}">
						<c:if test="${refundListDto.prdt_order_cancel eq 'D'}">
							<option value="D"
										${refundListDto.prdt_order_cancel=='D'? "selected" : ""}
										disabled="disabled" selected="selected">취소접수</option>
							<option value="B"
										${refundListDto.prdt_order_cancel=='B'? "selected" : ""}>반품처리중</option>
							<option value="H"
										${refundListDto.prdt_order_cancel=='H'? "selected" : ""}>환불처리중</option>
							<option value="V"
										${refundListDto.prdt_order_cancel=='V'? "selected" : ""}>반품완료</option>
							<option value="R"
										${refundListDto.prdt_order_cancel=='R'? "selected" : ""}>환불완료</option>
						</c:if>
						<c:if test="${refundListDto.prdt_order_cancel eq 'B'}">
							<option value="D"
										${refundListDto.prdt_order_cancel=='D'? "selected" : ""}>취소접수</option>
							<option value="B"
										${refundListDto.prdt_order_cancel=='B'? "selected" : ""}
										disabled="disabled" selected="selected">반품처리중</option>
							<option value="H"
										${refundListDto.prdt_order_cancel=='H'? "selected" : ""}>환불처리중</option>
							<option value="V"
										${refundListDto.prdt_order_cancel=='V'? "selected" : ""}>반품완료</option>
							<option value="R"
										${refundListDto.prdt_order_cancel=='R'? "selected" : ""}>환불완료</option>
						</c:if>
						<c:if test="${refundListDto.prdt_order_cancel eq 'H'}">
							<option value="D"
										${refundListDto.prdt_order_cancel=='D'? "selected" : ""}>취소접수</option>
							<option value="B"
										${refundListDto.prdt_order_cancel=='B'? "selected" : ""}>반품처리중</option>
							<option value="H"
										${refundListDto.prdt_order_cancel=='H'? "selected" : ""}
										disabled="disabled" selected="selected">환불처리중</option>
							<option value="V"
										${refundListDto.prdt_order_cancel=='V'? "selected" : ""}>반품완료</option>
							<option value="R"
										${refundListDto.prdt_order_cancel=='R'? "selected" : ""}>환불완료</option>
						</c:if>
						<c:if test="${refundListDto.prdt_order_cancel eq 'V'}">
							<option value="D"
										${refundListDto.prdt_order_cancel=='D'? "selected" : ""}>취소접수</option>
							<option value="B"
										${refundListDto.prdt_order_cancel=='B'? "selected" : ""}>반품처리중</option>
							<option value="H"
										${refundListDto.prdt_order_cancel=='H'? "selected" : ""}>환불처리중</option>
							<option value="V"
										${refundListDto.prdt_order_cancel=='V'? "selected" : ""}
										disabled="disabled" selected="selected">반품완료</option>
							<option value="R"
										${refundListDto.prdt_order_cancel=='R'? "selected" : ""}>환불완료</option>
						</c:if>
						<c:if test="${refundListDto.prdt_order_cancel eq 'R'}">
							<option value="D"
										${refundListDto.prdt_order_cancel=='D'? "selected" : ""}>취소접수</option>
							<option value="B"
										${refundListDto.prdt_order_cancel=='B'? "selected" : ""}>반품처리중</option>
							<option value="H"
										${refundListDto.prdt_order_cancel=='H'? "selected" : ""}>환불처리중</option>
							<option value="V"
										${refundListDto.prdt_order_cancel=='V'? "selected" : ""}>반품완료</option>
							<option value="R"
										${refundListDto.prdt_order_cancel=='R'? "selected" : ""}
										disabled="disabled" selected="selected">환불완료</option>
						</c:if>
						</select>
						</td>
						<td data-title="Detail" data-type="currency" data-prdt_order_no="${refundListDto.prdt_order_no }"
						data-index="${status.index}"><input tabindex="-1"
							role="button" type="button" value="변경"
							class="btn btn-outline-dark btn-sm ReqOrderStatusMod"
							id="ReqOrderStatusMod" />
						<button type="button" class="btn btn-outline-dark btn-sm myModal"
								id="myModal" data-bs-toggle="modal" 
								data-prdt_order_no="${refundListDto.prdt_order_no }"
								data-member_name = "${refundListDto.member_name }"
								data-product_name = "${refundListDto.product_name }"
								data-product_no = "${refundListDto.product_no }"
								data-payment = "${refundListDto.payment }"
								data-prdt_order_date = "${refundListDto.prdt_order_date }"
								data-prdt_order_type = "${refundListDto.prdt_order_type }"
								data-prdt_order_person = "${refundListDto.prdt_order_person }"
								data-prdt_order_addr = "${refundListDto.prdt_order_addr }"
								data-prdt_order_addr2 = "${refundListDto.prdt_order_addr2 }"
								data-prdt_order_phone = "${refundListDto.prdt_order_phone }"
								data-prdt_order_quan = "${refundListDto.prdt_order_quan }"
								data-product_price = "${refundListDto.product_price }"
								data-prdt_order_way = "${refundListDto.prdt_order_way }"
								data-prdt_order_cancel = "${refundListDto.prdt_order_cancel }"
								data-bs-target="#staticBackdrop">VIEW</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- partial -->




	<div class="container">
		<div class="row">
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
				<div class="modal-body fs-4" style="text-align:left;">
						  <span>주문번호 : </span><span id=prdt_order_no ></span><br/>
						  <span>주문자 : </span><span id=member_name></span><br/>
						  <span>상품명 : </span><span id=product_name></span><br/>
						  <span>상품번호 : </span><span id=product_no></span><br/>
						  <span>환불금액 : </span><span id=payment></span><span>원</span><br/>
						  <span>주문일자 : </span><span id=prdt_order_date></span><br/>
						  <span>주문상태 : </span><span id=prdt_order_type></span><br/>
						  <span>수령인 : </span><span id=prdt_order_person></span><br/>
						  <span>배송지 : </span><span id=prdt_order_addr></span>&nbsp;<span id=prdt_order_addr2></span><br/>
						  <span>전화번호 : </span><span id=prdt_order_phone></span><br/>
						  <span>주문수량 : </span><span id=prdt_order_quan></span><br/>
						  <span>상품가격 : </span><span id=product_price></span><span>원</span><br/>
						  <span>환불수단: </span><span id=prdt_order_way></span><br/>
						  <span>취소상태: </span><span id=prdt_order_cancel></span><br/>
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
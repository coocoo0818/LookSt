<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- jQuery -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.4.1.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- <script src="http://code.jquery.com/jquery-3.4.1.js"></script> -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>

<title>LOOKST</title>
<link rel="stylesheet"
	href="${contextPath}/resources/admin/css/orderFormpage.css">

</head>
<body>
	<%@ include file="/WEB-INF/views/fix/header.jsp"%>

	<script type="text/javascript">
	
	function cancel_Btn(element){
		let order_no = element.parentElement.previousElementSibling.previousElementSibling.previousElementSibling.previousElementSibling.firstElementChild.firstElementChild.innerHTML
		/* let a = $(element).parent().parent().children('#orderNotd').children().children().html() */ /*JQuery 상속*/
		$('#order_no').val(order_no)
		if (!confirm("정말로 취소하시겠습니까?"))
			return;
	
		let form = $("#form")
		
		form.attr("action", "<c:url value='/post/orderCancel'/>")
		form.attr("method", "post")

        form.submit()
		
	}
		/* $(document).ready(function() {
			
		}) */
	</script>


	<div class="container">
		<h1>Order List</h1>
		<section class="container" style="padding: 20px">
			<div class="order_history_list">
				<table class="table table-striped">
					<tbody>
						<tr>
							<th class="td_width_3 text-center">상품정보</th>
							<th class="td_width_2 text-center">주문번호</th>
							<th class="td_width_2 text-center">주문금액</th>
							<th class="td_width_1 text-center">수량</th>
							<th class="td_width_2 text-center">주문일자</th>
							<th class="td_width_2 text-center">주문상태</th>
						</tr>
					</tbody>
				</table>
				<form id="form" class="frm">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<table class="zebra-striping">
						<input hidden="hidden" name="order_no" id="order_no"/>
						<c:forEach var="orderHistory" items="${orderHistory}">
							<input hidden="hidden" name="member_id" id="member_id"
								value="${member_id}" />
							<tr>
								<td class="td_width_3 text-center">
									<a href=""><img src="${contextPath}/resources/img/product/${orderHistory.prdt_img_name}" style="height: 150px; weight: 150px;"></a>
									<div id="product_name" value ="${orderHistory.product_name}">${orderHistory.product_name}</div>
									<span id="prdt_option_size" value="${orderHistory.prdt_order_size}">사이즈 : ${orderHistory.prdt_order_size}</span> 
									<span id="prdt_option_color" value="${orderHistory.prdt_order_color}">색상 : ${orderHistory.prdt_order_color}</span>
								</td>
								<td class="td_width_2 text-center" id="orderNotd">
									<div class="order_no">
										<span id="prdt_order_no">${orderHistory.prdt_order_no }</span>
									</div>
								</td>
								<td class="td_width_2 text-center">
									<fmt:formatNumber value="${orderHistory.prdt_order_price }" pattern="#,###" />원
								</td>
								<td class="td_width_1 text-center">
									<div class="table_text_align_center quantity_div" id="prdt_order_quan" value="${orderHistory.prdt_order_quan}">${orderHistory.prdt_order_quan}</div>
								</td>
								<td class="td_width_2 text-center">
									<fmt:formatDate value="${orderHistory.prdt_order_date }" />
								</td>
								<%-- <div class="order_date"><span id="prdt_order_date" value="${orderHistory.prdt_order_date }">${orderHistory.prdt_order_date }</span></div> --%>
								<td class="td_width_2 text-center"><c:if
										test="${orderHistory.prdt_order_type eq 'P' && orderHistory.prdt_order_cancel ne 'D'}">
										<a>배송준비중</a>
									</c:if><br /> <c:if test="${orderHistory.prdt_order_cancel eq 'D' }">
										<a>취소접수</a>
									</c:if><br />
									<button type="button" class="btn btn-light modifyBtn" onclick="cancel_Btn(this)">취소</button>
									
								</td>
							</tr>
						</c:forEach>
					</table>
				</form>
			</div>
		</section>
	</div>

	<%@ include file="/WEB-INF/views/fix/footer.jsp"%>
</body>
</html>
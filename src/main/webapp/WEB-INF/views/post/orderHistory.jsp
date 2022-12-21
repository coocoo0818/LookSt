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
	
		$("#removeBtn").on("click", function() {
			if(!confirm("정말로 취소하시겠습니까?")) return;
			
			let form = $("#form")
			form.attr("action","<c:url value='/post/prdtOrderDel${searchItem.queryString}' />")
			form.attr("method", "post")
			form.submit()
		})
	
	</script>


	<div class="container">
		<h1>Order List</h1>
		<form>
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
								<th class="td_width_2 text-center">주문취소</th>
							</tr>
						</tbody>
					</table>
					<table class="zebra-striping">
						<tbody>
							<c:forEach var="orderHistory" items="${orderHistory}">
								<input hidden="hidden" name="member_id" id="member_id"
									value="${member_id}" />
								<input hidden="hidden" name="prdt_order_no" id="prdt_order_no"
									value="${orderHistory.prdt_order_no}" />
									<tr> 
										<td class="td_width_3 text-center">
											<img src="${contextPath}/resources/img/product/${orderHistory.prdt_img_name}" style="height: 150px; weight: 150px;">
											<div id="product_name" value="${orderHistory.product_name}">${orderHistory.product_name}</div>
											<span id="prdt_option_size" value="${orderHistory.prdt_order_size}">사이즈 : ${orderHistory.prdt_order_size}</span>
											<span id="prdt_option_color" value="${orderHistory.prdt_order_color}">색상 : ${orderHistory.prdt_order_color}</span></td>
										<td class="td_width_2 text-center">
											<div class="order_no"><span id="prdt_order_no" value="${orderHistory.prdt_order_no }">${orderHistory.prdt_order_no }</span></div></td>
										<td class="td_width_2 text-center">
											<fmt:formatNumber value="${orderHistory.prdt_order_price }" pattern="#,###" />원</td>
										<td class="td_width_1 text-center">
											<div class="table_text_align_center quantity_div"
												id="prdt_order_quan" value="${orderHistory.prdt_order_quan}">${orderHistory.prdt_order_quan}</div> </td>
										<td class="td_width_2 text-center">
											<fmt:formatDate value="${orderHistory.prdt_order_date }" /></td>
											<%-- <div class="order_date"><span id="prdt_order_date" value="${orderHistory.prdt_order_date }">${orderHistory.prdt_order_date }</span></div> --%>
										<td class="td_width_2 text-center">
											<form id="form" class="frm" action="" method="post">
												<button type="button" id="removeBtn" class="btn btn-light">취소</button>
											</form>
										</td>
									</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</section>
		</form>
	</div>

	<%@ include file="/WEB-INF/views/fix/footer.jsp"%>
</body>
</html>
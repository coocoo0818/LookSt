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
<%-- <link rel="stylesheet"
	href="${contextPath}/resources/admin/css/orderFormpage.css">
 --%>
</head>
<body>
	<%@ include file="/WEB-INF/views/fix/header.jsp"%>

	<div class="container">
		<h1>Order List</h1>
		<form>
			<section class="container" style="padding: 20px">
				<div class="order_history_list">
					<table class="table table-striped">
						<thead>
							<tr>
								<th class="td_width_3">상품정보</th>
								<th class="td_width_3">주문번호</th>
								<th class="td_width_2">주문금액</th>
								<th class="td_width_1">주문수량</th>
								<th class="td_width_3">주문일자</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</tbody>
					</table>
				</div>
			</section>
		</form>
	</div>

	<%@ include file="/WEB-INF/views/fix/footer.jsp"%>
</body>
</html>
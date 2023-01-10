<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
 	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>ShoppingBag</title>
	
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js" ></script>	

</head>
<body>
	<%@ include file="/WEB-INF/views/fix/header.jsp"%>

	<div class="container">
		<h1>CART</h1>
		<section class="container" style="padding: 20px">
				<table class="table table-striped">
					<tbody>
						<tr>
							<th class="td_width_4 text-center">상품정보</th>
							<th class="td_width_2 text-center">수량</th>
							<th class="td_width_3 text-center">상품금액</th>
							<th class="td_width_3 text-center">바로구매</th>
						</tr>
					</tbody>
				</table>
		</section>		
	</div>
	
	
	<%@ include file="/WEB-INF/views/fix/footer.jsp"%>
</body>
</html>
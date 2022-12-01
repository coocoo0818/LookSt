<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=dege">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MY SALES</title>

</head>
<body>
	<%@ include file="/WEB-INF/views/fix/sellerheader.jsp"%>

	<h2 id="orderpagetitle" class="disply-2 text-center py-5">MY SALES</h2>

	<div class="container pb-5">
		<button type="button" class="btn btn-primary">나의 매출 통계</button>
		<div class="border border-2 p-sm-5">
			<canvas class="my-4 w-100" id="myChart" width="800" height="300"></canvas>
		</div>
	</div>


	<div class="container py-3 mb-5">

		<button type="button" class="btn btn-primary">
			오늘의 할 일 <span class="badge bg-danger">${fn:length(newSalelist) + fn:length(newCancellist) }</span>
		</button>
		<div class="row row-cols-1 row-cols-md-2">
			<div class="col">
				<div class="card">
					<p class="card-header fw-bold">주문관리</p>
					<div class="card-body">
						<div class="row justify-content-between pb-3">
							<div class="col-6">
								<h5 class="card-title">신규주문(결제완료)</h5>
							</div>
							<div class="col-6">
								<a class="card-text link-danger"
									href="<c:url value="/seller/orderList"/>" style="float: right">${fn:length(newSalelist) }건</a>
							</div>
						</div>
						<div class="row justify-content-between pb-3">
							<div class="col-6">
								<h5 class="card-title">취소접수</h5>
							</div>
							<div class="col-6">
								<a class="card-text link-danger"
									href="<c:url value="/seller/refundList"/>" style="float: right">${fn:length(newCancellist) }건</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card">
					<p class="card-header fw-bold">매출현황</p>
					<div class="card-body">
						<div class="row justify-content-between pb-3">
							<div class="col-6">
								<h5 class="card-title">오늘 매출</h5>
							</div>
							<div class="col-6">
								<p class="card-text" style="float: right">${todaySale}원</p>
							</div>
						</div>
						<div class="row justify-content-between pb-3">
							<div class="col-6">
								<h5 class="card-title">이번 달 총 매출</h5>
							</div>
							<div class="col-6">
								<p class="card-text" style="float: right">${monthSale}원</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>





	<%@ include file="/WEB-INF/views/fix/footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"
		integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"
		integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha"
		crossorigin="anonymous">
		<script type="text/javascript" src="${pageContext.request.contextPath }/resources/seller/js/bootstrap.bundle.min.js">
	</script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/resources/seller/js/dashboard.js"></script>
</body>
</html>
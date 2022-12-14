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
<script type="text/javascript">
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("sample6_extraAddress").value = extraAddr;

						} else {
							document.getElementById("sample6_extraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();
	}
</script>

<script type="text/javascript">
	/* $(document).ready(function() { */
		var IMP = window.IMP; // 생략 가능
		IMP.init("imp42155271"); // 예: imp00000000

		// 주문번호 만들기
		function createOrderNum() {
			const date = new Date();
			const year = date.getFullYear();
			const month = String(date.getMonth() + 1).padStart(
					2, "0");
			const day = String(date.getDate()).padStart(2, "0");

			let orderNum = year + month + day;
			for (let i = 0; i < 2; i++) {
				orderNum += Math.floor(Math.random() * 8);
			}
			return orderNum;
		}

		function payment() {
			const data = {
				payMethod : $(
						'input[name="paymentMethod"]:checked')
						.val(),
				prdt_option_size : $('#prdt_option_size').attr(
						'value'),
				product_name : $('#product_name').attr('value'),
				prdt_option_color : $('#prdt_option_color')
						.attr('value'),
				prdt_order_quan : $('#prdt_order_quan').attr(
						'value'),
				product_no : $("input[name='product_no']")
						.val(),
				prdt_order_person : $(
						"input[name='prdt_order_person']")
						.val(),
				prdt_order_phone : $(
						"input[name='prdt_order_phone']").val(),
				prdt_order_addr : $(
						"input[name='prdt_order_addr']").val(),
				prdt_order_addr2 : $(
						"input[name='prdt_order_addr2']").val(),
				member_id : $("input[name='member_id']").val(),
				prdt_order_price : $(
						"input[name='prdt_order_price']").val(),
				prdt_order_postcode : $(
						"input[name='prdt_order_postcode']")
						.val(),
				orderNum : createOrderNum()
			}

			if (data.prdt_order_person == "undefined"
					|| data.prdt_order_person == null
					|| data.prdt_order_person == "") {
				alert("배송지 이름을 입력해주세요.")
				return false;
			} else if (data.prdt_order_phone == "undefined"
					|| data.prdt_order_phone == null
					|| data.prdt_order_phone == "") {
				alert("배송지 전화번호를 입력해주세요.")
				return false;
			} else if (data.prdt_order_addr == "undefined"
					|| data.prdt_order_addr == null
					|| data.prdt_order_addr == "") {
				alert("주소를 입력해주세요.")
				return false;
			} else if (data.prdt_order_addr2 == "undefined"
					|| data.prdt_order_addr2 == null
					|| data.prdt_order_addr2 == "") {
				alert("상세주소를 입력해주세요.")
				return false;
			}
			
			if (data.payMethod == "o_payment") {
				paymentCard(data)
			} else if (data.payMethod == "payment") {
				paymentCash(data)
			}
		}

		function paymentCard(data) {
			// IMP.request_pay(param, callback) 결제창 호출
			IMP.request_pay(
			{ // param
				pg : "html5_inicis.INIpayTest",
				pay_method : data.payMethod,
				merchant_uid : data.orderNum,
				name : data.product_name,
				amount : data.prdt_order_price,
				buyer_email : data.member_id,
				buyer_name : data.prdt_order_person,
				buyer_tel : data.prdt_order_phone,
				buyer_addr : data.prdt_order_addr
						+ " "
						+ data.prdt_order_addr2,
				buyer_postcode : data.prdt_order_postcode
			},
			function(rsp) { // callback
				if (rsp.success) {
					/* alert("성공") */
					// jQuery로 HTTP 요청
					$.ajax({
						url : '${contextPath}/admin/orderInsert', // 예: https://www.myservice.com/payments/complete
						method : "POST",
						data : {
							prdt_order_no : data.orderNum,
							product_no : data.product_no,
							member_id : data.member_id,
							prdt_order_quan : data.prdt_order_quan,
							prdt_order_way : data.payMethod,
							prdt_order_phone : data.prdt_order_phone,
							prdt_order_addr : data.prdt_order_addr,
							prdt_order_addr2 : data.prdt_order_addr2,
							prdt_order_person : data.prdt_order_person,
							prdt_option_size : data.prdt_option_size,
							prdt_option_color : data.prdt_option_color,
							prdt_order_price : data.prdt_order_price,
							imp_uid : rsp.imp_uid,
							merchant_uid : rsp.merchant_uid
						}
					}).done(function(data) {
						// 가맹점 서버 결제 API 성공시 로직
						/* alert(data) */
					})
				} else {
					alert("결제에 실패했습니다. 에러 내용 : "+ rsp.error_msg)
					// 결제 실패 시 로직,
				}
			})
		}
	/* }) */
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/fix/header.jsp"%>

	<div class="container">
		<h1>Order List</h1>
		<form action="${contextPath}/admin/orderInsert" method="post">
			<div id="app">
				<!-- Product List -->
				<section class="container">
					<!-- 장바구니 리스트 -->
					<div class="content_middle_section"></div>
					<!-- 장바구니 가격 합계 -->
					<!-- cartInfo -->
					<div class="content_totalCount_section">

						<table class="subject_table">
							<caption>표 제목 부분</caption>
							<tbody>

								<tr>
									<th class="td_width_2"></th>
									<th class="td_width_3">상품명</th>
									<th class="td_width_3">가격</th>
									<th class="td_width_1">수량</th>
									<th class="td_width_3">합계</th>
								</tr>
							</tbody>
						</table>
						<table class="cart_table">
							<caption>표 내용 부분</caption>
							<tbody>
								<c:forEach var="orderInfo" items="${orderInfo}">
									<input hidden="hidden" name="member_id" id="member_id"
										value="${member_id}" />
									<input hidden="hidden" name="product_no" id="product_no"
										value="${orderInfo.product_no}" />
									<input hidden="hidden" name="prdt_order_quan"
										id="prdt_order_quan"
										value="${prdt_order_quan}" />
									<input hidden="hidden" name="prdt_order_price"
										id="prdt_order_price"
										value="${orderInfo.product_price * prdt_order_quan}" />
									<tr>
										<td class="td_width_2"><img
											src="${contextPath}/resources/img/product/${orderInfo.prdt_img_name}"
											style="height: 150px; weight: 150px;"></td>
										<td class="td_width_3">
											<div id="product_name" value="${orderInfo.product_name}">${orderInfo.product_name}</div>
											<span id="prdt_option_size" value="${prdt_option_size}">사이즈
												: ${prdt_option_size}</span> <span id="prdt_option_color"
											value="${prdt_option_color}">색상 : ${prdt_option_color}</span>
										</td>
										<td class="td_width_3 price_td table_text_align_center"><fmt:formatNumber
												value="${orderInfo.product_price}" pattern="#,###" /></td>
										<td class="td_width_1 table_text_align_center">
											<div class="table_text_align_center quantity_div"
												id="prdt_order_quan" value="${prdt_order_quan}">
												${prdt_order_quan}</div>
										</td>
										<td class="td_width_3 table_text_align_center"><fmt:formatNumber
												value="${orderInfo.product_price * prdt_order_quan}"
												pattern="#,###" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<table class="list_table">
						</table>
					</div>

					<!-- <div v-else class="empty-product">
						<h3>돈 더 써볼까요?</h3>
						<button>돈쭐을 내주마!</button>
					</div> -->
				</section>
				<!-- End Product List -->

				<!-- End Summary -->
			</div>

			<div class="container">
				<div class="row g-5">
					<div class="col-md-5 col-lg-4 order-md-last">
						<input type="button" id="checkoutbtn"
							class="w-100 btn btn-primary btn-lg" value="Continue to checkout"
							onclick="payment()" />
					</div>

					<div class="col-md-7 col-lg-8">
						<h4 class="mb-3">주문자 정보</h4>
						<div class="row g-3">
							<div class="col-12">
								<label for="firstName" class="form-label"><strong>고객명</strong></label>
								<input type="text" class="form-control" id="prdt_order_person"
									placeholder="" value="" required="" name="prdt_order_person">
								<div class="invalid-feedback">Valid first name is
									required.</div>
							</div>

							<div class="col-12">
								<label for="phoneNum" class="form-label"><strong>연락처</strong></label>
								<div class="input-group has-validation">
									<span class="input-group-text">H.P</span> <input type="text"
										class="form-control" id="prdt_order_phone"
										placeholder="연락처를 입력해주세요" required="" name="prdt_order_phone">
									<div class="invalid-feedback">Your username is required.</div>
								</div>
							</div>

							<div class="col-12">
								<label for="address" class="form-label"><strong>배송지</strong></label>
								<input type="button" class="btn btn-light"
									onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
								<div>
									<input type="text" class="form-control" id="sample6_postcode"
										placeholder="우편번호" name="prdt_order_postcode"><br>
								</div>
								<div>
									<input type="text" class="form-control" id="sample6_address"
										placeholder="주소" name="prdt_order_addr"><br>
								</div>
								<div>
									<input type="text" class="form-control"
										id="sample6_detailAddress" placeholder="상세주소"
										name="prdt_order_addr2"><br>
								</div>
								<div>
									<input hidden="hidden" type="text" class="form-control"
										id="sample6_extraAddress" placeholder="참고항목">
								</div>
								<div class="invalid-feedback">Please enter your shipping
									address.</div>
							</div>

							<hr class="my-4">
							<h4 class="mb-3">결제수단</h4>

							<div class="my-3">
								<div class="form-check">
									<input id="credit" name="paymentMethod" type="radio"
										class="form-check-input" required="" value="o_payment" checked>
									<label class="form-check-label" for="credit">온라인결제</label>
								</div>
								<div class="form-check">
									<input id="debit" name="paymentMethod" type="radio"
										class="form-check-input" required="" value="payment"> <label
										class="form-check-label" for="debit">무통장입금</label>
								</div>
							</div>
							<hr class="my-4">
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<%@ include file="/WEB-INF/views/fix/footer.jsp"%>
</body>
</html>
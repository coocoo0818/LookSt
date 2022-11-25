<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${contextPath}/resources/board/css/faq.css">
<title>Lookst</title>

<style type="text/css">
a {
	text-decoration: none !important;
}

.notice1 {
	list-style: none;
	margin: 0 17%;
	font-weigh: bold;
}

.hover {
  display: inline-block;
  transition: .3s;
  -webkit-transform: scale(1);
  transform: scale(1);
}
.hover:hover {
  -webkit-transform: scale(1.1);
  transform: scale(1.1);
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/fix/header.jsp"%>
   <div class="container">
	<div class="row justify-content-md-center">
		<h2 class="col-auto mt-5">FAQ</h2>
		     <li class="notice1">
		     	 <a class="hover"  href="${contextPath}/board/list">Q&A &nbsp;</a>
		     	 <a class="hover"  href="${contextPath}/board/list/notice">NOTICE &nbsp;</a>
			     <a class="hover"  href="${contextPath}/board/list/faq" style="font-weight: 900; font-size: x-large;">FAQ &nbsp;&nbsp;</a>
		     </li>
			<!-- QNA -->
			<!-- partial:index.partial.html -->
			<div class="container">
				<div id="faq-links">
					<div id="service" class="faq-selected">이용정책</div>
					<div id="installation">서비스</div>
					<div id="plan">구매</div>
					<div id="features">판매</div>
					<div id="mobile">공통</div>
				</div>


				<div id="faq-wrapper" class="about-service">

					<div class="faq-group">
						<div class="slide-left">
							<div>이용정책</div>
						</div>
						<hr>
					</div>
					<!--faq-group-->
					<div class="slide-left">
						<div class="faq">
							<ul class="faq-accordion">

								<li><a href="#">가품 ・ 중고품 판매에 대한 제재</a>
									<ul class="faq-content">
										<li>
											<div>
												<p>
													가품 ・ 중고품 판매를 시도하여 적발된 경우 판매금액의 15.0% 페널티가 부과되며 판매자는 적발 즉시
													이용정지 처리됩니다. 가품 판매의 경우 상표법 108조에 의거 민사상 손해배상 책임 및 형사상 7년 이하의
													징역 또는 1억원 이하의 벌금 처벌을 받을 수 있습니다. 또한 이용약관 제 27조(검수 등) 6항에 따라
													가품 판매자는 상표법 등 관계 법령 위반 혐의로 수사기관에 신고될 수 있으며, 가품 판정 상품은 수사기관
													제출, 압수 등으로 인하여 판매자에게 반환되지 않을 수 있습니다. <br> <br>
													소명자료 접수 KREAM에서는 가품/중고품으로 부터 구매자를 안전하게 보호하고자 해당 제재를 실행하며,
													이에 따라 선의의 피해자가 발생하지 않도록 소명서 및 관련 자료를 고객센터로 전달해주시면 내부 검토를
													진행하고 있습니다. <br> <br> 해외 온라인결제 구매 <br> ① 구매한
													상품의 상세 캡쳐 이미지 <br> ② 상세 주문 내역 <br> • 상품명, 구매가,
													결제일, 배송처 등 포함 <br> ③ 신용카드 명세서 또는 계좌이체 확인서 <br> •
													신용카드 명세서: 결제일시, 가맹점 포함 <br> • 계좌이체 확인서: 이체일시, 수신 계좌번호,
													수신 계좌주명 포함 <br> ④ 국내 반입 경로 증빙자료 <br> • 관세청 통관 조회
													또는 배송대행지 이용내역 등 <br> <br> 국내 온라인결제 구매 <br> ①
													구매한 상품의 상세 캡쳐 이미지 <br> ② 상세 주문 내역 <br> • 상품명,
													구매가, 결제일, 배송처 등 포함 <br> ③ 신용카드 명세서 또는 계좌이체 확인서 <br>
													• 신용카드 명세서: 결제일시, 가맹점 포함 • 계좌이체 확인서: 이체일시, 수신 계좌번호, 수신 계좌주명
													포함 <br> <br> 직거래/지인거래 <br> ① 판매글 전문 <br>
													• 작성일시, 작성자 포함 • 판매글이 삭제된 경우, 이에 상응하는 자료 • 삭제 전 캡쳐한 이미지,
													운영자에게 게시글 복구 요청 등 <br> ② 판매자와의 대화 내용 전문 <br> •
													일시, 계좌번호, 발송한 운송장번호 등 포함 <br> ③ 계좌이체내역서(이체확인증) 또는
													송금확인서 <br> • 송금확인서: 이체일,수신계좌번호,계좌주 포함 • 은행 사이트에서의 내역
													캡쳐는 인정 되지 않음 <br> <br> 오프라인 구매 <br> ① 구매영수증
													<br> • 구매처, 구매일시, 금액 포함 <br> ② 카드결제전표, 또는 계좌이체확인서
													<br> • 가맹점명, 계좌번호, 결제/이체 일시, 금액 포함
												</p>
											</div>
										</li>
									</ul></li>
								<!--Bacon ipsum-->
								<li><a href="#"> 거래 실패 시 반송 운임 기준</a>
									<ul class="faq-content">
										<li>
											<div>
												<p>
													거래 실패로 인한 상품 반송 시, 택배 운임의 선불/착불 기준은 아래와 같습니다. <br> <br>
													검수 불합격 <br> <br> 착불 &nbsp;&nbsp; 검수 기준상 '불합격' 에
													해당하는 반송건 <br> <br> 선불 &nbsp;&nbsp; '구매의사 확인' 이후
													발생하는 반송건 <br> <br> 발송지연 ・ 미입고 착불 발송정보 입력없이 검수센터
													도착 입고 마감 기한 이후 검수센터 도착 거래 체결 전 상품 발송
												</p>
											</div>
										</li>
									</ul></li>
								<!--Beer ipsum-->

								<li><a href="#">포인트 정책</a>
									<ul class="faq-content">
										<li>
											<div>
												<p>
													LookSt 서비스 이용 중 이벤트 참여 등으로 적립된 포인트는 아래 정책이 적용됩니다. <br>
													<br> <br> <br> 포인트 유효기간은 적립일로부터 최대 1년까지이며,
													유형에 따라 달라질 수 있습니다. <br> <br> 1,000P 이상부터 구매금액 제한
													없이 사용할 수 있습니다. <br> <br> 체결 시점에 보유한 최대 포인트가
													적용됩니다. <br> <br> 입찰 삭제, 거래 취소 시 사용한 포인트는 환불됩니다. <br>
													<br> 먼저 적립된 포인트부터 순서대로 사용되며, 사용하지 않을 경우 유효기간이 지나면 자동
													소멸됩니다. <br> <br> 유효 기간이 지난 후 환불받은 포인트는 다시 사용할 수
													없습니다.
												</p>
											</div>
										</li>
									</ul></li>
								<!--Carey ipsum-->
							</ul>
						</div>
					</div>
				</div>
				<div class="about-installation faq-hide">
					<div class="faq-group">
						<div class="slide-left">
							<div>서비스</div>
						</div>
						<hr>
					</div>
					<div class="slide-left">
						<ul class="faq-accordion">

							<li><a href="#">LookSt는 어떤 서비스인가요?</a>
								<ul class="faq-content">
									<li>
										<div>
											<p>
												LookSt는 쉽게 구매하기 어려운 한정판 상품을 판매하고 거래할 수 있는 서비스 입니다. <br>
												<br> <br> 모든 상품은 사용한 적이 없는 완전한 새상품이며, 전문가의 철저한 검수를
												통해 안전하고 신속하게 거래할 수 있습니다.
											</p>
										</div>
									</li>
								</ul></li>
							<!--Bacon ipsum-->

							<li><a href="#"> 구매와 판매는 어떤 방식으로 이루어지죠?</a>
								<ul class="faq-content">
									<li>
										<div>
											<p>
												구매자와 판매자가 각각 원하는 구매/판매 가격으로 입찰할 수 있으며, 가격이 일치하면 거래가 체결됩니다. <br>
												<br> <br> 또한, 구매자는 판매자의 입찰 중 가장 낮은 가격으로 즉시 구매할 수
												있으며, 판매자는 구매자의 입찰 중 가장 높은 가격으로 즉시 판매할 수 있습니다.
											</p>
										</div>
									</li>
								</ul></li>
							<!--Beer ipsum-->

							<li><a href="#">구매나 판매를 취소하고 싶어요.</a>
								<ul class="faq-content">
									<li>
										<div>
											<p>
												구매 입찰이나 판매 입찰을 하는 경우, 입찰 마감기한 이내에는 입찰 주문 내역을 변경하거나 취소할 수
												있습니다. 해당 주문내역 상세보기에서 오른쪽 상단 휴지통 모양의 '입찰지우기'를 선택하시면 취소가
												가능합니다. <br> <br> 즉시 판매나 즉시 구매, 입찰 후 거래가 체결된 경우에는
												원칙적으로 취소가 불가능합니다. <br> <br> 단, 판매자의 경우 검수 센터로 상품을
												보내기 전 '판매 거부'가 가능하며, 이 때에는 거래 실패에 대한 페널티가 부과됩니다.
											</p>
										</div>
									</li>
								</ul></li>
							<!--Carey ipsum-->
						</ul>

					</div>
					<!--lide-left -->
				</div>


				<div class="about-plan faq-hide">

					<div class="faq-group">
						<div class="slide-left">
							<div>구매</div>
						</div>
						<hr>
					</div>
					<div class="slide-left">
						<ul class="faq-accordion">

							<li><a href="#">상품 구매는 어떻게 하나요?</a>
								<ul class="faq-content">
									<li>
										<div>
											<p>
												서비스 가입 후 로그인 한 회원은 누구나 상품을 구매할 수 있습니다. <br> <br>
												상품을 검색하고, 원하는 사이즈를 선택한 후 구매 버튼을 누르면 즉시 구매 혹은 구매 입찰이 가능합니다. <br>
												<br> 즉시 구매하거나 입찰 후 거래가 체결되면 판매자가 상품을 검수 센터로 전달하여 검수를
												진행하게 되며, 검수를 합격한 상품은 구매자에게 안전하게 배송됩니다.
											</p>
										</div>
									</li>
								</ul></li>
							<!--Bacon ipsum-->

							<li><a href="#">할부 결제에 대해 알고 싶어요.</a>
								<ul class="faq-content">
									<li>
										<div>
											<p>
												현재 즉시 구매의 경우 할부 결제를 제공하고 있습니다. <br> <br> 즉시 구매의
												'배송/결제' 화면에서 결제 방법으로 '신용카드 일반 결제' 또는 '네이버 페이'를 선택하고 카드사를
												선택하면 할부 결제가 가능하며, <br> 결제사의 이벤트에 따라 무이자 할부와 슬림 할부로 결제
												가능합니다. <br> <br> 이후에도 다양한 결제 수단을 추가하여 편리한 결제를 지원할
												예정입니다.
											</p>
										</div>
									</li>
								</ul></li>
							<!--Beer ipsum-->

							<li><a href="#">배송 주소 변경은 어떻게 하나요?</a>
								<ul class="faq-content">
									<li>
										<div>
											<p>
												구매 입찰 중인 주문은 언제든지 "입찰 변경하기" 버튼을 선택하여 주소를 변경하실 수 있습니다. <br>
												<br> 구매 진행 중인 주문은 해당 주문의 상세화면에서 진행 상황이
												<대기 중 / 발송완료 / 입고완료>인 경우 배송 주소에서 "배송지 변경" 버튼으로 변경 가능합니다
												<br>
												<br>
												변경 가능 : 대기 중 / 발송완료 / 입고완료 변경 불가능 : 검수 중 / 검수 합격 <br>
												<br>
												* 빠른배송 구매 및 구매 후 창고 보관을 선택한 경우 배송 주소를 변경할 수 없습니다. 
											</p>
										</div>
									</li>
								</ul></li>
							<!--Carey ipsum-->
						</ul>
					</div>
					<!--slide-left-->
				</div>
				<div class="about-features faq-hide">
					<div class="faq-group">
						<div class="slide-left">
							<div>판매</div>
						</div>
						<hr>
					</div>
					<div class="slide-left">
						<ul class="faq-accordion">
							<li><a href="#">해외에서 직구한 상품 판매해도 될까요?</a>
								<ul class="faq-content">
									<li>
										<div>
											<p>
												미화 150달러 이하(미국에서 구매할 경우 미화 200달러 이하)의 자가 사용 목적으로 구매한 상품을 국내에
												판매할 경우, 관세법상 처벌 대상이 됩니다. <br> <br> 관세를 정상적으로 납부한
												상품을 판매하는 것은 관세법상 위법은 아니지만, 지속적으로 판매할 경우 조사 대상이 될 수 있으므로 주의가
												필요합니다. <br> <br> 자세한 내용은 관세청 고객지원센터(국번없이 125)로
												문의바랍니다.
											</p>
										</div>
									</li>
								</ul></li>
							<!--Bacon ipsum-->

							<li><a href="#">발송 정보 변경은 어떻게 하나요?</a>
								<ul class="faq-content">
									<li>
										<div>
											<p>
												판매하신 주문을 발송하신 후, 오타나 택배사 오선택 등으로 발송 정보 변경을 원하시는 경우 해당 주문의
												상세화면에서 발송 정보 항목 우측의 "발송정보 변경" 버튼을 선택하여 입력하신 정보를 변경하실 수 있습니다.
												<br> <br> 단, 발송 정보 변경은 진행 상황이
												<발송완료>인 상태이고 판매자의 발송 마감기한 내에만 수정 가능하며 발송 마감기한이 지난 후에는
												<발송완료> 상태일지라도 변경이 불가능합니다. <br>
												<br>
												이는 허위 정보를 입력 후, 발송정보 마감 기한 이후에 발송하여 운송장 정보를 변경함으로써 페널티를 회피하는
												등의 악의적인 사례를 방지하고자 함 입니다. <br>
												<br>
												<br>
												[유의사항] <br>
												<br>
												*오프라인 접수 시 발송 마감기한 내에 접수처에서만 정보 변경이 가능합니다. 
											</p>
										</div>
									</li>
								</ul></li>
							<!--Beer ipsum-->

							<li><a href="#">판매 과정을 설명해주세요.</a>
								<ul class="faq-content">
									<li>
										<div>
											<p>
												서비스 가입 후 로그인 한 회원은 상품을 판매할 수 있습니다. <br> <br> 판매하실
												상품을 검색하고, 사이즈를 선택한 후 판매 버튼을 누르면 즉시 판매 혹은 판매 입찰이 가능합니다. <br>
												<br> 즉시 판매하거나 입찰 후 거래가 체결되면 상품을 검수 센터로 발송하고, 검수에 합격하게
												되면 판매 대금을 정산해 드립니다.
											</p>
										</div>
									</li>
								</ul></li>

						</ul>
					</div>
					<!--slide-left-->
				</div>
				<!--about-features faq-hide-->


				<div class="about-mobile faq-hide">

					<div class="faq-group">
						<div class="slide-left">
							<div>공통</div>
						</div>
						<hr>
					</div>
					<div class="slide-left">
						<ul class="faq-accordion">

							<li><a href="#">고객센터 연락처를 알려주세요.</a>
								<ul class="faq-content">
									<li>
										<div>
											<p>
												서비스를 이용하며 느끼신 불편한 점이나 바라는 점을 알려주세요. 소중한 의견으로 더욱 성장하는 LookSt가
												되겠습니다. <br> <br> 고객센터 1588-7813 <br> 운영시간 평일
												11:00 - 18:00 (토∙일, 공휴일 휴무) <br> 점심시간 평일 13:00 - 14:00
												<br> 문의 전화가 많아 연결이 다소 지연될 수 있습니다. <br> 1:1 문의하기는
												즉시 접수 가능합니다. <br> <br> 1:1 문의하기 <br> 홈 > 하단
												푸터 [1:1 문의] <br> MY > 하단 고객센터 안내 [1:1 문의] <br>
												24시간 접수 가능하며 답변시간 이후 접수건은 운영시간 내 순차적으로 답변해드립니다.
											</p>
										</div>
									</li>
								</ul></li>
							<!--Bacon ipsum-->

							<li><a href="#">탈퇴 신청은 어떻게 하나요?</a>
								<ul class="faq-content">
									<li>
										<div>
											<p>
												더이상 서비스를 이용하지 않고 탈퇴하시려면 LookSt의 MY > 설정 > 로그인 정보 하단 또는 PC
												웹페이지 https://LookSt.co.kr 의 마이 페이지 > 프로필 정보 하단의 '회원 탈퇴'를 통해
												탈퇴 요청할 수 있습니다. <br> 단, 다음의 경우에는 회원 탈퇴가 제한될 수 있습니다. <br>
												<br> <br> 진행 중인 거래(판매/구매)가 있을 경우, 해당 거래 종료 후 탈퇴 가능
												진행 중인 입찰(판매/구매)이 있을 경우, 해당 입찰 삭제 후 탈퇴 가능 보류 중인 결제(페널티 결제
												포함)가 있을 경우, 해당 결제 완료 후 탈퇴 가능 이용정지 중인 경우, 이용정지 해제 후 탈퇴 가능
												(이용약관 제 8 조 참고) <br> <br> 탈퇴 이후에는 동일한 이메일로 재가입 할 수
												없습니다.
											</p>
										</div>
									</li>
								</ul></li>
							<!--Beer ipsum-->

							<li><a href="#">이메일 아이디를 변경하고 싶어요.</a>
								<ul class="faq-content">
									<li>
										<div>
											<p>
												LookSt PC 웹페이지 https://LookSt.co.kr 에서 로그인한 후, 마이 페이지 > 프로필
												정보의 이메일 주소 '변경'을 통해 이메일 아이디를 변경할 수 있습니다. <br> <br>
												이메일 아이디 변경 시 입력한 이메일 주소로 인증 메일이 발송되며, 인증 메일의 '인증하기' 버튼을 선택하면
												인증이 완료됩니다. 인증이 완료될 경우 변경한 이메일로 로그인할 수 있습니다. <br> <br>
												* 인증 메일이 확인되지 않을 경우, 스팸메일함을 확인해주시기 바랍니다. <br> <br>
												* 네이버/애플 로그인의 경우, 앱의 1:1문의를 통해 요청해주시면 안내해드리겠습니다.
											</p>
										</div>
									</li>
								</ul></li>
							<!--Carey ipsum-->
						</ul>
					</div>
					<!--slide-left-->
				</div>
				<!--about-mobile faq-hide-->
			</div>
		</div>
	</div>	
	
			<!--container-->
			<!-- partial -->
			<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js'></script>
			<script src="${contextPath}/resources/board/js/faq.js"></script>
<%@ include file="/WEB-INF/views/fix/footer.jsp"%>
</body>
</html>
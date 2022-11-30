<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LookSt 회원이 되신 것을 환영합니다.</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/fix/header.jsp"%>

	<div class="container">
	<!-- Content here -->
		<h3>회원가입이 완료<small class="text-muted">되었습니다.</small></h3>
		<div class="card">
		  <div class="card-body">

			<li><strong>일반 회원</strong>으로 가입 완료되었습니다.</li>
		    <li>일반 회원 가입 후 LookSt에 입점을 희망하는 회원은 [마이페이지 > 회원정보] 메뉴에서 [판매자 등록] 서비스를 이용해 주세요.</li>
		  </div>
		</div>
		
		<button type="button" class="btn btn-outline-primary" onclick="location.href = '/lookst'">홈으로</button>
		<button type="button" class="btn btn-primary" onclick="location.href = '/lookst/login'">로그인</button>
	</div>

	<%@ include file="/WEB-INF/views/fix/footer.jsp"%>
</body>
</html>
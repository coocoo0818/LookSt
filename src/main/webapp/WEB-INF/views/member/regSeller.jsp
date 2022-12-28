<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
body {
	background: #eeeeee !important;	
}
.form-signup-heading{
  margin-top: 10px;
  position: static;
  font-size: 40px;
  text-align: center;
}
.signup-box {
  padding: 40px;
  background-color: #ffffff;
}
.signup-user-box input {
  position: absolute;
  right: 40px;
  max-width: 420px;
  width: 100%;
  padding-top: 0px;  
  padding-bottom: 5px;
  border: none;
  border-bottom: 1px solid #bbbbbb;
  outline: none;
  background: transparent;
  font-family: "Noto Sans KR", sans-serif;
  font-size: 10.5pt;
  font-weight: normal;
}
.signup-input {
  top: 115px;
  left: 5px;
}

.Check-box-main {
  position: absolute;
  top: 560px;
  max-width: 420px;
  width: 100%;
}
.Check-list {
  position: absolute;
  top: 0px;
  left: 95px;
  margin-block: 0rem;
  font-family: "Noto Sans KR", sans-serif;
  font-size: 14px;
  font-weight: 300;
}
.signup-btn {
  position: absolute;
  bottom: 40px;
}
.g-recaptcha {
  position: absolute;
  top: 475px;
  left: 140px;
}
::placeholder {
  color: #bbbbbb;
}

button {
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  font-family: "Noto Sans KR", sans-serif;
  font-size: 1rem;
  font-weight: 400;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  width: 520px;
  height: 40px;
  border: none;
  cursor: pointer;
  transition: 0.3s;
  background: #000000;
  color: #ffffff; 
}
.btn2 {
  position: fixed;
  right: 40px;
  margin-top: -10px;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  font-family: "Noto Sans KR", sans-serif;
  font-size: 12px;
  font-weight: 400;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  width: 60px;
  height: 35px;
  border: none;
  cursor: pointer;
  transition: 0.3s;
  background: #000000;
  color: #ffffff; 
}
button:active,
button:hover,
button:focus {
  background: var(--button-hover-bg-color);
  outline: 0;
}
button:disabled {
  opacity: 0.5;
}
:root {
  --button-color: #000000;
  --button-bg-color: #000000;
  --button-hover-bg-color: #505050;
}

a {
  text-decoration-line: none;
  font-size: 15px;
  font-family: "Noto Sans KR", sans-serif;
}
</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/fix/header.jsp"%>
	
	<div class="container w-75 mt-5 mb-5">
		<form action="./mypage" method="post">
			<div class="signup-box">
				<div class="container">
					  <form class="signup-user-box">
					    <h2 class="form-signup-heading">판매자 등록 정보</h2>
					    <div class="signup-input" style="line-height:110%">
					      <a style="color: #000000; font-weight: bold;">사업자 번호</a>
					      <a style="color: #ff0000; font-weight: bold;"> *</a>
					      <input type="text" class="form-control" name="seller_no" value="${selectSellerInfo.seller_no}" placeholder="123-45-6789" required="" />
					      <br/><br/>
					      <a style="color: #000000; font-weight: bold;">회사명</a>
					      <a style="color: #ff0000; font-weight: bold;"> *</a>
					      <input type="text" class="form-control" name="seller_name" value="${selectSellerInfo.seller_name}" placeholder="EZEN" required="" />
					      <br/><br/>
					      <a style="color: #000000; font-weight: bold;">우편 번호</a>
					      <a style="color: #ff0000; font-weight: bold;"> *</a>
					      <input type="text" class="form-control" name="seller_zip" value="${selectSellerInfo.seller_zip}" placeholder="12345" required="" />
					      <br/><br/>
					      <a style="color: #000000; font-weight: bold;">회사 주소</a>
					      <a style="color: #ff0000; font-weight: bold;"> *</a>
					      <input type="text" class="form-control" name="seller_addr" value="${selectSellerInfo.seller_addr}" placeholder="사랑시 고백구 행복동 " required="" />
					      <br/><br/>
					      <input type="text" class="form-control" name="seller_addr2" value="${selectSellerInfo.seller_addr2}" placeholder="회사 주소 입력란" required="" />
					      <br/><br/>
					      <a style="color: #000000; font-weight: bold;">대표 번호</a>
					      <a style="color: #ff0000; font-weight: bold;"> *</a>
					      <input type="text" class="form-control" name="seller_number" value="${selectSellerInfo.seller_number}" placeholder="010-0000-0000" required="" />
					      <br/><br/>
					      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					      <button class="container btn btn-primary" type="submit" onclick="location.href='../index.html'">판매자 등록하기</button>
					  	</div>
					  </form>
  				</div>
			</div>
		</form>
	</div>
	
	<%@ include file="/WEB-INF/views/fix/footer.jsp"%>
</body>
</html>
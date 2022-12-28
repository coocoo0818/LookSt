<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
//카카오 주소 API
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
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
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("member_zip").value = data.zonecode;
                document.getElementById("member_addr").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("member_addr2").focus();
                
            }
        }).open();
    }
</script>

<style>
body {

}
.edit_title{
  position: static;
  font-size: 40px;
  text-align: left;
  padding-top: 30px;
  padding-bottom: 10px;
  margin-top: 15px;
  margin-bottom: 10px;
  border-bottom: 1.5px solid #000000;
}
.edit_main_box {
  position: absolute;
  top: 10%;
  left: 50%;
  width: 720px;
  height: 1575px;
  padding: 60px;
  transform: translate(-50%, 0%);
  box-sizing: border-box;
  background-color: #ffffff;
}
.edit_member_box input {
  position: absolute;
  margin-top: -22px;
  margin-left: 130px;
  max-width: 410px;
  width: 100%;
  padding-top: 0px;  
  padding-bottom: 5px;
  border: none;
  outline: none;
  background: transparent;
  font-family: "Noto Sans KR", sans-serif;
  font-size: 10.5pt;
  font-weight: normal;
}
.bottom-line {
  padding-bottom: 10px;
  margin-bottom: 10px;
  border-bottom: 1px solid #bbbbbb;
}
.bottom-line2 {
  padding-bottom: 10px;
  margin-bottom: 10px;
  border-bottom: 1.5px solid #000000;
}

.subscribe-btn {
  position: fixed;
  margin-top: 1px;
  margin-left: 20.9%;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  font-family: "Noto Sans KR", sans-serif;
  font-size: 1rem;
  font-weight: 400;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  width: 220px;
  height: 40px;
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

.edit_member_a {
  position: relative;
  left: 5px;
  text-decoration-line: none;
  font-size: 15px;
  font-family: "Noto Sans KR", sans-serif;
}
.google-btn {
  position: relative;
  top: 10px;
  left: 5px;
  margin-top: -20px;
  margin-bottom: 6px;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  display: inline-block;
  width: 30px;
  height: 30px;
  border: none;
  cursor: pointer;
  transition: 0.3s;
  background: #e34a3c;
}
.kakao-btn {
  position: relative;
  top: 10px;
  left: 5px;
  margin-top: -20px;
  margin-bottom: 6px;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  display: inline-block;
  width: 30px;
  height: 30px;
  border: none;
  cursor: pointer;
  transition: 0.3s;
  background: #f9e000;
}
.naver-btn {
  position: relative;
  top: 10px;
  left: 5px;
  margin-top: -20px;
  margin-bottom: 6px;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  display: inline-block;
  width: 30px;
  height: 30px;
  border: none;
  cursor: pointer;
  transition: 0.3s;
  background: #41c62d;
}
.check-box1 {
  position: relative;
  top: 1px;
}
.Check-list {
  font-family: "Noto Sans KR", sans-serif;
  font-size: 10.5pt;
  font-weight: normal;
  color: #505050;
}
.seller-btn {
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  margin: 0;
  padding: 0.5rem 1rem;
  font-family: "Noto Sans KR", sans-serif;
  font-size: 1rem;
  font-weight: 400;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  width: 600px;
  height: 45px;
  border: none;
  cursor: pointer;
  transition: 0.3s;
  background: #000000;
  color: #ffffff; 
}
</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/fix/header.jsp"%>


<div class="container w-75 mt-5 mb-5" style="width: 720px;">

		<div class="container w-75 mt-5 mb-5" style="width: 720px;">
		<form action="./mypage" method="post">
			<div class="edit_member_box">
		    <h2 class="edit_title">기본 회원 정보</h2>
		    <div style="line-height:110%">
		        <div class="bottom-line">
		            <a class="edit_member_a" style="color: #000000; font-weight: bold;">닉네임</a>
		            <a class="edit_member_a" style="color: #000000; font-weight: bold;"> *</a>
		            <input type="text" class="form-control" name="member_nick" value="${selectInfo.member_nick}" placeholder="lala" required="" />
		        </div>
		        <div class="bottom-line">
		            <a class="edit_member_a" style="color: #000000; font-weight: bold;">비밀번호 수정</a>
		            <a class="edit_member_a" style="color: #000000; font-weight: bold;"> *</a>
		            <input type="password" class="form-control" name="member_pw" placeholder="비밀번호를 입력해 주세요. (숫자, 영문, 특수문자 조합 8~20자)" required="" />
		        </div>
		        <div class="bottom-line">
		            <br/>
		            <input type="password" class="form-control" name="member_pw2" placeholder="비밀번호를 재입력해 주세요." required="" />
		        </div>
		        <div class="bottom-line">
		            <a class="edit_member_a" style="color: #000000; font-weight: bold;">이름</a>
		            <input type="text" class="form-control" name="member_name" value="${selectInfo.member_name}" placeholder="김현우" required="" />
		        </div>
		        <div class="bottom-line">
		            <a class="edit_member_a" style="color: #000000; font-weight: bold;">이메일</a>
		            <a class="edit_member_a" style="color: #000000; font-weight: bold;"> *</a>
		            <input type="text" class="form-control" name="member_id" value="${selectInfo.member_id}" placeholder="ezen@gmail.com" required="" />
		        </div>
		        <div class="bottom-line2">
		            <a class="edit_member_a" style="color: #000000; font-weight: bold;">휴대폰 번호</a>
		            <a class="edit_member_a" style="color: #000000; font-weight: bold;"> *</a>
		            <input type="text" class="form-control" name="member_phon" value="${selectInfo.member_phon}" placeholder="010-0000-0000" required="" />
		        </div><br/>
			</div>
		
			 <div class="edit_member_box">
			    <h2 class="edit_title">추가 회원 정보</h2>
			    <div style="line-height:110%">
			        <div class="bottom-line">
			            <a class="edit_member_a" style="color: #000000; font-weight: bold;">기본 배송지</a>
			            <a class="edit_member_a" style="color: #000000; font-weight: bold;"> *</a>
			            <input type="text" class="form-control" name="member_zip" id="member_zip" value="${selectInfo.member_zip}" placeholder="경기도 광명시" required="" />
			        	<br/>
			        	<input type="button" class="btn btn-dark" style="width:20%;" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
			        </div>
			        <div class="bottom-line">
     			       	<br/>
			            <input type="text" class="form-control" name="member_addr" id="member_addr" value="${selectInfo.member_addr}" placeholder="경기도 광명시" required="" />
			        </div>
			        <div class="bottom-line2">
		        		<br/>
			            <input type="text" class="form-control" name="member_addr2" id="member_addr2" value="${selectInfo.member_addr2}" placeholder="경기도 광명시" required="" />
			        </div>
			        <input type="hidden" class="form-control"  id="sample6_extraAddress" placeholder="참고항목">
			    </div>
			  </div><br/>
			  
			  
	</div>	

	 
			  <!-- <div class="edit_member_box">
			    <h2 class="edit_title">계정 연동 정보</h2>
				    <div style="line-height:110%">
				        <div class="bottom-line">
				            <a href="#" class="google-btn" id="loginWithGoogle">
				                <svg version="1.0" xmlns="http://www.w3.org/2000/svg"  width="30" height="30" viewBox="0 0 300.000000 300.000000"  preserveAspectRatio="xMidYMid meet">
				                    <title>google 로고</title>
				                    <g transform="translate(37.5, 265) scale(0.075,-0.075)" fill="#ffffff" stroke="none">
				                        <path d="M1402 2790 c-559 -58 -1016 -462 -1144 -1012 -32 -135 -32 -421 0 -556 103 -445 431 -807 859 -950 143 -49 249 -65 413 -65 167 0 289 18 430 64 352 115 621 383 738 734 57 171 67 241 67 465 0 113 -3 213 -7 223 -7 16 -46 17 -618 17 l-610 0 0 -240 0 -240 351 0 352 0 -6 -37 c-4 -21 -25 -76 -48 -122 -79 -159 -228 -276 -425 -333 -67 -19 -102 -23 -224 -22 -130 0 -154 3 -225 27 -257 86 -442 278 -526 547 -33 106 -34 300 -1 413 79 274 273 474 542 558 108 34 312 34 420 0 94 -29 148 -57 229 -116 l64 -47 178 178 c99 99 178 183 176 189 -2 5 -42 39 -90 75 -97 74 -227 145 -335 184 -159 56 -388 83 -560 66z"/>
				                    </g>
				                </svg>
				            </a>
				            <a style="color: #000000; font-weight: bold;">구글 계정</a>
				            <input type="password" class="form-control" name="password" placeholder="연동" required="" disabled />
				        </div>
				        <div class="bottom-line">
				            <a href="#" class="kakao-btn" id="loginWithKakao">
				                <svg width="30" height="30" viewBox="0 0 29 30" fill="none" xmlns="http://www.w3.org/2000/svg" class="login-button__item__logo">
				                    <title>kakao 로고</title>
				                    <path fill-rule="evenodd" clip-rule="evenodd" d="M15 7C10.029 7 6 10.129 6 13.989C6 16.389 7.559 18.505 9.932 19.764L8.933 23.431C8.845 23.754 9.213 24.013 9.497 23.826L13.874 20.921C14.243 20.958 14.618 20.978 15 20.978C19.971 20.978 24 17.849 24 13.989C24 10.129 19.971 7 15 7Z" fill="black"></path>
				                </svg>
				            </a>
				            <a style="color: #000000; font-weight: bold;">카카오톡 계정</a>
				            <input type="password" class="form-control" name="password" placeholder="미연동" required="" disabled />            
				        </div>
				        <div class="bottom-line2">
				            <a href="#" class="naver-btn" id="loginWithNaver">
				                <svg version="1.0" xmlns="http://www.w3.org/2000/svg"  width="30" height="30" viewBox="0 0 168 168"  preserveAspectRatio="xMidYMid meet">
				                    <title>naver 로고</title>
				                    <g transform="translate(-1, 165) scale(0.050,-0.050)" fill="#ffffff" stroke="none">
				                      <path d="M800 1590 l0 -850 320 0 319 0 6 418 5 418 278 -407 c153 -224 292 -412 309 -419 36 -14 559 -10 597 4 21 8 26 175 26 848 l0 838 -320 0 -319 0 -6 -415 -5 -415 -280 414 -280 415 -325 0 -325 1 0 -850z"/>
				                    </g>
				                </svg>
				            </a>
				            <a style="color: #000000; font-weight: bold;">네이버 계정</a>
				            <input type="password" class="form-control" name="password" placeholder="미연동" required="" disabled />
				        </div>
				    </div>
			  </div> -->
			  
			  
		  		<br/>
			  <div class="form-group">
			    <h2 class="edit_title">수신 동의</h2>
			    <div style="line-height:110%">
			        <div class="bottom-line2">
			            <div class="form-group">
			                <input type="checkbox" id="member_check" value="${selectInfo.member_check}" name="member_check" class="check-box1">휴대폰 수신 동의
			                <input type="checkbox" id="member_smscheck" value="${selectInfo.member_smscheck}" name="member_smscheck" class="check-box1">이메일 수신 동의
			            </div>
			        </div>
			    </div>
			  </div>
			  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			  <button class="container btn btn-primary" type="submit">회원 정보 수정</button>
			  </form>
			  
			  
			   <!-- <ld style="font-size: 14px; color: #737373; font-weight: normal;">구독하기 서비스 이용 시,
			   <ld style="font-size: 18px; color: #737373; font-weight: normal;">매달 1일</ld>
			   </ld>
			   <button class="subscribe-btn" type="submit">구독하기</button>
			   <br/>
			   <ld style="font-size: 14px; color: #737373; font-weight: normal;">각종 혜택과 소식을 받아 보실 수 있습니다. (무료 서비스)</ld>
			   <br/><br/> -->
		   
	  
			<div class="Check-box-main">
			    <h2 class="edit_title">회원 탈퇴</h2>
			    <div style="line-height:80%">
		            <form action="./delete" method="post">
       					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<button class="container btn btn-primary" type="submit">회원 탈퇴 하기</button>
					</form>
			    </div>
			</div>
		    
		
		
		
			<div class="edit_member_box">
			    <h2 class="edit_title">판매자 등록
			        <ld style="font-size: 14px; color: #737373; font-weight: normal;">판매 상품 등록은 판매자 회원 전환 후 이용 가능합니다.
			        </ld> 
			    </h2>
		    </div>
			<form action="/lookst/partner/mypage" method="get">	
		    	<button class="container btn btn-primary"><a style="color: white;">판매자 등록하러 가기</a></button>
		    </form>
	    </div>

</div>

	<%@ include file="/WEB-INF/views/fix/footer.jsp"%>
</body>
</html>
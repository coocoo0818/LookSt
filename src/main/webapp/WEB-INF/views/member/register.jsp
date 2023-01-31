<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LookSt 회원가입</title>

<script src="https://www.google.com/recaptcha/api.js"></script>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

//이메일 정규표현식을 이용한 유효성 체크
function checkId(){
	$("#mail-Check-Btn").attr('disabled', true);
	$("#email_check").attr('disabled', true);
	$("#mail-Check-Btn2").attr('disabled', true);
	
	var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	// 검증에 사용할 정규식 변수 regExp에 저장
	if ((($('#email_id').val()+$('#email_host').val()).length) == 0) {
		$('#email_id').attr('class','form-control w-25 is-invalid');
		$('#email_host').attr('class','form-select');
		$('#email_feedback').attr('class','invalid-feedback');
		$('#email_feedback').css("display","inline-block");
		document.getElementById('email_feedback').innerHTML="필수 입력 항목입니다. 이메일을 입력해 주세요."
		document.getElementById("email_id").focus();
		return false;
	}
	if (($('#email_host').val()) == ""){
		if (regExp.test($('#email_id').val())) {
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			const member_id = $('#email_id').val();
			$.ajax({
				url:'./idCheck?member_id=' + member_id, //Controller에서 요청 받을 주소
				type:'post', //POST 방식으로 전달
				beforeSend : function(xhr){
					xhr.setRequestHeader(header, token);
				},
				success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다.
					if (cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 계정
						$('#email_id').attr('class','form-control w-25 is-valid');
						$('#email_host').attr('class','form-select');
						$('#email_feedback').attr('class','valid-feedback');
						$('#email_feedback').css("display","inline-block");
						document.getElementById('email_feedback').innerHTML="사용 가능한 이메일입니다. 이메일 인증을 진행해 주세요."
						$('#member_id').attr('value', ($('#email_id').val()));
						$("#mail-Check-Btn").attr('disabled', false);
						$("#email_check").attr('disabled', true);
						$("#mail-Check-Btn2").attr('disabled', true);
						return true;
					} else { //cnt가 1일 경우 -> 이미 존재하는 계정
						$('#email_id').attr('class','form-control w-25 is-invalid');
						$('#email_host').attr('class','form-select');
						$('#email_feedback').attr('class','invalid-feedback');
						$('#email_feedback').css("display","inline-block");
						document.getElementById('email_feedback').innerHTML="이미 사용하고 있는 이메일입니다."
						document.getElementById("email_id").focus();
						return false;
					}
				},
				/* error:function(){
					alert("에러");
				} */
			});
		}
		else {
			$('#email_id').attr('class','form-control w-25 is-invalid');
			$('#email_host').attr('class','form-select');
			$('#email_feedback').attr('class','invalid-feedback');
			$('#email_feedback').css("display","inline-block");
			document.getElementById('email_feedback').innerHTML="올바른 이메일을 입력해 주세요."
			document.getElementById("email_id").focus();
			return false;
		}
	}
	else {
		const member_id = $('#email_id').val()+$('#email_host').val();	//이메일 주소값 얻기
		if (regExp.test($('#email_id').val()+$('#email_host').val())){
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			$.ajax({
				url:'./idCheck?member_id=' + member_id, //Controller에서 요청 받을 주소
				type:'post', //POST 방식으로 전달
				beforeSend : function(xhr){
					xhr.setRequestHeader(header, token);
				},
				success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다.
					if (cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 계정
						$('#email_id').attr('class','form-control w-25');
						$('#email_host').attr('class','form-select is-valid');
						$('#email_feedback').attr('class','valid-feedback');
						$('#email_feedback').css("display","inline-block");
						document.getElementById('email_feedback').innerHTML="사용 가능한 이메일입니다. 이메일 인증을 진행해 주세요."
						$('#member_id').attr('value', ($('#email_id').val()+$('#email_host').val()));
						$("#mail-Check-Btn").attr('disabled', false);
						$("#email_check").attr('disabled', true);
						$("#mail-Check-Btn2").attr('disabled', true);
						return true;
					} else { //cnt가 1일 경우 -> 이미 존재하는 계정
						$('#email_id').attr('class','form-control w-25');
						$('#email_host').attr('class','form-select is-invalid');
						$('#email_feedback').attr('class','invalid-feedback');
						$('#email_feedback').css("display","inline-block");
						document.getElementById('email_feedback').innerHTML="이미 사용하고 있는 이메일입니다."
						document.getElementById("email_id").focus();
						return false
					}
				},
				/* error:function(){
					alert("에러");
				} */
			});
		}
		else {
			if (($('#email_id').val()) == "") {
				$('#email_id').attr('class','form-control w-25 is-invalid');
				$('#email_host').attr('class','form-select');
				$('#email_feedback').attr('class','invalid-feedback');
				$('#email_feedback').css("display","inline-block");
				document.getElementById('email_feedback').innerHTML="필수 입력 항목입니다. 이메일을 입력해 주세요."
				document.getElementById("email_id").focus();
				return false;
			}
			else {
				$('#email_id').attr('class','form-control w-25 is-invalid');
				$('#email_host').attr('class','form-select');
				$('#email_feedback').attr('class','invalid-feedback');
				$('#email_feedback').css("display","inline-block");
				document.getElementById('email_feedback').innerHTML="올바른 이메일을 입력해 주세요."
				document.getElementById("email_id").focus();
				return false;
			}
		}
	}
};

//비밀번호 체크
function checkPw(){
	var p1 = $('#member_pw').val();
	var p2 = $('#member_pw_re').val();
	var regExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,20}$/;
	
	if ((($('#member_pw').val()).length) == 0) {
		$('#member_pw').attr('class','form-control is-invalid');
		$('#member_pw_re').attr('class','form-control');
		$("#member_pw_re").attr('disabled', true);
		var input = document.getElementById('member_pw_re');
		input.value = null;
		$('#pw_feedback').attr('class','invalid-feedback');
		$('#pw_feedback').css('display',"inline-block");
		document.getElementById('pw_feedback').innerHTML="필수 입력 항목입니다. 비밀번호를 입력해 주세요."
		document.getElementById("member_pw").focus();
		return false;
	}
	if (!regExp.test($('#member_pw').val())) {
		$('#member_pw').attr('class','form-control is-invalid');
		$('#member_pw_re').attr('class','form-control');
		$("#member_pw_re").attr('disabled', true);
		var input = document.getElementById('member_pw_re');
		input.value = null;
		$('#pw_feedback').attr('class','invalid-feedback');
		$('#pw_feedback').css('display',"inline-block");
		document.getElementById('pw_feedback').innerHTML="올바른 비밀번호를 입력해 주세요."
		document.getElementById("member_pw").focus();
		return false;
	}
	else {
		$('#member_pw').attr('class','form-control is-valid');
		$('#member_pw_re').attr('class','form-control is-invalid');
		$("#member_pw_re").attr('disabled', false);
		$('#pw_feedback').attr('class','valid-feedback');
		$('#pw_feedback').css("display","inline-block");
		document.getElementById('pw_feedback').innerHTML="사용 가능한 비밀번호입니다. 비밀번호를 재입력해 주세요."

		if ((($('#member_pw_re').val()).length) != 0) {
			if (p1 != p2) {
				$('#member_pw').attr('class','form-control');
				$('#member_pw_re').attr('class','form-control is-invalid');
				$("#member_pw_re").attr('disabled', false);
				$('#pw_feedback').attr('class','invalid-feedback');
				$('#pw_feedback').css("display","inline-block");
				document.getElementById('pw_feedback').innerHTML="비밀번호가 일치하지 않습니다.";
				document.getElementById("member_pw_re").focus();
				return false;
			}
			else {
				$('#member_pw').attr('class','form-control');
				$('#member_pw_re').attr('class','form-control is-valid');
				$("#member_pw_re").attr('disabled', false);
				$('#pw_feedback').attr('class','valid-feedback');
				$('#pw_feedback').css("display","inline-block");
				document.getElementById('pw_feedback').innerHTML="비밀번호가 일치합니다."
				return true;
			}
		}
	}
};

//닉네임 체크
function checkNick(){
	var regExp = /^(?=.*[a-zA-Z0-9])(?=.*[a-zA-Z0-9])[a-zA-Z0-9._-]{6,16}$/;
	if ((($('#member_nick').val()).length) == 0) {
		$('#member_nick').attr('class','form-control is-invalid');
		$('#nick_feedback').attr('class','invalid-feedback');
		$('#nick_feedback').css('display',"inline-block");
		document.getElementById('nick_feedback').innerHTML="필수 입력 항목입니다. 닉네임을 입력해 주세요."
		document.getElementById("member_nick").focus();
		return false;
	}
	if (!regExp.test($('#member_nick').val())) {
		$('#member_nick').attr('class','form-control is-invalid');
		$('#nick_feedback').attr('class','invalid-feedback');
		$('#nick_feedback').css('display',"inline-block");
		document.getElementById('nick_feedback').innerHTML="올바른 닉네임을 입력해 주세요."
		document.getElementById("member_nick").focus();
		return false;
	}
	else {
		$('#member_nick').attr('class','form-control is-valid');
		$('#nick_feedback').attr('class','valid-feedback');
		$('#nick_feedback').css("display","inline-block");
		document.getElementById('nick_feedback').innerHTML="사용 가능한 닉네임입니다."
		return true;
	}
}

//이름 체크
function checkName(){
	var regExp = /^[가-힣]{2,10}$|[a-zA-Z-\s]{2,20}$/;
	if ((($('#member_name').val()).length) == 0) {
		$('#member_name').attr('class','form-control is-invalid');
		$('#name_feedback').attr('class','invalid-feedback');
		$('#name_feedback').css('display',"inline-block");
		document.getElementById('name_feedback').innerHTML="필수 입력 항목입니다. 이름을 입력해 주세요."
		document.getElementById("member_name").focus();
		return false;
	}
	if (!regExp.test($('#member_name').val())) {
		$('#member_name').attr('class','form-control is-invalid');
		$('#name_feedback').attr('class','invalid-feedback');
		$('#name_feedback').css('display',"inline-block");
		document.getElementById('name_feedback').innerHTML="올바른 이름을 입력해 주세요."
		document.getElementById("member_name").focus();
		return false;
	}
	else {
		$('#member_name').attr('class','form-control is-valid');
		$('#name_feedback').attr('class','valid-feedback');
		$('#name_feedback').css("display","inline-block");
		document.getElementById('name_feedback').innerHTML="사용 가능한 이름입니다."
		return false;
	}
}

//인증번호 발송 체크
function checkEmail() {
	var regIdCheck = $('#email_feedback').attr('class');
	
	if(regIdCheck != 'valid-feedback'){
		document.getElementById("email_id").focus();
		return false;
	}
	
	if(regIdCheck == 'valid-feedback'){
		const member_id = $('#member_id').val();
		
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		
		$.ajax({
			url:'./mailCheck?member_id=' + member_id,
			type:'post',
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success:function(data){
				code = data;
				$('#email_id').attr('class','form-control w-25');
				$('#email_host').attr('class','form-select is-valid');
				$('#email_feedback').attr('class','valid-feedback');
				$('#email_feedback').css("display","inline-block");
				document.getElementById('email_feedback').innerHTML="인증번호가 전송되었습니다."
				$("#mail-Check-Btn").attr('disabled', true);
				$("#email_check").attr('disabled', false);
				$("#mail-Check-Btn2").attr('disabled', false);
				document.getElementById("email_check").focus();
			},
/* 			error:function(){
				alert("에러");
			} */
		});
	}
}

//인증번호 체크
function checkCode(){
	const email_check = $('#email_check').val();

	if(email_check != code) {
		$('#email_feedback').attr('class','invalid-feedback');
		$('#email_feedback').css("display","inline-block");
		document.getElementById('email_feedback').innerHTML="인증번호가 일치하지 않습니다."
		document.getElementById("email_check").focus();
		return false;
	}
	
	if(email_check === code){
		$('#email_id').attr('class','form-control w-25');
		$('#email_host').attr('class','form-select is-valid');
		$('#email_feedback').attr('class','valid-feedback');
		$('#email_feedback').css("display","inline-block");
		document.getElementById('email_feedback').innerHTML="이메일 인증이 완료되었습니다."
		$("#mail-Check-Btn").attr('disabled', true);
		$("#email_check").attr('disabled', true);
		$("#mail-Check-Btn2").attr('disabled', true);
		return false;
	}
}

//회원가입 빈칸 체크
function registerSuccess() {
	var regIdCheck = $('#email_feedback').attr('class');
	var regPwCheck = $('#member_pw_re').attr('class');
	var regNickCheck = $('#nick_feedback').attr('class');
	var regNameCheck = $('#name_feedback').attr('class');
	var regCodeCheck = document.getElementById("email_feedback").innerHTML;
	
	if(regIdCheck != 'valid-feedback'){
		$('#email_id').attr('class','form-control w-25 is-invalid');
		$('#email_host').attr('class','form-select');
		$('#email_feedback').attr('class','invalid-feedback');
		$('#email_feedback').css("display","inline-block");
		document.getElementById('email_feedback').innerHTML="필수 입력 항목입니다. 이메일을 입력해 주세요."
		document.getElementById("email_id").focus();
		return false;
	}
	else if(regPwCheck != 'form-control is-valid'){
		$('#pw_feedback').attr('class','invalid-feedback');
		$('#pw_feedback').css('display',"inline-block");
		document.getElementById('pw_feedback').innerHTML="필수 입력 항목입니다. 비밀번호를 입력해 주세요."
		document.getElementById("member_pw").focus();
		return false;
	}
	else if(regNickCheck != 'valid-feedback'){
		$('#member_nick').attr('class','form-control is-invalid');
		$('#nick_feedback').attr('class','invalid-feedback');
		$('#nick_feedback').css('display',"inline-block");
		document.getElementById('nick_feedback').innerHTML="필수 입력 항목입니다. 닉네임을 입력해 주세요."
		document.getElementById("member_nick").focus();
		return false;
	}
	else if(regNameCheck != 'valid-feedback'){
		$('#member_name').attr('class','form-control is-invalid');
		$('#name_feedback').attr('class','invalid-feedback');
		$('#name_feedback').css('display',"inline-block");
		document.getElementById('name_feedback').innerHTML="필수 입력 항목입니다. 이름을 입력해 주세요."
		document.getElementById("member_name").focus();
		return false;
	}
	else if(regCodeCheck != '이메일 인증이 완료되었습니다.'){
		$('#email_feedback').attr('class','valid-feedback');
		$('#email_feedback').css("display","inline-block");
		document.getElementById('email_feedback').innerHTML="사용 가능한 이메일입니다. 이메일 인증을 진행해 주세요."
		document.getElementById("mail-Check-Btn").focus();
		document.getElementById("email_check").focus();
		return false;
	}
	else{
		document.getElementById('frm').submit();
	}
}
</script>

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
            $("#member_addr2").attr('disabled', false);
            document.getElementById("member_addr2").focus();
        }
    }).open();
}
</script>

</head>
<body>
	<%@ include file="/WEB-INF/views/fix/header.jsp"%>
	
	
	<div class="container w-75 mt-5 mb-5">
	<!-- Content here -->
		<form action="${contextPath}/member/register" method="post" id="frm">
			<div class="container w-75 pt-2">
				<h2 class="my-3 pt-5">회원가입
				</h2>
				<div class="form-group">
				  <fieldset>
					<label for="exampleInputEmail1" class="form-label mt-4">
				   	  	<a style="color:#000000; font-weight:bold;">이메일</a>
						<a style="color:#ff0000; font-weight:bold;">*</a>
					</label>
					<div class="input-group mb-2" style="height:50px;">
						<input type="hidden" name="member_id" id="member_id" value=""/>
						<input type="text" class="form-control w-25" name="email_id" id="email_id" placeholder="이메일을 입력해 주세요." onkeyup="checkId()" required/>
						<select class="form-select" name="email_host" id="email_host" onChange="checkId()">
							<option value="" selected>직접입력</option>
							<option value="@gmail.com">gmail.com</option>
							<option value="@naver.com">naver.com</option>
							<option value="@kakao.com">kakao.com</option>
							<option value="@daum.net">daum.net</option>
							<option value="@hanmail.net">hanmail.net</option>
						</select>
						<button type="button" class="btn btn-dark" style="width:20%; height:50px;" name="mail-Check-Btn" id="mail-Check-Btn" onclick="checkEmail()">인증번호 발송</button>
					</div>
					<div class="input-group" style="height:50px;">
						<input class="form-control" placeholder="인증번호 6자리를 입력해주세요." maxlength="6" name="email_check" id="email_check" disabled="true" />
						<button type="button" class="btn btn-dark" style="width:20%; height:50px;" name="mail-Check-Btn2" id="mail-Check-Btn2" onclick="checkCode()" disabled="true">인증확인</button>
					</div>
					<div class="invalid-feedback" id="email_feedback" style="margin-left:2px; display:none;"></div>
					<div class="valid-feedback" style="color:gray; margin-left:2px; display:inline-block;">로그인 시 사용할 이메일을 입력해 주세요.</div>
				  </fieldset>
				</div>
				
				<div class="form-group">
					<label for="exampleInputEmail1" class="form-label mt-4">
				   	  	<a style="color:#000000; font-weight:bold;">비밀번호</a>
						<a style="color:#ff0000; font-weight:bold;">*</a>
					</label>
					<div class="input-group">
				        <input type="password" class="form-control" name="member_pw" id="member_pw" placeholder="비밀번호를 입력해 주세요." onkeyup="checkPw()" required/>
				        <input type="password" class="form-control" name="member_pw_re" id="member_pw_re" placeholder="비밀번호를 재입력해 주세요." onkeyup="checkPw()" disabled="true" required/>
					</div>
					<div class="invalid-feedback" id="pw_feedback" style="margin-left:2px; display:none;"></div>
					<div class="valid-feedback" style="color:gray; margin-left:2px; display:inline-block;">비밀번호는 영문, 숫자, 특수문자로 조합하여 8-20자로 입력이 가능합니다.</div>
				</div>
		
				<div class="form-group">
					<label for="exampleInputEmail1" class="form-label mt-4">
				   	  	<a style="color:#000000; font-weight:bold;">닉네임</a>
						<a style="color:#ff0000; font-weight:bold;">*</a>
					</label>
					<div class="input-group">
						<input type="text" class="form-control" name="member_nick" id="member_nick" placeholder="닉네임을 입력해 주세요." onkeyup="checkNick()" required/>
					</div>
					<div class="invalid-feedback" id="nick_feedback" style="margin-left:2px; display:none;"></div>
					<div class="valid-feedback" style="color:gray; margin-left:2px; display:inline-block;">닉네임은 영문, 숫자, 밑줄, 마침표를 조합하여 6-16자로 입력이 가능합니다.</div>
				</div>
		
		
				<div class="form-group">
					<label for="exampleInputEmail1" class="form-label mt-4">
				   	  	<a style="color:#000000; font-weight:bold;">이름</a>
						<a style="color:#ff0000; font-weight:bold;">*</a>
					</label>
					<div class="input-group">
						<input type="text" class="form-control" name="member_name" id="member_name" placeholder="이름을 입력해 주세요." onkeyup="checkName()" required/>
					</div>
					<div class="invalid-feedback" id="name_feedback" style="margin-left:2px; display:none;"></div>
					<div class="valid-feedback" style="color:gray; margin-left:2px; display:inline-block;">이름은 한글 혹은 영문으로 입력이 가능합니다.</div>
				</div>
		
				<div class="form-group">
					<label for="exampleInputEmail1" class="form-label mt-4">
				   	  	<a style="color:#000000; font-weight:bold;">주소</a>
					</label>
					<div class="input-group pb-2">
				        <input type="text" class="form-control" name="member_zip" id="member_zip" placeholder="우편번호" disabled>
						<input type="button" class="btn btn-dark" style="width:20%;" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					</div>
					<div class="input-group">
						<input type="text" class="form-control" name="member_addr" id="member_addr" placeholder="주소" disabled><br>
						<input type="text" class="form-control" name="member_addr2" id="member_addr2" placeholder="상세주소" disabled="true">
					</div>
						<input type="hidden" class="form-control"  id="sample6_extraAddress" placeholder="참고항목">
				</div>
				
				<div class="form-group">
					<label for="exampleInputEmail1" class="form-label mt-4">
				   	  	<a style="color:#000000; font-weight:bold;">자동가입방지</a>
					</label>
					<div class="g-recaptcha" data-theme="light" data-sitekey="6Lc5wqIiAAAAAHHvvPeSElqbFFze4aEJZNTDXbme">
					</div>
				</div>
		
		     	<div class="form-group">
					<label for="exampleInputEmail1" class="form-label mt-4">
				   	  	<a style="color:#000000; font-weight:bold;">수신동의</a>
					</label>
				</div>
				<div class="form-check">
				  <input class="form-check-input" type="checkbox" value="True" name="member_check" id="member_check">
				  <label class="form-check-label" for="flexCheckDefault">
				    [선택] 문자메시지 광고성 정보 수신에 동의합니다.
				  </label>
				</div>
				<div class="form-check">
				  <input class="form-check-input" type="checkbox" value="True" name="member_smscheck" id="member_smscheck">
				  <label class="form-check-label" for="flexCheckChecked">
				    [선택] 이메일 광고성 정보 수신에 동의합니다.
				  </label>
				</div>
				<div class="d-grid gap-2 pt-4 pb-5 mb-5">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<input class="btn btn-primary" type="button" style="height:60px;" id="btn" value="가입하기" onclick="registerSuccess();"/>
				</div>
			</div>
		</form>
	</div>
	
	<%@ include file="/WEB-INF/views/fix/footer.jsp"%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LookSt 로그인</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
function login() {
	if((($('#member_id').val()).length) == 0) {
		$('#login_feedback').css("display","inline-block");
		$('#login_feedback2').css("display","none");
		document.getElementById('login_feedback').innerHTML="이메일을 입력해 주세요."
		return false;
	}
	if((($('#member_pw').val()).length) == 0) {
		$('#login_feedback').css("display","inline-block");
		$('#login_feedback2').css("display","none");
		document.getElementById('login_feedback').innerHTML="비밀번호를 입력해 주세요."
		return false;
	}
	else {
		var member_id = $('#member_id').val();
		var member_pw = $('#member_pw').val();
		var param = {"member_id":member_id, "member_pw":member_pw}
		$.ajax({
			url:'./loginCheck',
			type:'post',
			data:JSON.stringify(param),
			contentType: 'application/json',
			success:function(cnt){
				if (cnt == 0){
					$('#login_feedback').css("display","inline-block");
					$('#login_feedback2').css("display","inline-block");
					document.getElementById('login_feedback').innerHTML="이메일 또는 비밀번호를 잘못 입력했습니다."
					return false;
				}
				else {
					document.getElementById('frm').submit();
				}
			},
			/* error:function(){
				alert("에러");
			} */
		});
	}
};
</script>

</head>
<body>
	<%@ include file="/WEB-INF/views/fix/header.jsp"%>
	<form action="login" method="post" id="frm">
		<div class="container mt-5 mb-5">
			<div class="container" style="width: 500px;">
				<div class="container">
					<h1 class="card-header">로그인</h1>
					
					<div class="container">
						<div class="input-group">
							<div>
								<input type="text" class="form-control mb-2" name="member_id" id="member_id" placeholder="이메일 주소" required autofocus/>
								<input type="password" class="form-control" name="member_pw" id="member_pw" placeholder="비밀번호" required/>
							</div>
							<input type="button" class="btn btn-primary pl-3" id="btn" value="로그인" onclick="login()"></input>
						</div>
						
						<div class="input-group">
					          <input class="form-check-input" type="checkbox" id="rememberMe" name="rememberMe" class="check-box"> 아이디 저장
				        </div>
				        
						<div class="form-group">
							<div class="invalid-feedback" id="login_feedback" style="margin-left:2px; display:none;"></div>
							<div class="invalid-feedback" id="login_feedback2" style="margin-left:2px; display:none;">입력하신 내용을 다시 확인해주세요.</div>
						</div>
						
					</div>
			
   						
<!-- 				        <span class="signup">
				          <a href="signup_list.html" style="color: #aaaaaa;">회원가입</a>
				          <a style="color: #aaaaaa;">|</a>
				          <a href="#" style="color: #aaaaaa;">아이디 찾기</a>
				          <a style="color: #aaaaaa;">|</a>
				          <a href="#" style="color: #aaaaaa;">비밀번호 찾기</a>
				        </span>
				        <svg class="icon">
				          <use xlink:href="#icon-arrow-right"></use>
				        </svg> -->
			
			
			
			    
					
					
				</div>
	        </div>
		</div>
	</form>


	<%@ include file="/WEB-INF/views/fix/footer.jsp"%>
</body>
</html>

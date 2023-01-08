<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
 	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>쿠키를 이용한 팝업</title>
	<style type="text/css">
/* 		div#popup{
			position: absolute;
			top: 100px; left: 50px;
			color: yellow;
			width: 300px; height: 100px;
			background-color: gray;
		}
		div#popup > div {
			position: relative;
			background-color: #ffffff;
			top: 0px;
			border: 1px solid gray;
			padding: 10px;
			color: black;
		} */
	</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js" ></script>	
<script type="text/javascript">
		// 오늘 하루 다시 보지 않기
		// 쿠키생성
		function setCookie(name, value, expiredays) {			// 쿠키를 설정하는 setCookie()를 정의 
			var todayDate = new Date();							// Date(오늘 날짜로 생성)를 todayDate 함수로 선언
			todayDate.setDate(todayDate.getDate() + expiredays);	// todayDate에 Date를 가져와서 expiredays와 더한 값을 todayDate에 값을 할당하여 준다.
			/* console.log(todayDate) */
			document.cookie = name + "=" + value + "; path=/; expires=" + todayDate.toGMTString() + ";";
		}
			//쿠키 가져오기 
		
		function getCookie() {							// getcookie()를 먼저 정의
				var cookiedata = document.cookie;		// document.cookie를 cookiedata로 함수 선언!
				
				if (cookiedata.indexOf("noMoreToday=done") < 0){		// noMoreToday=done의 Index값이 0보다 작은 경우(없는경우)
					$("#lookStModal").modal('show');					// #lookStModal이라는 요소를 선택 모달을 보여줌
				}	
				else {
					$("#lookStModal").hide();			// 그렇지 않으면 숨김
				}
		}
			
			$(function() {
				getCookie();
				
				$('#btn_close').click(function(){
					$('#lookStModal').hide();
				})
				
				$(".btn_today_close").click(function(){
					setCookie("noMoreToday", "done", 1);		// name = noMoreToday, value = done, expiredays = 1 
					$("#lookStModal").hide();
				});
			});
</script>
</head>
<body>
	<!-- 모달#1 콘텐츠 -->
	<div class = "modal" id = "lookStModal" tabindex = "-1" aria-labelledby="exampleModalLabel" aria-hidden="true" role="dialog" style="display: inline-block;">
		<div class = "modal-dialog modal-dialog-centered">
			<div class="modal-content" style="width: auto;">
				<div class="modal-body p-0">
					<a href=""> <img alt="" src="${contextPath}/resources/img/post/modal.jpg" style="width : 500px"></a>
				</div>
				<div class="p-1 px-2 text-bg-dark d-flex">
					<a href="javascript:;" class="btn btn-secondary btn_today_close" data-bs-dismiss="modal">오늘 하루 보지 않기</a>
					<button type="button" class="btn btn-primary ms-auto" id="btn_close" data-bs-dismiss="modal">닫기</button>
				</div>
			</div>	
		</div>
	</div>
</body>
</html>

























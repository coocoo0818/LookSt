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
		function setCookie(name, value, expiredays) {
			var todayDate = new Date();
			todayDate.setDate(todayDate.getDate() + expiredays);
			document.cookie = name + "=" + value + "; path=/; expires=" + todayDate.toGMTString() + ";";
		}
			//쿠키 가져오기 
		
		function getCookie() {
				var cookiedata = document.cookie;
				
				if (cookiedata.indexOf("noMoreToday=done") < 0){
					$("#lookStModal").modal('show');
				}
				else {
					$("#lookStModal").hide();
				}
		}
			
			$(function() {
				getCookie();
				
				$('#btn_close').click(function(){
					$('#lookStModal').hide();
				})
				
				$(".btn_today_close").click(function(){
					setCookie("noMoreToday", "done", 1);
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
					<a href=""> <img alt="" src="${contextPath}/resources/img/post/modal.jpg"></a>
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

























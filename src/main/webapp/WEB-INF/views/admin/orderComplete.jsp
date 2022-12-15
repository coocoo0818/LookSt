<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Complete</title>
<meta name="viewport" content="width=device-width">
<link rel="stylesheet" href="${contextPath}/resources/admin/css/orderComplete.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
</head>
<body>
	<%@ include file="/WEB-INF/views/fix/header.jsp"%>
	<div class="container">
		<h2 id="orderpagetitle" class="disply-2 text-center py-4 m-5">주문 완료</h2>
		<!-- <div class="wrap"> -->
			<div class="card mx-auto m-5">
		      <svg width="54" height="54" viewBox="0 0 54 54" fill="none" xmlns="http://www.w3.org/2000/svg">
		  <path d="M12.1651 47.4414H17.7463C18.302 47.4414 18.6886 47.5863 19.0752 47.9728L23.0617 51.9346C25.7919 54.6885 28.2081 54.6885 30.9624 51.9346L34.9248 47.9728C35.3356 47.5863 35.7221 47.4414 36.2537 47.4414H41.8349C45.7248 47.4414 47.4403 45.7262 47.4403 41.8369V36.2567C47.4403 35.7011 47.6094 35.3146 47.996 34.928L51.9342 30.9421C54.6886 28.2124 54.6886 25.7967 51.9342 23.0428L47.996 19.081C47.6094 18.6704 47.4403 18.2839 47.4403 17.7524V12.1721C47.4403 8.28285 45.749 6.5677 41.8349 6.5677H36.2537C35.7221 6.5677 35.3356 6.42276 34.9248 6.01209L30.9624 2.07449C28.2081 -0.703563 25.7919 -0.679406 23.0376 2.07449L19.0752 6.01209C18.6886 6.3986 18.302 6.5677 17.7463 6.5677H12.1651C8.27517 6.5677 6.55973 8.25869 6.55973 12.1721V17.7524C6.55973 18.2839 6.3906 18.6704 6.02819 19.081L2.06577 23.0428C-0.688591 25.7967 -0.688591 28.2124 2.06577 30.9421L6.02819 34.928C6.3906 35.3146 6.55973 35.7011 6.55973 36.2567V41.8369C6.55973 45.7262 8.27517 47.4414 12.1651 47.4414ZM24.3664 38.6724C23.7141 38.6724 23.2309 38.4308 22.7235 37.8027L16.1758 29.9275C15.8859 29.5652 15.7168 29.1304 15.7168 28.6955C15.7168 27.85 16.3691 27.1736 17.2148 27.1736C17.7463 27.1736 18.157 27.3669 18.6161 27.9467L24.2698 34.928L35.3839 17.3417C35.7463 16.7861 36.2295 16.4962 36.7369 16.4962C37.5342 16.4962 38.2832 17.076 38.2832 17.9215C38.2832 18.308 38.0658 18.7428 37.8483 19.1052L25.8886 37.8027C25.502 38.3825 24.9946 38.6724 24.3664 38.6724Z" fill="#268DFF"/>
		  </svg>
		      <strong>결제 완료</strong>
		      <span>결제해주셔서 감사합니다.</span>
		      <button class="btn btn-primary" onclick="location.href='${contextPath}/post/productList?kind=T'">쇼핑 계속하기</button>
		      <button class="btn" onclick="location.href='${contextPath}/'">홈으로</button>
		    </div>
		 <!--  </div> -->
		</div>

	<!-- 리스트 -->
	<%@ include file="/WEB-INF/views/fix/footer.jsp"%>
	<script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
</body>
</html>
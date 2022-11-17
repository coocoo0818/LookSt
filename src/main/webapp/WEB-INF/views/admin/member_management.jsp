<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member management</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
<meta name="viewport" content="width=device-width">
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css"> -->
<link rel="stylesheet"
	href="${contextPath}/resources/admin/css/member_management.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.authModify').click(function() {
			let member_id = $(this).parent().attr("data-memberid") // <li>태그는 <button>의 부모임.
			let index = $(this).parent().attr("data-index")
			let auth = document.getElementById("auth_auth"+index).value;

			$.ajax({
				type : 'post',
				url : '${contextPath}/admin/authModify',
				data : {
						member_id : member_id,
						auth : auth
				},
				success : function(data) {
					alert("회원권한이 수정되었습니다.")
					location.reload()
				},
				error : function() {alert("error")}		//에러가 발생했을 때 호출될 함수
			})
		})
		
		$('.kickOut').click(function() {
			let member_id = $(this).parent().attr("data-memberid") // <li>태그는 <button>의 부모임.

			$.ajax({
				type : 'post',
				url : '${contextPath}/admin/memberKickOut',
				data : {
						member_id : member_id
				},
				success : function(data) {
					alert("탈퇴시켰습니다.")
					location.reload()
				},
				error : function() {alert("error")}		//에러가 발생했을 때 호출될 함수
			})
		})
	})
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/fix/adminheader.jsp"%>

	<!-- 리스트 -->

	<div class="container">
		<h2 id="orderpagetitle" class="disply-2 text-center py-4">MEMBER
			MANAGEMENT</h2>
		<!--  -->
		<div class="row py-3">
			<div class="col mt-1">
				<select id="inputState" class="form-select form-select-md">
					<option selected>전체</option>
					<option value="1">아이디</option>
					<option value="2">이름</option>
					<option value="3">권한</option>
				</select>
			</div>
			<form class="d-flex col-md-9 mt-1">
				<input class="form-control form-control me-1" type="text"
					placeholder="Search" style="float: right;">
				<button class="btn btn-secondary" type="submit">
					<i class="d-flex fa fa-search"></i>
				</button>
			</form>
		</div>
		<!--  -->

		<form name="form" class="frm" action="${contextPath}/admin/authModify"
			method="post">
			<table class="responsive-table">
				<%-- <caption>Top 10 Grossing Animated Films of All Time</caption> --%>
				<thead>
					<tr>
					<tr class="table-dark">
						<th scope="col">프로필</th>
						<th scope="col">id</th>
						<th scope="col">이름</th>
						<th scope="col">가입일</th>
						<th scope="col">최근 접속일</th>
						<th scope="col">권한</th>
						<th scope="col">관리</th>
					</tr>


				</thead>
				<tfoot>
					<!-- <tr>
        <td colspan="7">Sources: <a href="http://en.wikipedia.org/wiki/List_of_highest-grossing_animated_films" rel="external">Wikipedia</a> &amp; <a href="http://www.boxofficemojo.com/genres/chart/?id=animation.htm" rel="external">Box Office Mojo</a>. Data is current as of March 31, 2021.</td>
      </tr> -->
				</tfoot>
				<tbody>
					<c:forEach var="member_management" items="${member_management}" varStatus="status">
						<tr class="table-primary">
							<th class="text-center" scope="row"><img class="rounded-circle profile-result" src="${contextPath}/resources/fix/img/${member_management.profile_img}" alt="" /></th>
								<td class="text-center" data-title="profile">
									<a href="#" id="member_id${status.index}" name="member_id">${member_management.member_id}</a>
								</td>
							<td class="text-center" data-title="name"">${member_management.member_name}</td>
							<td class="text-center" data-title="since" data-type="currency"><fmt:formatDate value="${member_management.member_since}" pattern="yyyy-MM-dd" type="date" /></td>
							<td class="text-center" data-title="update-date" data-type="currency"><fmt:formatDate value="${member_management.member_updt}" pattern="yyyy-MM-dd" type="date" /></td>
							<td class="text-center auth" data-title="Auth" data-type="currency">
								<select class="form-select form-select-sm" aria-label=".form-select-sm example" id="auth_auth${status.index}">
									<option value="member" <c:if test="${member_management.mem_auth_auth eq 'member'}">disabled='disabled' selected='selected' style='color: red;'</c:if>>member<c:if test="${member_management.mem_auth_auth eq 'member'}"> 🍊 </c:if></option>
									<option value="seller" <c:if test="${member_management.mem_auth_auth eq 'seller'}">disabled='disabled' selected='selected' style='color: red;'</c:if>>seller<c:if test="${member_management.mem_auth_auth eq 'seller'}"> 🍊 </c:if></option>
									<option value="admin" <c:if test="${member_management.mem_auth_auth eq 'admin'}">disabled='disabled' selected='selected' style='color: red;'</c:if>>admin<c:if test="${member_management.mem_auth_auth eq 'admin'}"> 🍊 </c:if></option>
								</select>
							</td>
							<td class="text-center" data-title="button" data-type="currency" data-memberid="${member_management.member_id}" data-auth="${member_management.mem_auth_auth}" data-index="${status.index}">
								<input class="btn btn-outline-primary btn-sm authModify" tabindex="-1" role="button" type="button" value="수정" id="authModify"/> 
								<input class="btn btn-outline-danger btn-sm kickOut" tabindex="-1" role="button" type="button" value="삭제" id="kickOut"/>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>
		<!--  -->
		<ul class="pagination" style="justify-content: center;">
			<li class="page-item disabled"><a class="page-link" href="#">&laquo;</a>
			</li>
			<li class="page-item active"><a class="page-link" href="#">1</a>
			</li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#">4</a></li>
			<li class="page-item"><a class="page-link" href="#">5</a></li>
			<li class="page-item"><a class="page-link" href="#">&raquo;</a>
			</li>
		</ul>
		<!--  -->
	</div>
	<!-- 리스트 -->

	<script
		src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<%@ include file="/WEB-INF/views/fix/footer.jsp"%>
</body>
</html>
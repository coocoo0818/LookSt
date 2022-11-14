<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member management</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"
	type="text/javascript"></script>
<meta name="viewport" content="width=device-width">
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css"> -->
<link rel="stylesheet"
	href="${contextPath}/resources/admin/css/member_management.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
</head>
<body>
	<%@ include file="/WEB-INF/views/fix/adminheader.jsp"%>

	<!-- 리스트 -->

	<div class="container">
		<h2 id="orderpagetitle" class="disply-2 text-center py-4">SELLER REQUEST</h2>
		<!--  -->
		<div class="row py-3">
			<div class="col mt-1">
				<select id="inputState" class="form-select form-select-md">
					<option selected>전체</option>
					<option value="1">번호</option>
					<option value="2">회사명</option>
					<option value="3">사업자번호</option>
					<option value="4">신청인</option>
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

		<table class="responsive-table">
			<%-- <caption>Top 10 Grossing Animated Films of All Time</caption> --%>
			<thead>
				<tr>
				<tr class="table-dark">
					<th scope="col">순번</th>
					<th scope="col">회사명</th>
					<th scope="col">사업자번호</th>
					<th scope="col">신청인</th>
					<th scope="col">관리</th>
				</tr>
			</thead>
			<tfoot>
				<!-- <tr>
        <td colspan="7">Sources: <a href="http://en.wikipedia.org/wiki/List_of_highest-grossing_animated_films" rel="external">Wikipedia</a> &amp; <a href="http://www.boxofficemojo.com/genres/chart/?id=animation.htm" rel="external">Box Office Mojo</a>. Data is current as of March 31, 2021.</td>
      </tr> -->
			</tfoot>
			<tbody>
				<tr class="table-primary">
					<th class="text-center" scope="row">1</th>
					<td class="text-center" data-title="profile">이젠아카데미</td>
					<td class="text-center" data-title="name">444-2222-1112</td>
					<td class="text-center" data-title="since" data-type="currency">김현민</td>
					<td class="text-center" data-title="button" data-type="currency">
						<input class="btn btn-outline-primary btn-sm" tabindex="-1"
						role="button" type="button" value="수락" /> <input
						class="btn btn-outline-danger btn-sm" tabindex="-1" role="button"
						type="button" value="거부" />
					</td>
				</tr>
				<tr class="table-primary">
					<th class="text-center" scope="row">2</th>
					<td class="text-center" data-title="profile">이젠아카데미</td>
					<td class="text-center" data-title="name">444-2222-1112</td>
					<td class="text-center" data-title="since" data-type="currency">김현민</td>
					<td class="text-center" data-title="button" data-type="currency">
						<input class="btn btn-outline-primary btn-sm" tabindex="-1"
						role="button" type="button" value="수락" /> <input
						class="btn btn-outline-danger btn-sm" tabindex="-1" role="button"
						type="button" value="거부" />
					</td>
				</tr>
				<tr class="table-primary">
					<th class="text-center" scope="row">3</th>
					<td class="text-center" data-title="profile">이젠아카데미</td>
					<td class="text-center" data-title="name">444-2222-1112</td>
					<td class="text-center" data-title="since" data-type="currency">김현민</td>
					<td class="text-center" data-title="button" data-type="currency">
						<input class="btn btn-outline-primary btn-sm" tabindex="-1"
						role="button" type="button" value="수락" /> <input
						class="btn btn-outline-danger btn-sm" tabindex="-1" role="button"
						type="button" value="거부" />
					</td>
				</tr>
				<tr class="table-primary">
					<th class="text-center" scope="row">4</th>
					<td class="text-center" data-title="profile">이젠아카데미</td>
					<td class="text-center" data-title="name">444-2222-1112</td>
					<td class="text-center" data-title="since" data-type="currency">김현민</td>
					<td class="text-center" data-title="button" data-type="currency">
						<input class="btn btn-outline-primary btn-sm" tabindex="-1"
						role="button" type="button" value="수락" /> <input
						class="btn btn-outline-danger btn-sm" tabindex="-1" role="button"
						type="button" value="거부" />
					</td>
				</tr>
				<tr class="table-primary">
					<th class="text-center" scope="row">5</th>
					<td class="text-center" data-title="profile">이젠아카데미</td>
					<td class="text-center" data-title="name">444-2222-1112</td>
					<td class="text-center" data-title="since" data-type="currency">김현민</td>
					<td class="text-center" data-title="button" data-type="currency">
						<input class="btn btn-outline-primary btn-sm" tabindex="-1"
						role="button" type="button" value="수락" /> <input
						class="btn btn-outline-danger btn-sm" tabindex="-1" role="button"
						type="button" value="거부" />
					</td>
				</tr>
				<tr class="table-primary">
					<th class="text-center" scope="row">6</th>
					<td class="text-center" data-title="profile">이젠아카데미</td>
					<td class="text-center" data-title="name">444-2222-1112</td>
					<td class="text-center" data-title="since" data-type="currency">김현민</td>
					<td class="text-center" data-title="button" data-type="currency">
						<input class="btn btn-outline-primary btn-sm" tabindex="-1"
						role="button" type="button" value="수락" /> <input
						class="btn btn-outline-danger btn-sm" tabindex="-1" role="button"
						type="button" value="거부" />
					</td>
				</tr>
				<tr class="table-primary">
					<th class="text-center" scope="row">7</th>
					<td class="text-center" data-title="profile">이젠아카데미</td>
					<td class="text-center" data-title="name">444-2222-1112</td>
					<td class="text-center" data-title="since" data-type="currency">김현민</td>
					<td class="text-center" data-title="button" data-type="currency">
						<input class="btn btn-outline-primary btn-sm" tabindex="-1"
						role="button" type="button" value="수락" /> <input
						class="btn btn-outline-danger btn-sm" tabindex="-1" role="button"
						type="button" value="거부" />
					</td>
				</tr>
				<tr class="table-primary">
					<th class="text-center" scope="row">8</th>
					<td class="text-center" data-title="profile">이젠아카데미</td>
					<td class="text-center" data-title="name">444-2222-1112</td>
					<td class="text-center" data-title="since" data-type="currency">김현민</td>
					<td class="text-center" data-title="button" data-type="currency">
						<input class="btn btn-outline-primary btn-sm" tabindex="-1"
						role="button" type="button" value="수락" /> <input
						class="btn btn-outline-danger btn-sm" tabindex="-1" role="button"
						type="button" value="거부" />
					</td>
				</tr>
				<tr class="table-primary">
					<th class="text-center" scope="row">9</th>
					<td class="text-center" data-title="profile">이젠아카데미</td>
					<td class="text-center" data-title="name">444-2222-1112</td>
					<td class="text-center" data-title="since" data-type="currency">김현민</td>
					<td class="text-center" data-title="button" data-type="currency">
						<input class="btn btn-outline-primary btn-sm" tabindex="-1"
						role="button" type="button" value="수락" /> <input
						class="btn btn-outline-danger btn-sm" tabindex="-1" role="button"
						type="button" value="거부" />
					</td>
				</tr>
				<tr class="table-primary">
					<th class="text-center" scope="row">10</th>
					<td class="text-center" data-title="profile">이젠아카데미</td>
					<td class="text-center" data-title="name">444-2222-1112</td>
					<td class="text-center" data-title="since" data-type="currency">김현민</td>
					<td class="text-center" data-title="button" data-type="currency">
						<input class="btn btn-outline-primary btn-sm" tabindex="-1"
						role="button" type="button" value="수락" /> <input
						class="btn btn-outline-danger btn-sm" tabindex="-1" role="button"
						type="button" value="거부" />
					</td>
				</tr>
			</tbody>
		</table>
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

	<script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<%@ include file="/WEB-INF/views/fix/footer.jsp"%>
</body>
</html>
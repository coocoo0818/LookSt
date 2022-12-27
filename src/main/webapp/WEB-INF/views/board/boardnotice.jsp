<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Lookst</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
@media (min-width: 768px)
.container, .container-md, .container-sm {
    max-width: none !important;
}

@media (max-width: 360px){
	.div_1, .search-form, .search-input, .navbar {width:100%;}
	.search-form {margin-bottom:50px;}
	.search-option {margin-bottom:10px;}
}

* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
	font-family: "Noto Sans KR", sans = serif;
}

.hover {
  display: inline-block;
  transition: .3s;
  -webkit-transform: scale(1);
  transform: scale(1);
}
.hover:hover {
  -webkit-transform: scale(1.1);
  transform: scale(1.1);
}


a {
	text-decoration: none !important;
	color: black;
}


button, input {
	border: none;
	outline: none;
}

.board-container {
	width: 60%;
	height: 1200px;
	margin: 0 auto;
}

.search-container {
	background-color: rgb(253, 253, 250);
	width: 100%;
	height: 110px;
	border: 1px solid #ddd;
	margin-top: 10px;
	margin-bottom: 30px;
	display: flex;
	justify-content: center;
	align-items: center;
}

table {
	border-collapse: collapse;
	width: 100%;
	border-top: 2px solid rgb(39, 39, 39);
}

tr:nth-child(even) {
	background-color: #f0f0f070;
}

th, td {
	width: 300px;
	padding: 10px 12px;
	border-bottom: 1px solid #ddd;
}

td {
	color: rgb(53, 53, 53);
}

li{ list-style: none;}

.no {
	width: 150px;
}

.title {
	width: 50%;
}

td.title {
	text-align: left;
}

td.writer {
	text-align: left;
}

td.viewcnt {
	text-align: center;
}

td.title:hover {
	text-decoration: underline;
}

/* .paging {
	color: black;
	width: 110%;
	align-items: center;
}

.page {
	color: black;
	padding: 6px;
	margin-right: 10px;
}

.paging-container {
	width: 110%;
	height: 70px;
	display: flex;
	margin-top: 50px;
	margin: auto;
} */

.btn_write {
	background-color: rgb(236, 236, 236);
	border: none;
	color: black;
	padding: 6px 12px;
	font-size: 16px;
	cursor: pointer;
	border-radius: 5px;
	margin-left: 30px;
}

.btn_write::hover {
	text-decoration: underline;
}

.search-form {
	height: 37px;
	display: flex;
	flex-wrap: wrap;
}

.search-option {
	width: 100px;
	height: 100%;
	outline: none;
	margin-right: 5px;
	border: 1px solid #ccc;
	color: gray;
}

.search-input {
	color: gray;
	background-color: white;
	border: 1px solid #ccc;
	height: 100%;
	width: 300px;
	font-size: 15px;
	padding: 5px 7px;
}

.search-input::placeholder {
	color: gray;
}

.search-button {
	width: 20%;
	height: 100%;
	background-color: rgb(22, 22, 22);
	color: rgb(209, 209, 209);
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 15px;
}

.search-button::hover {
	color: rgb(165, 165, 165);
}

.div_1{
	display: flex;
}

</style>
</head>
<body>
	<script type="text/javascript">
		let msg = "${msg}"
		if (msg == "DEL_OK")
			alert("성공적으로 삭제되었습니다.")
		if (msg == "DEL_ERR")
			alert("삭제되었거나 없는 게시물입니다.")
		if (msg == "WRT_OK")
			alert("성공적으로 등록되었습니다.")
		if (msg == "MOD_OK")
			alert("성공적으로 수정되었습니다.")
	</script>
	<%@ include file="/WEB-INF/views/fix/header.jsp"%>
	<div class="container">
		<div class="row justify-content-md-center">
			<h2 class="col-auto my-5">공지사항</h2>
			<div class="tab-content" id="pills-tabContent">
				<div class="tab-pane fade show active my-5" id="pills-home"
					role="tabpanel" aria-labelledby="pills-home-tab">
					     <li class="notice1">
					     <a class="hover"  href="${contextPath}/board/list">Q&A &nbsp;</a>
					     <a class="hover"  href="${contextPath}/board/list/notice" style="font-weight: 900; font-size: x-large;">NOTICE &nbsp;</a>
					     <a class="hover"  href="${contextPath}/board/list/faq">FAQ &nbsp;&nbsp;</a>
					     

					     </li>
					<!-- QNA -->
					<nav class="navbar navbar-expand-md navbar-dark "
						style="float: right;">
						<form action="<c:url value="/board/list/notice" />" class="search-form"
							method="get">
							<select class="search-option" name="option">
								<option value="A"
									${prN.sc.option=='A' || prN.sc.option=='' ? "selected" : "" }>제목
									+ 내용</option>
								<option value="T" ${prN.sc.option=='T' ? "selected" : "" }>제목</option>
							</select> 
						<div class="div_1">
							<input type="text" name="keyword" class="search-input"
								value="${param.keyword }" placeholder="검색어를 입력해 주세요."> <input
								type="submit" class="search-button" value="검색">
						</div>		
						</form>
					</nav>
					<table>
						<tr>
							<th class="no">번호</th>
							<th class="title">제목</th>
							<th class="writer">이름</th>
							<th class="regdate">등록일</th>
						</tr>
						<c:forEach var="boardDtoN" items="${list2 }">
							<tr>
								<td class="no">${boardDtoN.board_no }</td>
								<td class="title"><a
									href="<c:url value="/board/read/notice${prN.sc.queryString }&board_no=${boardDtoN.board_no }" />">
										${boardDtoN.board_title } </a></td>
								<td class="writer">${boardDtoN.member_id }</td>
								<%--                   <c:choose> --%>
								<td class="regdate"><fmt:formatDate
										value="${boardDtoN.board_date }" pattern="yyyy-MM-dd"
										type="date" /></td>
							</tr>
						</c:forEach>
					</table>
					<br>
				<nav aria-label="Page navigation example">
				  <ul class="pagination justify-content-center">
				    <li class="page-item disabled">
							<c:if test="${totalCntN == null || totalCntN == 0}">
								<div>게시물이 없습니다.</div>
							</c:if>
							<c:if test="${totalCntN != null || totalCntN != 0}">
								<c:if test="${prN.showPrev }">
									<li class="page-item"><a class="page-link" href="<c:url value="/board/list/notice${prN.sc.getQueryString(pr.beginPage-1) }" />"> &lt; </a></li>
								</c:if>
								<c:forEach var="i" begin="${prN.beginPage }" end="${prN.endPage }">
									<li class="page-item"><a class="page-link" href="<c:url value="/board/list/notice${prN.sc.getQueryString(i) }" />">${i }</a>
								</c:forEach>
								<c:if test="${prN.showNext }">
									<li class="page-item"><a class="page-link" href="<c:url value="/board/list/notice${prN.sc.getQueryString(pr.endPage+1) }" />">
										&gt; </a>
								</c:if>
							</c:if>
						</li>
					</ul>
				</nav>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/fix/footer.jsp"%>
</body>
</html>



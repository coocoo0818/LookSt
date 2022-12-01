<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style type="text/css">



* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
	font-family: "Noto Sans KR", sans = serif;
}

a {
	text-decoration: none !important;
	color: black;
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

/* td.viewcnt {
	text-align: center;
}
 */
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
</style>
<title>lookst</title>
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
			<h2 class="col-auto my-5">REVIEW</h2>
			<div class="tab-content" id="pills-tabContent">
				<div class="tab-pane fade show active my-5" id="pills-home"
					role="tabpanel" aria-labelledby="pills-home-tab">
						<nav class="navbar navbar-expand-md navbar-dark "
							style="float: right;">
							<form action="<c:url value="/board/review" />"
								class="search-form" method="get">
								<select class="search-option" name="option"
									style="margin-right: 2%">
									<option value="A"
										${prR.sc.option=='A' || prR.sc.option=='' ? "selected" : "" }>제목
										+ 내용</option>
									<option value="T" ${prR.sc.option=='T' ? "selected" : "" }>제목</option>
									<option value="W" ${prR.sc.option=='W' ? "selected" : "" }>작성자</option>
								</select> <input type="text" name="keyword" class="search-input"
									value="${param.keyword }" placeholder="검색어를 입력해 주세요.">
								<input type="submit" class="search-button" value="검색">
							</form>
						</nav>
					</form>
					<table>
						<tr>
							<th class="no">번호</th>
							<th class="title">제목</th>
							<th class="writer">이름</th>
							<th class="regdate">등록일</th>
							<th class="viewcnt">조회수</th>
						</tr>
						<c:forEach var="boardDtoR" items="${list4 }">
							<tr>
								<td class=board_no>${boardDtoR.board_no }</td>
								<td class="board_title"><a
									href="<c:url value="/board/read/review${prR.sc.queryString }&board_no=${boardDtoR.board_no }" />">
										${boardDtoR.board_title } </a></td>
								<td class="member_id">${boardDtoR.member_id }</td>
								<%--                   <c:choose> --%>
								<td class="board_date"><fmt:formatDate
										value="${boardDtoR.board_date }" pattern="yyyy-MM-dd"
										type="date" /></td>
								<td class="board_views ">${boardDtoR.board_views }</td>
							</tr>
						</c:forEach>
					</table>
					<nav class=" mt-5 mb-5" aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
							<li class="page-item disabled"><c:if
									test="${totalCntR == null || totalCntR == 0}">
									<div>게시물이 없습니다.</div>
								</c:if> <c:if test="${totalCntR != null || totalCntR != 0}">
									<c:if test="${prR.showPrev }">
										<li class="page-item"><a class="page-link"
											href="<c:url value="/board/review${prR.sc.getQueryString(pr.beginPage-1) }" />">
												&lt; </a></li>
									</c:if>
									<c:forEach var="i" begin="${prR.beginPage }"
										end="${prR.endPage }">
										<li class="page-item"><a class="page-link"
											href="<c:url value="/board/review${prR.sc.getQueryString(i) }" />">${i }</a>
									</c:forEach>
									<c:if test="${prR.showNext }">
										<li class="page-item"><a class="page-link"
											href="<c:url value="/board/review${prR.sc.getQueryString(pr.endPage+1) }" />">
												&gt; </a>
									</c:if>
								</c:if></li>
						</ul>
					</nav>
				</div>
<iuput type="submit" class="btn btn-primary mt-5 mb-5"
						style="float:right;"
						onclick="location.href='<c:url value="/board/review/write" />' ">
					<i class="fa fa-pen"></i>submit
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/fix/footer.jsp"%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member management</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
<meta name="viewport" content="width=device-width">
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css"> -->
<link rel="stylesheet" href="${contextPath}/resources/admin/css/member_management.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
</head>
<body>
	<%@ include file="/WEB-INF/views/fix/adminheader.jsp"%>

	<!-- 리스트 -->

	<div class="container">
		<h2 id="orderpagetitle" class="disply-2 text-center py-4">MAGAZIN REQUEST</h2>
		<!-- 검색 시작 -->
		<div>
			<form class="d-flex row py-3" action="${contextPath}/admin/magazin_request/" method="get">
				<div class="col mt-1">
					<select id="inputState" class="form-select form-select-md" name="option">
						<option selected>전체</option>
						<option value="T" ${pr.sc.option=='I' || pr.sc.option=='' ? "selected" : ""}>글제목</option>
						<option value="W" ${pr.sc.option=='N'? "selected" : ""}>작성자</option>
						<option value="N" ${pr.sc.option=='A'? "selected" : ""}>게시글번호</option>
					</select>
				</div>
				<div class="d-flex col-md-9 mt-1">
					<input class="form-control form-control me-1" type="text" placeholder="Search" style="float: right;" name="keyword" value="${param.keywork}" >
					<button class="btn btn-secondary" type="submit"><i class="d-flex fa fa-search"></i></button>
				</div>
			</form>
		</div>
		<!-- 검색 끝 -->

		<table class="responsive-table">
			<%-- <caption>Top 10 Grossing Animated Films of All Time</caption> --%>
			<thead>
				<tr class="table-dark">
					<th scope="col">글번호</th>
					<th scope="col">글제목</th>
					<th scope="col">작성자</th>
					<th scope="col">작성일</th>
					<th scope="col">관리</th>
				</tr>
			</thead>
			<tfoot>
				<!-- <tr>
        <td colspan="7">Sources: <a href="http://en.wikipedia.org/wiki/List_of_highest-grossing_animated_films" rel="external">Wikipedia</a> &amp; <a href="http://www.boxofficemojo.com/genres/chart/?id=animation.htm" rel="external">Box Office Mojo</a>. Data is current as of March 31, 2021.</td>
      </tr> -->
			</tfoot>
			<tbody>
				<c:forEach var="magazin_management" items="${magazin_management}">
					<tr class="table-primary">
						<th class="text-center" scope="row">${magazin_management.NBoardDto.board_no}</th>
						<td class="text-center" data-title="글제목">
							<a href="http://en.wikipedia.org/wiki/Avatar_(2009_film)">${magazin_management.NBoardDto.board_title}</a>
						</td>
						<td class="text-center" data-title="작성자">${magazin_management.member_name}</td>
						<td class="text-center" data-title="작성일" data-type="currency"><fmt:formatDate value="${magazin_management.NBoardDto.board_date}" pattern="yyyy-MM-dd" type="date" /></td>
						<td class="text-center" data-title="관리" data-type="currency">
							<input class="btn btn-outline-primary btn-sm rounded" tabindex="-1" role="button" type="button" value="게시" /> 
							<input class="btn btn-outline-danger btn-sm rounded" tabindex="-1" role="button" type="button" value="거부" />
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<!-- 페이지 시작 -->
		<ul class="pagination" style="justify-content: center;">
			<c:if test="${totalCnt == null || totalCnt == 0}">
				<div>게시물이 없습니다.</div>
			</c:if>
			<c:if test="${totalCnt != null || totalCnt != 0}">
				<c:if test="${pr.showPrev}">
					<li class="page-item disabled"><a class="page-link" href="${contextPath}/admin/magazin_request${pr.sc.getQueryString(pr.beginPage-1)}">&laquo;</a></li>
				</c:if>
				
				<c:forEach var="i" begin="${pr.beginPage}" end="${pr.endPage}">

					<c:if test="${pr.sc.page == i }">
						<c:if test="${pr.sc.page > 0 }">
							<li class="page-item active"><a class="page-link" href="${contextPath}/admin/magazin_request${pr.sc.getQueryString(i)}">${i}</a></li>
						</c:if>
					</c:if>
					<c:if test="${pr.sc.page != i }">
						<c:if test="${pr.sc.page > 0 }">
							<li class="page-item"><a class="page-link" href="${contextPath}/admin/magazin_request${pr.sc.getQueryString(i)}">${i}</a></li>
						</c:if>
					</c:if>
				</c:forEach>
				
				<c:if test="${pr.showNext}">
					<li class="page-item"><a class="page-link" href="${contextPath}/admin/magazin_request${pr.sc.getQueryString(pr.endPage+1)}">&raquo;</a></li>
				</c:if>
				
			</c:if>
		</ul>
		<!-- 페이지 끝  -->
	</div>
	<!-- 리스트 -->

	<script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<%@ include file="/WEB-INF/views/fix/footer.jsp"%>
</body>
</html>
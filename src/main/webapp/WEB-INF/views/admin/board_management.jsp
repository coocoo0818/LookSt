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
<script type="text/javascript">
	$(document).ready(function() {
		let page = ${pr.sc.page}
		let pageSize = ${pr.sc.pageSize}
		
		$('.boardModify').click(function() {
			let board_no = $(this).parent().prev().prev().prev().prev().prev().prev().attr("data-boardNo") // <li>태그는 <button>의 부모임.
			let index = $(this).parent().attr("data-index")
			let board_type = document.getElementById("board_type"+index).value;
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			
			$.ajax({
				type : 'post',
				url : '${contextPath}/admin/boardModify',
				data : {
						board_no : board_no,
						board_type : board_type
				},
				beforeSend : function(xhr){
					xhr.setRequestHeader(header, token);
				},
				success : function(data) {
					alert("게시글 상태가 수정되었습니다.")
					location.reload()
				},
				error : function() {alert("error")}		//에러가 발생했을 때 호출될 함수
			})
		})
		
		$('.boardDelete').click(function() {
			let board_no = $(this).parent().prev().prev().prev().prev().prev().prev().attr("data-boardNo") // <li>태그는 <button>의 부모임.
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			
			$.ajax({
				type : 'post',
				url : '${contextPath}/admin/boardDelete',
				data : {
						board_no : board_no
				},
				beforeSend : function(xhr){
					xhr.setRequestHeader(header, token);
				},
				success : function(data) {
					alert("게시글 삭제했습니다.")
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
		<h2 id="orderpagetitle" class="disply-2 text-center py-4">BOARD MANAGEMENT</h2>
		<!-- 검색 시작 -->
		<div>
			<form class="d-flex row py-3" action="${contextPath}/admin/board_management/" method="get">
				<div class="col mt-1">
					<select id="inputState" class="form-select form-select-md" name="option">
						<option selected>전체</option>
						<option value="N" ${pr.sc.option=='N' || pr.sc.option=='' ? "selected" : ""}>글번호</option>
						<option value="T" ${pr.sc.option=='T'? "selected" : ""}>글제목</option>
						<option value="W" ${pr.sc.option=='W'? "selected" : ""}>작성자</option>
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
					<th scope="col">게시글종류</th>
					<th scope="col">작성일</th>
					<th scope="col">상태</th>
					<th scope="col">관리</th>
				</tr>
			</thead>
			<tfoot>
				<!-- <tr>
        <td colspan="7">Sources: <a href="http://en.wikipedia.org/wiki/List_of_highest-grossing_animated_films" rel="external">Wikipedia</a> &amp; <a href="http://www.boxofficemojo.com/genres/chart/?id=animation.htm" rel="external">Box Office Mojo</a>. Data is current as of March 31, 2021.</td>
      </tr> -->
			</tfoot>
			<tbody>
				<c:forEach var="board_management" items="${board_management}" varStatus="status">
					<tr class="table-primary">
						<th class="text-center" scope="row" data-boardNo="${board_management.NBoardDto.board_no}">${board_management.NBoardDto.board_no}</th>
						<td class="text-center" data-title="글제목">
							<a href="http://en.wikipedia.org/wiki/Avatar_(2009_film)">${board_management.NBoardDto.board_title}</a>
						</td>
						<td class="text-center" data-title="작성자">${board_management.member_name}</td>
						<td class="text-center" data-title="글종류" data-type="currency">
							<c:if test="${board_management.NBoardDto.board_kind eq 'N'}">공지사항</c:if>
							<c:if test="${board_management.NBoardDto.board_kind eq 'I'}">문의사항</c:if>
							<c:if test="${board_management.NBoardDto.board_kind eq 'M'}">MAGAZIN</c:if>
							<c:if test="${board_management.NBoardDto.board_kind eq 'F'}">FAQ</c:if>
							<c:if test="${board_management.NBoardDto.board_kind eq 'R'}">REVIEW</c:if>
							<c:if test="${board_management.NBoardDto.board_kind eq 'Q'}">Q&A</c:if>
						</td>
						<td class="text-center" data-title="작성일" data-type="currency">
							<fmt:formatDate value="${board_management.NBoardDto.board_date}" pattern="yyyy-MM-dd" type="date" />
						</td>
						<td class="text-center" data-title="글상태" data-type="currency">
							<select class="form-select form-select-sm" aria-label=".form-select-sm example" name="관리" id="board_type${status.index}">
					        	<c:if test="${board_management.NBoardDto.board_type eq 'Y'}">
					        		<option value="Y" ${board_management.NBoardDto.board_type=='Y'? "selected" : ""} disabled="disabled" selected="selected" style="color: red;">공개 🍊 </option>
					        		<option value="N" ${board_management.NBoardDto.board_type=='N'? "selected" : ""}>비공개</option>
					        	</c:if>
								<c:if test="${board_management.NBoardDto.board_type eq 'N'}">
									<option value="Y" ${board_management.NBoardDto.board_type=='Y'? "selected" : ""}>공개</option>
					        		<option value="N" ${board_management.NBoardDto.board_type=='N'? "selected" : ""} disabled="disabled" selected="selected" style="color: red;">비공개 🍊 </option>
								</c:if>
							</select>
						</td>
						<td class="text-center" data-title="관리" data-type="currency" data-index="${status.index}">
							<input class="btn btn-outline-primary btn-sm rounded boardModify" tabindex="-1" role="button" type="button" value="수정" /> 
							<input class="btn btn-outline-danger btn-sm rounded boardDelete" tabindex="-1" role="button" type="button" value="삭제" />
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
					<li class="page-item disabled"><a class="page-link" href="${contextPath}/admin/board_management${pr.sc.getQueryString(pr.beginPage-1)}">&laquo;</a></li>
				</c:if>
				
				<c:forEach var="i" begin="${pr.beginPage}" end="${pr.endPage}">

					<c:if test="${pr.sc.page == i }">
						<c:if test="${pr.sc.page > 0 }">
							<li class="page-item active"><a class="page-link" href="${contextPath}/admin/board_management${pr.sc.getQueryString(i)}">${i}</a></li>
						</c:if>
					</c:if>
					<c:if test="${pr.sc.page != i }">
						<c:if test="${pr.sc.page > 0 }">
							<li class="page-item"><a class="page-link" href="${contextPath}/admin/board_management${pr.sc.getQueryString(i)}">${i}</a></li>
						</c:if>
					</c:if>
				</c:forEach>
				
				<c:if test="${pr.showNext}">
					<li class="page-item"><a class="page-link" href="${contextPath}/admin/board_management${pr.sc.getQueryString(pr.endPage+1)}">&raquo;</a></li>
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
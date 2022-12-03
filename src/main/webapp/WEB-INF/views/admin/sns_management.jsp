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
		$('.postDelete').click(function() {
			let post_no = $(this).parent().parent().prev("span").attr("data-postNo") // <li>태그는 <button>의 부모임.
			$.ajax({
				type : 'post',
				url : '${contextPath}/admin/postDelete',
				data : {
					post_no : post_no
				},
				success : function(data) {
					alert("포스트가 삭제되었습니다.")
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
		<h2 id="orderpagetitle" class="disply-2 text-center py-4">SNS MANAGEMENT</h2>
		<!-- 검색 시작 -->
		<div>
			<form class="d-flex row py-3" action="${contextPath}/admin/sns_management/" method="get">
				<div class="col mt-1">
					<select id="inputState" class="form-select form-select-md" name="option">
						<option selected>전체</option>
						<option value="I" ${pr.sc.option=='I' || pr.sc.option=='' ? "selected" : ""}>아이디</option>
						<option value="N" ${pr.sc.option=='N'? "selected" : ""}>이름</option>
						<option value="A" ${pr.sc.option=='A'? "selected" : ""}>SNS번호</option>
					</select>
				</div>
				<div class="d-flex col-md-9 mt-1">
					<input class="form-control form-control me-1" type="text" placeholder="Search" style="float: right;" name="keyword" value="${param.keywork}" >
					<button class="btn btn-secondary" type="submit"><i class="d-flex fa fa-search"></i></button>
				</div>
			</form>
		</div>
		<!-- 검색 끝 -->

		<!-- sns 리스트 시작 -->
		<div class="row row-cols-1 row-cols-md-5 g-3">
			<c:forEach var="member_management" items="${member_management}">
				<div class="col">
					<div class="card border-0">
						<img src="${contextPath}/resources/img/post/${member_management.post_imgDto.post_img_img}" class="card-img-top rounded position-relative" onclick="location.href='${contextPath}/post/mylist'">
						<span class="position-absolute badge rounded-pill bg-light m-1" data-postNo="${member_management.NPostDto.post_no}">No.${member_management.NPostDto.post_no}</span>
						<div class="card-body">
							<div class="row justify-content-start d-flex">
								<div class="col-3">
									<img class="rounded-circle" style="width: 40px; height: 40px;" src="${contextPath}/resources/img/profile/${member_management.profile_img}" onclick="location.href='./'" id="profile_img">
								</div>
								<div class="col-6 my-auto" onclick="location.href='${contextPath}/sns/personalPost/?member_id=${member_management.member_id}'">${member_management.member_nick}</div>
								<button class="col-3 btn btn-outline-danger btn-sm rounded postDelete" id="postDelete">삭제</button>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<!-- sns 리스트 끝 -->

		<!-- 페이지 시작 -->
		<ul class="pagination" style="justify-content: center;">
			<c:if test="${totalCnt == null || totalCnt == 0}">
				<div>게시물이 없습니다.</div>
			</c:if>
			<c:if test="${totalCnt != null || totalCnt != 0}">
				<c:if test="${pr.showPrev}">
					<li class="page-item disabled"><a class="page-link" href="${contextPath}/admin/sns_management${pr.sc.getQueryString(pr.beginPage-1)}">&laquo;</a></li>
				</c:if>
				
				<c:forEach var="i" begin="${pr.beginPage}" end="${pr.endPage}">

					<c:if test="${pr.sc.page == i }">
						<c:if test="${pr.sc.page > 0 }">
							<li class="page-item active"><a class="page-link" href="${contextPath}/admin/sns_management${pr.sc.getQueryString(i)}">${i}</a></li>
						</c:if>
					</c:if>
					<c:if test="${pr.sc.page != i }">
						<c:if test="${pr.sc.page > 0 }">
							<li class="page-item"><a class="page-link" href="${contextPath}/admin/sns_management${pr.sc.getQueryString(i)}">${i}</a></li>
						</c:if>
					</c:if>
				</c:forEach>
				
				<c:if test="${pr.showNext}">
					<li class="page-item"><a class="page-link" href="${contextPath}/admin/sns_management${pr.sc.getQueryString(pr.endPage+1)}">&raquo;</a></li>
				</c:if>
				
			</c:if>
		</ul>
		<!-- 페이지 끝  -->
	</div>
	<!-- 메인 끝 -->

	<script	src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<%@ include file="/WEB-INF/views/fix/footer.jsp"%>
</body>
</html>
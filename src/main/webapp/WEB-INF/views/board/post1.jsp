<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<title>lookst</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/fix/header.jsp"%>
	<script type="text/javascript">
      $(document).ready(function() {   /* main() */
         $("#listBtn").on("click", function() {
            location.href = "<c:url value='/board/list/notice${searchItem.queryString}' />";
         })
 }
         

         
  
    </script>
	<!-- tab 1 contents -->
	<div class="tab-pane fade show active py-5" id="v-pills-tab01"
		role="tabpanel" aria-labelledby="v-pills-tab01-tab">
		<div class="container">
			<div class="row justify-content-md-center">
				<h2 class="col-auto my-5">공지사항</h2>
				<hr class="my-4">
				<h4 class="card-title row justify-content-md-center">${boardDto.board_title }</h4>
				<small class="card-subtitle mb-2 mt-3 row justify-content-md-center">${boardDto.member_id } - ${boardDto.reg_date()} </small>
				<hr class="my-4">
				<!-- 본문 영역 -->
				<div class="px-4 py-2">
					<p>${boardDto.board_con }</p>
				</div>
			</div>
			<hr class="my-4">
		 			
		<div class="table project-table table-centered table-nowrap table-hover mb-4">
			<div class="fs-6 w-90">
				<ul class="row border-2 border-bottom py-2">


				</ul>
			</div>
		</div>

			<div class="row mx-auto col-md-4">
				<button type="button" class="btn btn-outline-primary my-3 mt-5 mb-5"
					onclick="history.back(-1)">목록</button>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/fix/footer.jsp"%>
</body>
</html>
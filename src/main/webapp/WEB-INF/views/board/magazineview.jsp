<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="loginId" value="${sessionScope.res }" />
<c:set var="loginout" value="${loginId==null ? 'Login' : 'Logout' }" />
<c:set var="loginoutlink"
	value="${loginId==null ? '/login/login' : '/login/logout' }" />


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://rawgit.com/LeshikJanz/libraries/master/Bootstrap/baguetteBox.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<meta charset="UTF-8">
<title>lookst</title>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<style type="text/css">
.container.gallery-container {
	background-color: #fff;
	color: #35373a;
	min-height: 50vh;
	padding: 30px 50px;
}

.gallery-container h1 {
	text-align: center;
	margin-top: 50px;
	font-family: 'Droid Sans', sans-serif;
	font-weight: bold;
}

.gallery-container p.page-description {
	text-align: center;
	margin: 25px auto;
	font-size: 18px;
	color: #999;
}

.tz-gallery {
	padding: 40px;
}

/* Override bootstrap column paddings */
.tz-gallery .row>div {
	padding: 2px;
}

.tz-gallery .lightbox img {
	width: 100%;
	border-radius: 0;
	position: relative;
}

@media ( max-width : 768px) {
	body {
		padding: 0;
	}
}

/*밑단 설명 CSS*/
div {
	word-break: break-all;
}

img {
	max-width: 100%;
}
td {
	
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/fix/header.jsp"%>
	<script type="text/javascript">
   	$(document).ready(function() {   /* main() */
        
   	 $("#modifyBtn").on("click", function() {
         let form = $("#form")
         form.attr("action", "<c:url value='/board/magazine/modify${searchItem.queryString}&board_no=${boardDto.board_no}' />")
         form.attr("method", "post")
         if (formCheck())
            form.submit();
      })	
   	
      $("#removeBtn").on("click", function() {
            if(!confirm("정말로 삭제하시겠습니까?")) return;
            let form = $("#form")
            form.attr("action","<c:url value='/board/magazine/remove${searchItem.queryString}&board_no=${boardDto.board_no}'/>")
            form.attr("method", "post")
            form.submit()
         })
   		
   		
         
      // let bno = 307
      let board_no = $("input[name=board_no]").val();
      
      $("#modBtn").click(function() {
         // showList(bno)

         let comment_no = $(this).attr("data-comment_no")
         let comment_con = $("textarea[name=comment_con]").val();

         if(comment_con.trim() == '') { 
            alert("댓글을 입력해주세요.")
            $("textarea[name=comment_con]").focus()
            return
         }
         

      })
      
      $("#commentList").on("click", ".modBtn", function() { // commentList 안에 있는 modBtn 버튼에다가 클릭이벤트를 등록해야함.
          // alert("댓글수정 버튼 클릭됨")
          let board_no = ${boardDto.board_no }
          alert(board_no)
          let comment_no = $(this).data("comment_no") // comment_no의 데이터를 가져옴
		  let comment_con = $("textarea[name=comment_con]").val();
		  //let comment_con = $("span.comment_con", $(this).parent()).text() // 클릭된 수정버튼의 부모(li)의 span 태그의 텍스트만 가져옴.
         
         // 1. comment의 내용을 input에 출력해주기 
         $("textarea[name=comment_con]").val(comment_con)
         // 2. cno 전달하기 
         $("#modBtn").attr("data-comment_no", comment_no)

		  $.ajax({
			  type : 'PATCH' // 요청 메서드
			  , url : '/lookst/comments/'+comment_no // 요청 URI
			  , headers : { "content-type" : "application/json" } // 요청 헤더
			  , data : JSON.stringify({comment_no:comment_no, comment_con:comment_con}) // 서버로 전송할 데이터. stringify()로 직렬화 필요.
			  , success : function(result) { // 서버로부터 응답이 도착하면 호출될 함수
				  alert(result)
				  showList(board_no)
			  }
			  , error : function() { alert("error") } // 에러가 발생했을 때, 호출될 함수
		  })
      })
      
      $("#insertBtn").click(function() {
         alert("댓글입력이벤트")
         
         let comment_con = $("textarea[name=comment_con]").val();
         
         if(comment_con == '') { 
            alert("댓글을 입력해주세요.")
            $("textarea[name=comment_con]").focus()
            return
         }
         
         $.ajax({
            type : 'post' // 요청 메서드
            , url : '/lookst/comments?board_no='+board_no // 요청 URI
            , headers : { "content-type" : "application/json" } // 요청 헤더
            , data : JSON.stringify({board_no:board_no, comment_con:comment_con}) // 서버로 전송할 데이터. stringify()로 직렬화 필요.
            , beforeSend : function(xhr){
            	xhr.setRequestHeader(($("meta[name='_csrf_header']").attr("content")), ($("meta[name='_csrf']").attr("content")));
            }
            , success : function(result) { // 서버로부터 응답이 도착하면 호출될 함수 
                  alert(result)
                  showList(board_no)
            }
            , error : function() { alert("error") } // 에러가 발생했을 때, 호출될 함수 
         })
      })
      
      $("#commentList").on("click", ".delBtn", function() { // commentList 안에 있는 delBtn 버튼에다가 클릭이벤트를 등록해야함.
         // alert("삭제 버튼 클릭됨")
		  let board_no = ${boardDto.board_no };
		  let comment_no = $(this).data("comment_no") ;
         
         $.ajax({
            type : 'DELETE' // 요청 메서드
            , url :   '/lookst/comments/'+comment_no+'?board_no='+board_no // 요청 URI
            , success : function(result) { // 서버로부터 응답이 도착하면 호출될 함수 
                  alert(result)
                  showList(board_no)
            }
            , error : function() { alert("error") } // 에러가 발생했을 때 호출될 함수 
         })
      })
      
      
      let showList = function(board_no) {
         $.ajax({
            type : 'GET' // 요청 메서드'
            , url : '/lookst/comments?board_no=' + board_no // 요청 URI
            , success : function(result) { // 서버로부터 응답이 도착하면 호출될 함수 
                  $("#commentList").html(toHtml(result)) // result는 서버가 전송한 데이터 
            }
            , error : function() { alert("error") } // 에러가 발생할 때 호출될 함수 
         })
      }
      
      showList(board_no)
      
      let toHtml = function(comments) {
         let tmp = "<ul style='display: block;'>"
                   
         comments.forEach(function(comment_con) {
            tmp += '<li style="color:black; width: 100%;  list-style:none;" data-comment_no='+comment_con.comment_no
            tmp += ' data-board_no='+comment_con.board_no
/*          tmp += ' data-pcno='+comment_con.pcno+'>'*/
			tmp += ' <span class="member_id">'+comment_con.member_id+'</span>'
            tmp += ' : <span class="comment_con">'+comment_con.comment_con+'</span><br/>'
            tmp += ' <span class>'+comment_con.comment_date+'</span> <br/>'
            tmp += ' <button type="button"  class="modBtn btn btn-outline-primary btn-sm mt-2 mb-2" data-comment_no='+comment_con.comment_no+'>수정</button>'
            tmp += ' <button type="button"  class="delBtn btn btn-outline-danger btn-sm mt-2 mb-2" data-comment_no='+comment_con.comment_no+'>삭제</button>'
            tmp += '</li>'
         })
         
         return tmp += "</ul>"
      }
      
   })  
         
  
</script>
	<script type="text/javascript">
      let msg = "${msg}"
      if(msg == "WRT_ERR") alert("게시물 등록에 실패하였습니다. 다시 시도해주세요.")
      if(msg == "MOD_ERR") alert("게시물 수정에 실패하였습니다. 다시 시도해주세요.")
   </script>
	<div class="container gallery-container">
		<div class="text-center">
			<h2 class="my-5">
				<a href="${contextPath}/board/magazine"
					style="text-decoration: none;">MAGAZINE
			</h2>
		</div>
		<input type="hidden" name="board_no" value="${boardDto.board_no }">
		<div class="tz-gallery">
			<div class="row">
				<c:forEach var="list" items="${images}">
					<div class="col-sm-6 col-md-4">
						<a class="lightbox" href="${list}"> <img src="${list}">
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<div class="container mt-3">
		<div class="">
			<div class="span12">
				<h3 class="mt-3 mb-5">${boardDto.board_title }</h3>
				<p>${boardDto.board_con }</p>
			</div>
		</div>
		<!-- Comments Form -->
		<div class="card my-4">
			<h5 class="card-header">Leave a Comment:</h5>
			<div class="card-body">
				<form name="comment-form">
					<div class="form-group">
						<textarea name="comment_con" class="form-control" rows="3"></textarea>
						<button class="btn btn-primary mt-3 mb-2" id="insertBtn"
							type="button">작성</button>
						<br />
						<h4 class="text-center mt-2 mb-5">COMMENTS</h4>
						<div id="commentList"></div>
					</div>

				</form>
			</div>
		</div>
		<form id="form" class="frm" action="" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<c:if test="${boardDto.member_id eq loginId }">
				<button type="button" id="modifyBtn" class="btn btn-outline-primary">
					<a
						href="/lookst/board/magazine/modify?board_no=${boardDto.board_no}">수정</a>
				</button>
				<button type="button" id="removeBtn" class="btn btn-outline-danger">삭제</button>
			</c:if>
		</form>
		<div class="container">
			<div class="table project-table table-centered table-nowrap table-hover mb-4">
				<table class="table sm_list_01 mt-2 mb-2">
					<tbody class=" justify-content-center">
						<tr>
							<th scope="row" class="text-left" style="width: 16.66%;">이전 페이지</th>
							<td class="pre text-left" id="lastTitle"><c:if test="${moveM.last != null}">
									<a style="text-decoration: none; color: black;" href="<c:url value="/board/read/magazine?board_no=${moveM.last}"/>">${moveM.lastTitle}</a>
								</c:if> <c:if test="${moveM.last == 0}">
									<div class="fs-6">이전글이 없습니다.</div>
								</c:if></td>
						</tr>
						<tr>
							<th scope="row" class="text-left">다음 페이지</th>
							<td class="next text-left " id="nextTitle"><c:if
									test="${moveM.next != null}">
									<a style="text-decoration: none; color: black;"
										href="<c:url value="/board/read/magazine?board_no=${moveM.next}"/>">${moveM.nextTitle}</a>
								</c:if> <c:if test="${moveM.next == 0}">
									<div class="fs-6">다음글이 없습니다.</div>
								</c:if></td>
						</tr>
					</tbody>
				</table>
				<div class="row mx-auto col-md-4">
					<button type="button"
						class="btn btn-outline-primary my-3 mt-5 mb-5"
						onclick="location.href='/lookst/board/magazine' ">목록</button>
				</div>
			</div>
		</div>
	</div>

		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.8.1/baguetteBox.min.js"></script>
		<script>
		baguetteBox.run('.tz-gallery');
	</script>
		<%@ include file="/WEB-INF/views/fix/footer.jsp"%>
</body>
</html>
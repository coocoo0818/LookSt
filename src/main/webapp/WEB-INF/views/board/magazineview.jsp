<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://rawgit.com/LeshikJanz/libraries/master/Bootstrap/baguetteBox.min.css">
	
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

a:hover {
	-ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=50)";
	/* IE 8 */
	filter: alpha(opacity = 50); /* IE7 */
	opacity: 0.6;
	text-decoration: none;
}

/* Page Header */
.page-header {
	margin: -30px 0px 0px;
	padding: 20px 40px;
}

.page-header h3 {
	line-height: 0.88rem;
}

/* Thumbnail Box */
.caption {
	height: 140px;
	width: 100%;
	margin: 20px 0px;
	padding: 20px;
	box-sizing: border-box;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
}

.caption .span4, .caption .span8 {
	padding: 0px 20px;
}

.caption .span4 {
	border-right: 1px dotted #CCCCCC;
}

.caption h3 {
	line-height: 2rem;
	margin: 0 0 20px;
	text-transform: uppercase;
}

.caption p {
	font-size: 1rem;
	line-height: 1.6rem;
}

.btn.btn-mini {
	background: #a83b3b;
	border-radius: 0 0 0 0;
	font-size: 0.63rem;
	text-shadow: none !important;
}

.carousel-control {
	top: 33%;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/fix/header.jsp"%>
<script type="text/javascript">
   	$(document).ready(function() {   /* main() */
        
         
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
      
      $("#commentList").on("click", ".modBtn", function() { // commentList 안에 있는 modBtn 버튼에다가 클릭이벤트를 등록해야함.
         // alert("댓글수정 버튼 클릭됨")
         let board_no = ${boardDto.board_no }
         alert(board_no)
         let comment_no = $(this).parent().attr("data-comment_no") // <li>태그는 <button>의 부모임.
         let comment_con = $("span.comment_con", $(this).parent()).text() // 클릭된 수정버튼의 부모(li)의 span 태그의 텍스트만 가져옴.
         
         // 1. comment의 내용을 input에 출력해주기 
         $("textarea[name=comment_con]").val(comment_con)
         // 2. cno 전달하기 
         $("#modBtn").attr("data-comment_no", comment_no)
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
            , success : function(result) { // 서버로부터 응답이 도착하면 호출될 함수 
                  alert(result)
                  showList(board_no)
            }
            , error : function() { alert("error") } // 에러가 발생했을 때, 호출될 함수 
         })
      })
      
      $("#commentList").on("click", ".delBtn", function() { // commentList 안에 있는 delBtn 버튼에다가 클릭이벤트를 등록해야함.
         // alert("삭제 버튼 클릭됨")
         let comment_no = $(this).parent().attr("data-comment_no") // <li>태그는 <button>의 부모임.
         let board_no = $(this).parent().attr("data-board_no") // attr 중 사용자 정의 attr를 선택함.
         
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
            type : 'GET' // 요청 메서드
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
            tmp += '<li style="background-color: #f9f9fa; border-bottom: 1px solid rgb(235,236,239); color:black; width: 100%;" data-comment_no='+comment_con.commnet_no
            tmp += ' data-board_no='+comment_con.board_no
/*          tmp += ' data-pcno='+comment_con.pcno+'>'*/
			tmp += ' member_id=<span class="member_id">'+comment_con.member_id+'</span>'
            tmp += ' comment_con=<span class="comment_con">'+comment_con.comment_con+'</span>'
            tmp += ' <button class="delBtn">삭제</button>'
            tmp += ' <button class="modBtn">수정</button>'
            tmp += '</li>'
         })
         
         return tmp += "</ul>"
      }
      
   })  
         
  
</script>

	<div class="container gallery-container">

		<div class="text-center">
			<h2 class="my-5">MAGAZINE</h2>
		</div>
		<input type="hidden" name="board_no" value="${boardDto.board_no }"> 
		<div class="tz-gallery">
			<div class="row">
				<div class="col-sm-12 col-md-4
                    ">
					<a class="lightbox"
						href="${pageContext.request.contextPath }/resources/board/img/magazine1.jpg">
						<img
						src="${pageContext.request.contextPath }/resources/board/img/magazine1.jpg"
						alt="Bridge">
					</a>
				</div>
				<div class="col-sm-6 col-md-4">
					<a class="lightbox"
						href="${pageContext.request.contextPath }/resources/board/img/magazine2.jpg">
						<img
						src="${pageContext.request.contextPath }/resources/board/img/magazine2.jpg"
						alt="Park">
					</a>
				</div>
				<div class="col-sm-6 col-md-4">
					<a class="lightbox"
						href="${pageContext.request.contextPath }/resources/board/img/magazine3.jpg">
						<img
						src="${pageContext.request.contextPath }/resources/board/img/magazine3.jpg"
						alt="Tunnel">
					</a>
				</div>
				<div class="col-sm-12 col-md-4">
					<a class="lightbox"
						href="${pageContext.request.contextPath }/resources/board/img/magazine4.jpg">
						<img
						src="${pageContext.request.contextPath }/resources/board/img/magazine4.jpg"
						alt="Traffic">
					</a>
				</div>
				<div class="col-sm-6 col-md-4">
					<a class="lightbox"
						href="${pageContext.request.contextPath }/resources/board/img/magazine5.jpg">
						<img
						src="${pageContext.request.contextPath }/resources/board/img/magazine5.jpg"
						alt="Coast">
					</a>
				</div>
				<div class="col-sm-6 col-md-4">
					<a class="lightbox"
						href="${pageContext.request.contextPath }/resources/board/img/magazine6.jpg">
						<img
						src="${pageContext.request.contextPath }/resources/board/img/magazine6.jpg"
						alt="Rails">
					</a>
				</div>
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
					</div>
				</div>
			</div>
		</div>
		<!-- Comments Form -->
	<div class="card my-4">
		<h5 class="card-header">Leave a Comment:</h5>
		<div class="card-body">
			<form name="comment-form">
				<div class="form-group">
					<textarea name="comment_con" class="form-control" rows="3"></textarea>
					<button id="insertBtn" type="button">작성</button>
					<button id="modBtn" type="button">수정</button>
					<div id="commentList"></div>
				</div>

			</form>
		</div>
	</div>
</div>
	
			<div class="row mx-auto col-md-4">
				<button type="button" class="btn btn-outline-primary my-3 mt-5 mb-5"
					onclick="history.back(-1)">목록</button>
			</div>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.8.1/baguetteBox.min.js"></script>
	<script>
		baguetteBox.run('.tz-gallery');
	</script>

	<%@ include file="/WEB-INF/views/fix/footer.jsp"%>
</body>
</html>
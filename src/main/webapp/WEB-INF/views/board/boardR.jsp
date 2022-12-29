<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>



<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.css"> <!-- header-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>

  <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>게시글 조회</title>
   <link rel="stylesheet" href="<c:url value='/resources/css/menu.css' />">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">   
   <style type="text/css">
      * { box-sizing: border-box; margin: 0; padding: 0; font-family: "Noto Sans KR", sans=serif; }
      .container { width: 50%; margin: auto; }
      .titleArea { position: relative; margin: 20px 0 0 0; padding-bottom: 10px; border-bottom: 1px solid #e8e8e8; }
      .titleArea p { display: inline-block; position: relative; margin: 0 0 0 6px; padding: 0 0 0 10px; color: #939393; border-left: 1px solid #d9d9d9; }
      .titleArea h2 { display: inline-block; color: #2e2e2e; font-size: 17px;}
      .frm { width: 100%; }
      input { width: 100%; height: 35px; margin: 5px 0px 10px 0px; border: 1px solid #e9e8e8; padding: 8px;  outline-color: #e6e6e6; }
      textarea { width: 100%;  margin: 5px 0px 10px 0px; border: 1px solid #e9e8e8; resize: none; padding: 8px; outline-color: #e6e6e6; }
      .btn { background-color: rgb(236,236,236); border: none; color: black; padding: 6px 12px; font-size: 16px; cursor: pointer; border-radius: 5px; }
      .btn:hover { text-decoration: underline; }
      .note-editable { height: 700px;  }
      .kboard-detail {
	    clear: both;
	    float: left;
	    width: 100%;
	    border-top: 1px solid #e3e3e3;
	    border-bottom: 1px solid #e3e3e3;
	    background-color: #f4f4f4;
	    font-size: 12px;
	    text-align: left;
}
	.kboard-detail .detail-attr .detail-name {
    float: left;
    font-weight: bold;
    color: #545861;
    text-align: right;
    }
    .kboard-detail .detail-attr .detail-value {
    float: left;
    padding-left: 20px;
    color: #545861;}
    
    .kboard-detail .detail-attr {
    display: inline-block;
    *display: inline;
    zoom: 1;
    float: left;
    margin: 0;
    padding: 12px 35px 12px 22px;
    }
   </style>
</head>
<body>
<%@ include file="/WEB-INF/views/fix/header.jsp"%>
      <script type="text/javascript">
      $(document).ready(function() {   /* main() */
    	     $("#listBtn").on("click", function() {
    	            location.href = "<c:url value='/board/review${searchItem.queryString}' />";
    	         })
    	  
    	  $('.summernote').summernote({
              height: 445,                 // 에디터 높이
              focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
              lang: "ko-KR",                    // 한글 설정
              placeholder: '최대 2048자까지 쓸 수 있습니다',    //placeholder 설정
              disableResizeEditor: true,    // 크기 조절 기능 삭제
              toolbar: [
                 ['fontname', ['fontname']],
                 ['fontsize', ['fontsize']],
                 ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
                 ['color', ['forecolor','color']],
                 ['table', ['table']],
                 ['para', ['ul', 'ol', 'paragraph']],
                 ['height', ['height']],
                 ['insert',['picture','link','video']],
                 ['view',['help']]
              ]
    	  
          });
      
    	  // onImageUpload callback
    	     $('#summernote').summernote({
    	       callbacks: {
    	         onImageUpload: function(files) {
    	           // upload image to server and create imgNode...
    	           $summernote.summernote('insertNode', imgNode);
    	         }
    	       }
    	     });

    	     // summernote.image.upload
    	     $('#summernote').on('summernote.image.upload', function(we, files) {
    	       // upload image to server and create imgNode...
    	       $summernote.summernote('insertNode', imgNode);
    	     });
    	
         
         $("#removeBtn").on("click", function() {
            if(!confirm("정말로 삭제하시겠습니까?")) return;
            
            let form = $("#form")
             /*쿼리스트링에 board_no는 포함되어있지 않아서 추가했음*/
            form.attr("action","<c:url value='/board/review/remove${searchItem.queryString}&board_no=${boardDto.board_no}'/>")
            form.attr("method", "post")
            form.submit()
         })
         
         $("#writeBtn").on("click", function() {
            let form = $("#form")
            form.attr("action", "<c:url value='/board/review/write' />")
            form.attr("method", "post")
            
            if(formCheck())
               form.submit()
         })
         
         let formCheck = function() {
            let form = document.getElementById("form")
            if(form.board_title.value == ""){
               alert("제목을 입력해주세요.")
               form.board_title.focus()
               return false
            }
            if(form.board_con.value == ""){
               alert("내용을 입력해주세요.")
               form.board_con.focus()
               return false
            }
            return true;
         }
         
         $("#modifyBtn").on("click", function() {
            let form = $("#form")
            let isReadonly = $("input[name=board_title]").attr('readonly')
            
            // 1. 읽기상태이면 수정상태로 변경 
            if(isReadonly=='readonly') {
               $(".writing-header").html("리뷰 수정")
               $("input[name=board_title]").attr('readonly', false)
               $("textarea").attr('readonly', false)
               $(".pclass").css("display", "none")
               $(".user_info").css("display", "none")
               $("#modifyBtn").html("<i class='fa fa-pen'></i>등록");
               //수정시 서머노트 활성화
                showSummernote();
               return;
            }
            // 2. 수정상태이면 수정된 내용을 서버로 전송 
            form.attr("action", "<c:url value='/board/review/modify${searchItem.queryString}' />")
            form.attr("method", "post")
            if (formCheck())
               form.submit();
         })
          //모드에 따른 서머노트 활성화 변경
          var mode ='${mode}';	
          function showSummernote() {
              $(document).find('.note-editor').children('.note-toolbar').css("display", "block");
              $('.summernote').summernote('enable');
              $(".user_info").css("display", "none")
          }

          function hideSummernote() {
              $(document).find('.note-editor').children('.note-toolbar').css("display", "none");
              $('.summernote').summernote('disable');
              /* text box */
              $(document).find('.note-editing-area').children('.note-editable').css("height","600px");
              $(document).find('.note-editing-area').children('.note-editable').css("background-color","white");
              $(document).find('.note-editor').css("border","none");
              $(document).find('.note-statusbar').children('.note-resizebar').css("display","none");
              $(document).find('.frm').children('.mb-2').css("border", "0 solid black");
              $(document).find('.frm').children('.mb-2').css("font-weight", "bold");
              

          }

          if (mode == 'new') {
              showSummernote();
          } else {
              hideSummernote();
          }

      })
      
	/**
	* 이미지 파일 업로드
	*/
	function uploadSummernoteImageFile(file, editor) {
		data = new FormData();
		data.append("file", file);
		$.ajax({
			data : data,
			type : "POST",
			url : "/uploadSummernoteImageFile",
			beforeSend : function(xhr){
				xhr.setRequestHeader(($("meta[name='_csrf_header']").attr("content")), ($("meta[name='_csrf']").attr("content")));
			},
			contentType : false,
			processData : false,
			success : function(data) {
            	//항상 업로드된 파일의 url이 있어야 한다.
				$(editor).summernote('insertImage', data.url);
			}
		});
	}
      
   </script>
   <script type="text/javascript">
      let msg = "${msg}"
      if(msg == "WRT_ERR") alert("게시물 등록에 실패하였습니다. 다시 시도해주세요.")
      if(msg == "MOD_ERR") alert("게시물 수정에 실패하였습니다. 다시 시도해주세요.")
   </script>
   
   <div class="container mt-5 mb-5">
   	<div class="titleArea">
      <h2 class="writing-header ">리뷰 ${mode=="new" ? "글쓰기" : "게시판" }</h2>
      <p class="pclass">${mode=="new" ? " 작성 페이지입니다. " : "상품 사용후기입니다."}</p>
    </div>
      <form id="form" class="frm" action="" method="post">
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
      <input type="hidden" name="board_no" value="${boardDto.board_no }">
         <div class="user_info">
         	<div class="kboard-detail">
				<div class="detail-attr detail-writer">
					<div class="detail-name">작성자</div>
					<div class="detail-value">${boardDto.member_id }</div>
				</div>
				<div class="detail-attr detail-date">
					<div class="detail-name">작성일</div>
					<div class="detail-value">${boardDto.reg_date() }</div>
				</div>
				<div class="detail-attr detail-view">
					<div class="detail-name">조회</div>
					<div class="detail-value">${boardDto.board_views }</div>
				</div>
			</div>
         </div>
          <%--추후에 수정사항이 발생하면 나머지 것들도 변경가능하게 할수있음--%>
         <%--<input type="hidden" name="board_type" value="${boardDto.board_type }">
         <input type="hidden" name="board_kind" value="${boardDto.board_kind }">--%>
          <%--일단은 임시로넣어둠--%>
         <input class=" mt-2 mb-2" type="text" name="board_title" value="${boardDto.board_title }" ${mode=="new" ? "" : "readonly='readonly'" }><br/>
         <c:if test="${mode eq 'new' }">
         <textarea class="summernote" name="board_con" style="height: 700px;" ${mode=="new" ? "" : "readonly='readonly'" }>${boardDto.board_con }</textarea><br/>
            <button type="button" id="writeBtn" class="btn btn-primary"><i class="fa fa-pen"></i>등록</button>
         </c:if>
         <c:if test="${mode ne 'new' }">
         <textarea class="summernote" rows="20" name="board_con" ${mode=="new" ? "" : "readonly='readonly'" }>${boardDto.board_con }</textarea><br/>
         </c:if>
         <c:if test="${boardDto.member_id eq loginId }">
            <button type="button" id="modifyBtn" class="btn btn-primary"><i class="fa fa-edit"></i>수정</button>
            <button type="button" id="removeBtn" class="btn btn-danger"><i class="fa fa-trash"></i>삭제</button>
         </c:if>
         
         <button type="button" id="listBtn" class="btn btn-info"><i class="fa fa-bars"></i>목록</button>
      </form>
   </div>
   <%@ include file="/WEB-INF/views/fix/footer.jsp"%>
</body>
</html>





















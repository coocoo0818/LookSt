<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="loginId" value="${sessionScope.res }" />
<c:set var="loginout" value="${loginId==null ? 'Login' : 'Logout' }" />
<c:set var="loginoutlink" value="${loginId==null ? '/login/login' : '/login/logout' }" />

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.css"> <!-- header-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
	
<title>Lookst</title>
<style type="text/css">
.Upload-title{
  margin: 30px auto;
  background-color: #000;
  color: #fff;
  width: 150px;
  padding: 1%;
  border-radius: 50%;
}
.main {
    background-color: white;
  }
  /* ul li a {
    color: #262626;
  } */
  .setting-container {
    background-color: #fff;
  }
  /* .setting-container .setting__menu ul li a.active {
    border-left: 2px solid #262626;
  } */
  .setting-container {
    width: 900px;
    margin: auto;
    border: 1px solid gainsboro;
    margin-top: 30px;
    border-radius: 4px;
    /* text-align: center; */
}
  /* .setting-container .setting__menu {
    width: 237px;
  }
  .setting-container .setting__menu ul li a {
    display: inline-block;
    padding: 16px 16px 16px 30px;
  } */
  .setting-container .setting__content {
    border-left: 1px solid gainsboro;
    display: flex;
    flex-direction: column;
    padding-top: 32px;
  }
  .setting-container .setting__content {
    display: flex;
  }
  .setting-container .setting__content div .item__title {
    text-align: center;
    font-size: 30px;
    width: 80px;
  }
  .setting-container .setting__content div .item__input {
    flex: 4;
    display: flex;
    flex-direction: column;
    align-items: center;
    margin: 20px;
  }
  .setting-container .setting__content div .item__input textarea {
    border: 1px solid #dbdbdb;
    border-radius: 5px;
    font-size: 20px;
    width: 99%;
    padding: 25px
     0px 25px 15px;
    margin: 50px 25px;
  }
  .setting-container .setting__content .content-item__11 .item__input {
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin: 3px;
    align-items: stretch;
  }
  .setting-container .setting__content .content-item__11 .item__input button {
    border: 0;
    background-color: #000000;
    padding: 20px 50px;
    border-radius: 10px;
    color: #fff;
    cursor: pointer;
    font-size: 20px;
    margin: 50px 20px;
  }
  .setting-container .setting__content .content-item__11 .item__input button:hover{
    background-color: gray;
  }

 

.imgupload .imguploadbtn {
  display: inline-block;
  color: white;
  border-radius: 5px;
  padding: 5px 8px;
  font-size: 14px;
  font-weight: bold;
  background-color: black;
}

.imguploadbtn:hover{
  background-color: grey;
}
@media screen and (max-width: 935px) {
  .setting-container {
    width: 100%;
  }
  .Upload-title{
    width: 100px;
    font-size: 14px;
  }
  .preview img{
    width: 100px;
  }
  .setting-container .setting__content {
    padding-left: 20px;
  }
  .setting-container .setting__content > div:not(:first-child) {
    flex-direction: column;
  }
  .setting-container .setting__content div .item__title {
    text-align: center;
    margin-bottom: 5px;
    padding-left: 5px;
  }

  .setting-container .setting__content .content-item__01{
    flex: 1;
    text-align: center;
    padding: 0;
  }
  .setting-container .setting__content .content-item__01 {
    flex: 4;
  }
}
  
  .footer {
    margin-top: 150px;
}

.desc{
  font-size: 14px;
  color: #999;
}
.section {
  margin: auto;
  align-items: center;
}
.section-mid{
  margin: 0 20px 100px 20px;
  align-items: flex-start;
}
.article {
  /* border: 1px solid #ccc; */
  /*padding: 20px;*/
  padding: 20px 20px 10px 15px;
  position: relative;
  min-height: 230px;
}
.item {
  display: inline-block;
  position: relative;
  margin: 15px;
  width: 180px;
  height: 180px;
}
.addImg {
  width: 180px;
  height: 180px;
  position: absolute;
  top: 0;
  z-index: 2;
  cursor: pointer;
}
.addImg .plus-icon{
  margin: 6px;
  width: 180px;
  height: 180px;
  text-align: center;
  font-size: 20px;
  border: dashed 4px #292c26;
}
.addImg .plus-icon .fa{
  line-height: 180px;
}
.preview,.preBlock{
  position: absolute;
  display: block;
  width: 200px;
  height: 200px;
  top: 0;
}
      .btn { background-color: rgb(236,236,236); border: none; color: black; padding: 6px 12px; font-size: 16px; cursor: pointer; border-radius: 5px; }
      .btn:hover { text-decoration: underline; }
</style>
 <script>
	/* 이미지 업로드 */
	$("input[type='file']").on("change", function(e){
		alert("동작");
	});
	
	  $(document).ready(function() {   /* main() */
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
	  
	  
          $("#listBtn").on("click", function() {
              location.href = "<c:url value='/board/list${searchItem.queryString}' />";
           })
           
           $("#removeBtn").on("click", function() {
              if(!confirm("정말로 삭제하시겠습니까?")) return;
              
              let form = $("#form")
               /*쿼리스트링에 board_no는 포함되어있지 않아서 추가했음*/
              form.attr("action","<c:url value='/board/remove${searchItem.queryString}&board_no=${boardDto.board_no}'/>")
              form.attr("method", "post")
              form.submit()
           })
           
           $("#writeBtn").on("click", function() {
              let form = $("#form")
              form.attr("action", "<c:url value='/board/write' />")
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
                 $(".writing-header").html("Q&A 수정")
                 $("input[name=board_title]").attr('readonly', false)
                 $("textarea").attr('readonly', false)
                 $("#modifyBtn").html("<i class='fa fa-pen'></i>등록");
                 //수정시 서머노트 활성화
                  showSummernote();
                 return;
              }
              // 2. 수정상태이면 수정된 내용을 서버로 전송 
              form.attr("action", "<c:url value='/board/modify${searchItem.queryString}' />")
              form.attr("method", "post")
              if (formCheck())
                 form.submit();
           })
            //모드에 따른 서머노트 활성화 변경
            var mode ='${mode}';	
            function showSummernote() {
                $(document).find('.note-editor').children('.note-toolbar').css("display", "block");
                $('.summernote').summernote('enable');
            }

            function hideSummernote() {
                $(document).find('.note-editor').children('.note-toolbar').css("display", "none");
                $('.summernote').summernote('disable');
            }

            if (mode == 'new') {
                showSummernote();
            } else {
                hideSummernote();
            }

        })
 </script>
 <script type="text/javascript">
 	
 </script>
</head>
<body>
<%@ include file="/WEB-INF/views/fix/header.jsp"%>
  <div class="container">
		<div class="row justify-content-md-center">
			<h2 class="col-auto my-5">매거진 업로드</h2>
  <main class="main">
    <section class="setting-container mt-5 mb-5">
        <article class="setting__content">
            <<div class="container mt-5 mb-5">
      <h2 class="writing-header ">Q&A ${mode=="new" ? "글쓰기" : "읽기" }</h2>
      <form id="form" class="frm" action="" method="post">
         <input type="hidden" name="board_no" value="${boardDto.board_no }">
          <%--추후에 수정사항이 발생하면 나머지 것들도 변경가능하게 할수있음--%>
         <%--<input type="hidden" name="board_type" value="${boardDto.board_type }">
         <input type="hidden" name="board_kind" value="${boardDto.board_kind }">--%>
          <%--일단은 임시로넣어둠--%>
         <input type="text" name="board_title" value="${boardDto.board_title }" ${mode=="new" ? "" : "readonly='readonly'" }><br/>
         <c:if test="${mode eq 'new' }">
         <textarea class="summernote" name="board_con" ${mode=="new" ? "" : "readonly='readonly'" }>${boardDto.board_con }</textarea><br/>
            <button type="button" id="writeBtn" class="btn btn-write"><i class="fa fa-pen"></i>등록</button>
         </c:if>
         <c:if test="${mode ne 'new' }">
         <textarea class="summernote" rows="20" name="board_con" ${mode=="new" ? "" : "readonly='readonly'" }>${boardDto.board_con }</textarea><br/>
            <button type="button" id="writeNewBtn" class="btn btn-write" onclick="location.href = '../board/write'"><i class="fa fa-pen"></i>글쓰기</button>
         </c:if>
         <c:if test="${boardDto.member_id eq loginId }">
            <button type="button" id="modifyBtn" class="btn btn-modify"><i class="fa fa-edit"></i>수정</button>
            <button type="button" id="removeBtn" class="btn btn-remove"><i class="fa fa-trash"></i>삭제</button>
         </c:if>
         
         <button type="button" id="listBtn" class="btn btn-list"><i class="fa fa-bars"></i>목록</button>
      </form>
   </div>
        </article>
    </section>
  </main>
  </div>
  </div>
  <%@ include file="/WEB-INF/views/fix/footer.jsp"%>
</body>
</html>
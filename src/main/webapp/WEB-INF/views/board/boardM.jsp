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
<title>Insert title here</title>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
.container {
   font-family: 'Noto Sans KR', sans-serif;
   font-size: 1rem;
   line-height: 1.5rem;
   color: black;
   letter-spacing: 0.1px;
   word-break: keep-all;
   padding: 5%;
   margin: 0 auto;
}

h1 {
   font-size: 3rem;
   line-height: 3.5rem;
   padding-bottom: 40px;
   text-align: center;
}

h3 {
   font-family: 'KoPubWorldBatang';
   font-size: 1.5rem;
   line-height: 2.5rem;
   padding: 30px 0;
   text-align: center;
}

h4 {
   font-size: 1.3rem;
   line-height: 2rem;
   text-align: center;
}

h5 {
   font-size: 0.95rem;
   line-height: 1.5rem;
   font-weight: 400;
}

button {
   display: inline-block;
   height: 50px;
   font-size: 1rem;
   font-weight: bold;
   background: none;
   border-radius: 5px;
   border: 1px solid #aaa;
   transition: 0.4s;
   cursor: pointer;
}

button:hover {
   background: #222;
   color: #fff;
}

input::placeholder, textarea::placeholder {
   color: #888;
}

article {
   margin: 200px 0;
}

.contents {
   border-radius: 10px;
   border: 1px solid #999;
   padding: 50px 5%;
}

.txt {
   padding-top: 20px;
}

.bold {
   display: inline-block;
   font-weight: bold;
}

.gray {
   color: #aaa;
}

.red {
   color: #e6002d;
}

.sans {
   font-family: 'Noto Sans KR', sans-serif;
   text-align: left;
   padding: 10px 0;
   border-bottom: 2px solid #666;
}

img {
   width: 100%;
   vertical-align: top;
}

input, select {
   height: 40px;
   font-size: 1rem;
   padding-left: 7px;
}

select, textarea {
   border: 1px solid #bbb;
   border-radius: 5px;
   width: 100%;
}

#textarea {
   height: 500px;
   padding: 10px 0 0 7px;
   resize: none;
   font-size: 1rem;
   font-family: 'Noto Sans KR', sans-serif;
}

input[type=checkbox] {
   height: auto;
   transform: scale(1.5);
   margin: 0 10px;
   vertical-align: middle;
}

.txt input[name=board_title] {
   width: 100%;
   margin-bottom: 20px;
   border: 0;
   border-bottom: 1px solid #bbb;
}

.btn-upload {
   margin: 10px 10px 0 0;
   width: 60px;
   height: 60px;
   background: #eee;
   color: #aaa;
   font-size: 2rem;
   border: 0;
   border-radius: 5px;
   font-weight: 500;
   cursor: pointer;
   display: flex;
   align-items: center;
   justify-content: center;
   transition: 0.2s;
}

.btn-upload:hover {
   background: #777;
   color: #fff;
}

#picture {
   display: none;
}

.btn1 {
   display: flex;
   justify-content: space-between;
}

.btn1 button {
   width: 48.5%;
   border: 0;
   margin-top: 30px;
   transition: 0.5s;
}

.btn1 button[name=save] {
   background: #ddd;
}

.btn1 button[name=sign] {
   background: #666;
   color: white;
}

.btn1 button[name=save]:hover, .btn1 button[name=sign]:hover, .secret button:hover
   {
   background: #111;
   color: white;
}
.dellink {
   display: none;
}
.imgDeleteBtn{ position: absolute; top: 0; right: 5%; background-color: #ef7d7d; color: wheat; font-weight: 900; width: 30px;
                                 height: 30px; border-radius: 50%; line-height: 26px; text-align: center; border: none; display: block; cursor: pointer; }

@media (min-width: 768px)
.container, .container-md, .container-sm {
    max-width: none !important;
}

</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- <script type="text/javascript" src="./js/jquery-3.1.0.min.js" charset="utf-8"></script> -->
<script type="text/javascript">
   /*    var sel_files = [];   // ????????? ????????? ?????? ??????
   
   
    $(document).ready(function(){
    $("#inpur_imgs").on("change", handleImgFileSelect);
   
    });
   
    function fileUploadAction(){
    consloe.log("fileUploadAction");
    $("#input_imgs").trigger('click');
   
   
    }
   
    function handleImgFileSelect(e) {
   
    // ????????? ???????????? ?????????
    sel_files = [];
    $(".imgs_wrap").empty();
   
    var files = e.target.files;
    var filesArr = Array.prototype.slice.call(files);
   
    var index = 0;
    filesArr.forEach(function(f) {
    if(!f.type.match("image.*")){
    alert("???????????? ????????? ???????????? ???????????????.")
    return;
   
    }
   
    sel_files.push(f);
   
    var reader = new FileReader();
    reader.onload = function(e){
    var html = "CONTENT";
    $(".imgs_wrap").append(html);
    index++;
    }
    reader.readAsDataURL(f)
   
    });
   
    } */
   $(document).ready(function(){
      var msg= '${msg}';
      if (msg != '') {
         alert(msg);
      }

   })
</script>
<body>
   <%@ include file="/WEB-INF/views/fix/header.jsp"%>
      <script type="text/javascript">
         $(document).ready(function() {   /* main() */
         $("#writeBtn").on("click", function() {
            let form = $("#form")
            form.attr("action", "<c:url value='/board/magazine/write' />")
            form.attr("method", "post")
            
            if(formCheck())
               form.submit()
         })
         
         let formCheck = function() {
            let form = document.getElementById("form")
            if(form.board_title.value == ""){
               alert("????????? ??????????????????.")
               form.board_title.focus()
               return false
            }
            if(form.board_con.value == ""){
               alert("????????? ??????????????????.")
               form.board_con.focus()
               return false
            }
            return true;
         }
         
         $("#modifyBtn").on("click", function() {
            let form = $("#form")
            let isReadonly = $("input[name=board_title]").attr('readonly')
            
            // 1. ?????????????????? ??????????????? ?????? 
            if(isReadonly=='readonly') {
               $(".writing-header").html("Q&A ??????")
               $("input[name=board_title]").attr('readonly', false)
               $("textarea").attr('readonly', false)
               $("#modifyBtn").html("<i class='fa fa-pen'></i>??????");
               //????????? ???????????? ?????????
                showSummernote();
               return;
            }
            // 2. ?????????????????? ????????? ????????? ????????? ?????? 
            form.attr("action", "<c:url value='/board/modify${searchItem.queryString}' />")
            form.attr("method", "post")
            if (formCheck())
               form.submit();
         })

      })
   </script>
   <div class="container">
      <h1>????????? ?????????</h1>
      <section class="contents">
      
         <form id="form" enctype="multipart/form-data" class="txt" action="" method="post">
         
         
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <input type="hidden" name="board_no" value="${boardDto.board_no }">
            <input type="text" name="board_title" value="${boardDto.board_title }" placeholder="????????? ???????????????.">
            <textarea name="board_con" style="resize: none;" id="textarea" value="${boardDto.board_con }" placeholder="????????? ???????????????."></textarea>
            <div class="input_wrap">
               <h3 class="mt-4 mb-4">????????? ????????????</h3>
               
               <input type="file" class="hidden_input" id="input_imgs" name="files" multiple />        
                  
                  
                  
                  <div id="preview"></div> 
                  <a href="javascript:void(0);" class="dellink"></a>
                  
            </div>
         
         <div class="btn1">
         <c:if test="${mode eq 'new' }">
            <button type="button" id="writeBtn" name="sign">????????????</button>
         </c:if>
            <button type="button" name="save" onclick="location.href='/lookst/board/magazine' ">????????????</button>
         </div>
      </form>   
   </div>
   </section>
   </div>
      <script type="text/javascript">
/*    input type??? file??? ?????? ?????? change ????????? ?????????.

   ??????????????? ????????? ????????? div#preview??? ????????? ????????????, ????????? ????????? ???????????? ?????? ??? jQuery??? ????????? ??????????????? ????????? ??????.
S
   ????????? ????????? ?????? ???????????? ????????????, ????????? ????????? ?????? ?????? ?????? ???????????? ??????????????? ????????????. */
   
      $(document).ready(
                  function(e) {
                     $("input[type='file']").change(
                           function(e) {
                           
                              if($(".delBtn").length > 0){
                              deleteFile();
                           }
                              //div ?????? ????????????
                              $('#preview').empty();

                              var files = e.target.files;
                              var arr = Array.prototype.slice
                                    .call(files);

                              //????????? ?????? ???????????? ??????
                              for (var i = 0; i < files.length; i++) {
                                 if (!checkExtension(files[i].name,
                                       files[i].size)) {
                                    return false;
                                 }
                              }

                              preview(arr);

                           });//file change

                     function checkExtension(fileName, fileSize) {

                        var regex = new RegExp(
                              "(.*?)\.(exe|sh|zip|alz)$");
                        var maxSize = 20971520; //20MB

                        if (fileSize >= maxSize) {
                           alert('?????? ????????? ??????');
                           $("input[type='file']").val(""); //?????? ?????????
                           return false;
                        }

                        if (regex.test(fileName)) {
                           alert('????????? ???????????? ????????? ????????????.');
                           $("input[type='file']").val(""); //?????? ?????????
                           return false;
                        }
                        return true;
                     }

                     function preview(arr) {
                        arr.forEach(function(f) {

                                 //???????????? ?????? ?????????...?????? ??????
                                 var fileName = f.name;
                                 if (fileName.length > 10) {
                                    fileName = fileName.substring(
                                          0, 7)
                                          + "...";
                                 }
                                 
                                 var imgdiv = $(".img_div");
                                 
                                 //div??? ????????? ??????
                                 var str = '<div class="img_div" style="display: inline-flex; padding: 10px;"><li>';
                                 str += '<span>' + fileName
                                       + '</span><br>';

                                 //????????? ?????? ????????????
                                 if (f.type.match('image.*')) {
                                    var reader = new FileReader(); //????????? ?????? ?????? FileReader?????? ??????
                                    reader.onload = function(e) { //?????? ?????????????????? ??????????????? ???????????? ????????? ?????????
                                       str += '<img class="img_list" src="'+e.target.result+'" title="'+f.name+'" width=100 height=100 />';
                                       str += '</li></div>';
                                       $(str).appendTo('#preview');
                                    }
                                    reader.readAsDataURL(f);
                                 } else {
                                    str += '<img class="img" src="/resources/img/fileImg.png" title="'+f.name+'" width=100 height=100 />';
                                    $(str).appendTo('#preview');
                                 }
                              });//arr.forEach
                              
                     
                     
                     }// preview(arr) ???
                     
                     
                     
                     
                     
                  });
   </script>
   <%@ include file="/WEB-INF/views/fix/footer.jsp"%>
</body>
</html>
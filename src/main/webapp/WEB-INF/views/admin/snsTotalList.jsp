<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="${contextPath}/resources/admin/css/snsTotalList.css" rel="stylesheet">
<title>LOOKST</title>
<script type="text/javascript">
	$(document).ready(function() {
		var likeArr = ${postLikeCheck}
		for (var i = 0; i < likeArr.length; i++) {
			var likedPost_no = likeArr[i]
			$("#heart"+likedPost_no).removeClass("far");
			$("#heart"+likedPost_no).addClass("fas");
			$("#heart"+likedPost_no).addClass("active");
		}
	})
</script>

</head>

<body>
	<%@ include file="/WEB-INF/views/fix/header.jsp"%>
	<div class="container">
		<!-- 상단 인기/최신/팔로우 탭 -->
		<ul class="nav nav-pills col-4 mx-auto my-4" id="pills-tab"role="tablist">
			<li class="nav-item mx-auto" role="presentation">
				<button class="nav-link active" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home" aria-selected="true">인기</button>
			</li>
			<li class="nav-item mx-auto" role="presentation">
				<button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="false">최신</button>
			</li>
			<li class="nav-item mx-auto" role="presentation">
				<button class="nav-link " id="pills-contact-tab" data-bs-toggle="pill" data-bs-target="#pills-contact" type="button" role="tab" aria-controls="pills-contact" aria-selected="false">팔로우</button>
			</li>
		</ul>
		<!-- 메인 해시태그 탭 -->
		<div class="d-grid gap-2 d-md-block text-center">
			<button type="button" class="btn btn-light" onclick="location.href='./'">#나이키</button>
			<button type="button" class="btn btn-light" onclick="location.href='./'">#에어포스</button>
			<button type="button" class="btn btn-light" onclick="location.href='./'">#스투시</button>
			<button type="button" class="btn btn-light" onclick="location.href='./'">#스타일컬렉터</button>
			<button type="button" class="btn btn-light" onclick="location.href='./'">#OOTD</button>
		</div>
		<!-- sns 메인 -->
		<!-- sns 리스트 #1 -->
		<div class="row row-cols-1 row-cols-md-3 g-4">
			<c:forEach var="snsTopList" items="${snsTopList}" varStatus="status">
				<div class="col">
					<div class="card border-0">
						<%-- ${(fn:contains(snsTopList.NPostDto.post_no, snsTopList.NPostDto.post_no)) ? functionName() :'no'} --%>
						<img src="${contextPath}/resources/img/post/${snsTopList.post_imgDto.post_img_img}" class="card-img-top rounded position-relative" onclick="location.href='${contextPath}/admin/snsDetailList/?post_no=${snsTopList.NPostDto.post_no}'">
						<span class="position-absolute badge rounded-pill bg-light m-1 postNo" id="postNo" data-postNo="${snsTopList.NPostDto.post_no}">No.${snsTopList.NPostDto.post_no}</span>
						<div class="row justify-content-start d-flex m-2">
							<div class="col-3">
								<img src="${contextPath}/resources/img/profile/${snsTopList.profile_img}" onclick="location.href='${contextPath}/sns/snsProfile/?member_id=${snsTopList.member_id}'" id="profile_img">
							</div>
							<div class="col-9 my-auto" onclick="location.href='${contextPath}/sns/snsProfile/?member_id=${snsTopList.member_id}'">${snsTopList.member_nick}</div>
						</div>
						<p class="card-text m-2" style="margin-top: 20px;">${snsTopList.NPostDto.post_content}</p>
						<div class="tag_link" style="margin-top: 1%; margin-bottom: 1%;">
							<p class="tag_text" onclick="location.href='./'" style="display: inline;" id="tagInfoList${status.index}">
								<%-- <b> ${snsComTag.tag_content}</b> --%>
							</p>
						</div>

						<div class="like_comment">
							<button onclick="clickBtn(this)" class="border border-white" style="background-color: transparent;">
								<i class="far fa-heart fa-lg" data-productNo="${snsTopList.NPostDto.post_no}" id="heart${snsTopList.NPostDto.post_no}"></i>
							</button>
							<button onclick="clickBtn()" class="border border-white" style="background-color: transparent;">
								<i class="fa-regular fa-comment-dots fa-lg"> ${snsTopList.NPostDto.post_reply}</i>
							</button>
						</div>
							<div class="productDetail d-flex row justify-content-start" id="PrdtTags${status.index}"></div>
					</div>
				</div>
				<c:if test="${status.last eq true}"> 
					<script type="text/javascript">
							$(document).ready(function(){
								var arr = ${snsTotalList}
								
								var toHtml = function(tags) {
									let tmp = ''
									tags.forEach(function(tag) {
										tmp += '<b style="color: #297dcb;">#' + tag + '</b>'
									})
									return tmp
								}
								
								var showList = function(post_no) {
									$.ajax({
										type : 'GET',		//요청 메서드
										url : '${contextPath}/admin/tagInfoList',		// 요청 URI
										data: { post_no : post_no },
										async : false,
										success : function(result) {			// 서버로부터 응답이 도착하면 호출될 함수
												$(tagInfoList).html(toHtml(result))		// result는 서버가 전송한 데이터											
												/* $("#PrdtTags").html(toPrdtTag(result)) */
										},
										error : function() { console.log("error")}	// 에러가 발생할 때, 호출될 함수
									})
								}
								
								var toPrdtTag = function(prdttags) {
									let tmp = ''
									prdttags.forEach(function(prdttag) {
										tmp += '<div>'
										tmp += '<img src="${contextPath}/resources/img/product/' + prdttag.post_tag_img
										tmp += '" onclick=location.href="${contextPath}/admin/productDetail/?product_no='+ prdttag.product_no + '" id="product_img" class="col-3">'
										tmp += '<span class="d-inline-block text-truncate" style="max-width: 280px; font-size: 14px; padding-top: 10px;">' + prdttag.post_tag_name + '<br>' + prdttag.post_tag_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g,",") + '원</span>'
										tmp += '</div>'
									})
									return tmp
								}
								
								var postTagList = function(post_no) {
									$.ajax({
										type : 'GET',		//요청 메서드
										url : '${contextPath}/admin/postTagInfo',		// 요청 URI
										data: { post_no : post_no },
										async : false,
										success : function(result) {			// 서버로부터 응답이 도착하면 호출될 함수
											$(PrdtTags).html(toPrdtTag(result))		// result는 서버가 전송한 데이터
										},
										error : function() { console.log("error")}	// 에러가 발생할 때, 호출될 함수
									})
								}
								
								for (var i = 0; i < arr.length; i++) {
									var post_no = arr[i]
									console.log(post_no)
								    var tagInfoList = '#tagInfoList' + i
								    var PrdtTags = '#PrdtTags' + i

									showList(post_no)
							    	postTagList(post_no)
								}
								
							})
							
							
							function clickBtn(e) {
								var post_no = $(e).children().attr("data-productNo");
								var login_id = "${sessionScope.res}"
								
								let _buttonI = event.target;
								const childElement = _buttonI.firstChild;
								
								if(login_id == "undefined"|| login_id == null|| login_id == ""){
									alert("로그인 해주세요.")
									return false;
								}
									else if (login_id != "undefined"|| login_id != null|| login_id != "") {
									if (_buttonI.classList.contains("likeBtn")) {
										if (childElement.classList.contains("far")) {
											childElement.classList.add("fas");
											childElement.classList.add("active");
											childElement.classList.remove("far");
											var token = $("meta[name='_csrf']").attr("content");
											var header = $("meta[name='_csrf_header']").attr("content");
											
											$.ajax({
												type: 'POST',   //get방식으로 명시
												url : '${contextPath}/admin/postLikeInsert',  //이동할 jsp 파일 주소
												data:{
														post_no : post_no,
												},   
												beforeSend : function(xhr){
													xhr.setRequestHeader(header, token);
												},
												success: function(data){   //데이터 주고받기 성공했을 경우 실행할 결과
													
												},
												error:function(){   //데이터 주고받기가 실패했을 경우 실행할 결과
													console.log('실패');
												}
											})
										} else {
											childElement.classList.remove("fas");
											childElement.classList.remove("active");
											childElement.classList.add("far");
											var token = $("meta[name='_csrf']").attr("content");
											var header = $("meta[name='_csrf_header']").attr("content");
											
											$.ajax({
												type: 'POST',   //get방식으로 명시
												url : '${contextPath}/admin/postLikeDelete',  //이동할 jsp 파일 주소
												data:{
														post_no : post_no,
												},   
												beforeSend : function(xhr){
													xhr.setRequestHeader(header, token);
												},
												success: function(data){   //데이터 주고받기 성공했을 경우 실행할 결과
													
												},
												error:function(){   //데이터 주고받기가 실패했을 경우 실행할 결과
													console.log('실패');
												}
											})
										}
									} else {
										if (_buttonI.classList.contains("far")) {
											_buttonI.classList.add("fas");
											_buttonI.classList.add("active");
											_buttonI.classList.remove("far");
											var token = $("meta[name='_csrf']").attr("content");
											var header = $("meta[name='_csrf_header']").attr("content");
											
											$.ajax({
												type: 'POST',   //get방식으로 명시
												url : '${contextPath}/admin/postLikeInsert',  //이동할 jsp 파일 주소
												data:{
														post_no : post_no,
												},   
												beforeSend : function(xhr){
													xhr.setRequestHeader(header, token);
												},
												success: function(data){   //데이터 주고받기 성공했을 경우 실행할 결과
													
												},
												error:function(){   //데이터 주고받기가 실패했을 경우 실행할 결과
													console.log('실패');
												}
											})
										} else {
											_buttonI.classList.remove("fas");
											_buttonI.classList.remove("active");
											_buttonI.classList.add("far");
											var token = $("meta[name='_csrf']").attr("content");
											var header = $("meta[name='_csrf_header']").attr("content");
											$.ajax({
												type: 'POST',   //get방식으로 명시
												url : '${contextPath}/admin/postLikeDelete',  //이동할 jsp 파일 주소
												data:{
														post_no : post_no,
												},   
												beforeSend : function(xhr){
													xhr.setRequestHeader(header, token);
												},
												success: function(data){   //데이터 주고받기 성공했을 경우 실행할 결과
													
												},
												error:function(){   //데이터 주고받기가 실패했을 경우 실행할 결과
													console.log('실패');
												}
											})
										}
									}
								}
							}
							
					</script>
		        </c:if>
			</c:forEach>
		</div>
	</div>
	<%-- <script type="text/javascript" src="${contextPath}/resources/admin/js/snsTotalList.js"></script> --%>
	<%@ include file="/WEB-INF/views/fix/footer.jsp"%>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		$(document).ready(function(){
			var arr = ${snsTotalList}
			/* for (var i = 0; i < arr.length; i++) { */
				/* var post_no = $('#postNo').attr('data-postNo') */
			for (var i = 0; i < arr.length; i++) {
				var post_no = arr[i]
				/* alert(post_no) */
			    var tagInfoList = '#tagInfoList' + i
			    var PrdtTags = '#PrdtTags' + i
			    
				var toHtml = function(tags) {
					let tmp = ''
					tags.forEach(function(tag) {
						tmp += '<b>#' + tag.tag_content + '</b>'
					})
					return tmp
				}
			    
			   	var toPrdtTag = function(prdttags) {
					let tmp = ''
					prdttags.forEach(function(prdttag) {
						tmp += '<div>'
						tmp += '<img src="${contextPath}/resources/img/product/' + prdttag.post_tag_img + '" onclick='
						tmp += '"location.href="${contextPath}/resources/img/product/' + prdttag.product_no + '" id="product_img" class="col-3">'
						tmp += '<span class="d-inline-block text-truncate" style="max-width: 280px; font-size: 14px; padding-top: 10px;">' + prdttag.post_tag_name + '<br>' + prdttag.post_tag_price + '</span>'
						tmp += '</div>'
					})
					return tmp
				}
			   	
			    var showList = function(post_no) {
					$.ajax({
						type : 'GET',		//요청 메서드
						url : '${contextPath}/admin/tagInfoList',		// 요청 URI
						data: { post_no : post_no },
						success : function(result) {			// 서버로부터 응답이 도착하면 호출될 함수
							$(tagInfoList).html(toHtml(result))		// result는 서버가 전송한 데이터
							/* $("#PrdtTags").html(toPrdtTag(result)) */
						},
						error : function() { alert("error")}	// 에러가 발생할 때, 호출될 함수
					})
				}
			    
				var postTagList = function(post_no) {
					$.ajax({
						type : 'GET',		//요청 메서드
						url : '${contextPath}/admin/postTagInfo',		// 요청 URI
						data: { post_no : post_no },
						success : function(result) {			// 서버로부터 응답이 도착하면 호출될 함수
							$(PrdtTags).html(toPrdtTag(result))		// result는 서버가 전송한 데이터
						},
						error : function() { alert("error")}	// 에러가 발생할 때, 호출될 함수
					})
				}

				showList(post_no)
		    	postTagList(post_no)
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
						<img src="${contextPath}/resources/img/post/${snsTopList.post_imgDto.post_img_img}" class="card-img-top rounded position-relative" onclick="location.href='${contextPath}/admin/mylist/?post_no=${snsTotalLists}'">
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
							<button onclick="clickBtn()" class="border border-white" style="background-color: transparent;">
								<i class="far fa-heart fa-lg"></i>
							</button>
							<button onclick="clickBtn()" class="border border-white" style="background-color: transparent;">
								<i class="fa-regular fa-comment-dots fa-lg"></i>
							</button>
						</div>
						<%-- <c:forEach var="postTagInfo" items="${postTagInfo}"> --%>
							<div class="productDetail d-flex row justify-content-start" id="PrdtTags${status.index}">
								<%-- <img src="${contextPath}/resources/img/post/${postTagInfo.post_tag_img}" onclick="location.href='./'" id="product_img" class="col-3">
								<span class="d-inline-block text-truncate" style="max-width: 280px; font-size: 14px; padding-top: 10px;">
									${postTagInfo.post_tag_name}<br>${postTagInfo.post_tag_price}
								</span> --%>
							</div>
						<%-- </c:forEach> --%>
					</div>
				</div>
				<c:if test="${snsTopList.NPostDto.post_no eq snsTopList.NPostDto.post_no }"> 
					<!-- <script type="text/javascript">
						/* $(document).ready(function(){ */
							var arr = ${snsTotalList}
							
							/* let post_no = ${snsTopList.NPostDto.post_no} */
						    /* alert(post_no) */
					    	var showList = function(post_no) {
								$.ajax({
									type : 'GET',		//요청 메서드
									url : '${contextPath}/admin/tagInfoList',		// 요청 URI
									data: { post_no : post_no },
									success : function(result) {			// 서버로부터 응답이 도착하면 호출될 함수
										$("#tagInfoList").html(toHtml(result))		// result는 서버가 전송한 데이터
									},
									error : function() { alert("error")}	// 에러가 발생할 때, 호출될 함수
								})
							}
					    	var postTagList = function(post_no) {
								$.ajax({
									type : 'GET',		//요청 메서드
									url : '${contextPath}/admin/postTagInfo',		// 요청 URI
									data: { post_no : post_no },
									success : function(result) {			// 서버로부터 응답이 도착하면 호출될 함수
										$("#PrdtTags").html(toPrdtTag(result))		// result는 서버가 전송한 데이터
									},
									error : function() { alert("error")}	// 에러가 발생할 때, 호출될 함수
								})
							}
						    /* showList(post_no)
						    postTagList(post_no) */
						    arr.forEach(
						    	post_no => postTagList(post_no)
							    /* postTagList(post_no) */
						    )
							var toHtml = function(tags) {
								let tmp = ''
								tags.forEach(function(tag) {
									tmp += '<b>#' + tag.tag_content + '</b>'
								})
								return tmp
							}
						    
						    var toPrdtTag = function(prdttags) {
								let tmp = ''
								prdttags.forEach(function(prdttag) {
									tmp += '<div>'
									tmp += '<img src="${contextPath}/resources/img/product/' + prdttag.post_tag_img + '" onclick='
									tmp += '"location.href="${contextPath}/resources/img/product/' + prdttag.product_no + '" id="product_img" class="col-3">'
									tmp += '<span class="d-inline-block text-truncate" style="max-width: 280px; font-size: 14px; padding-top: 10px;">' + prdttag.post_tag_name + '<br>' + prdttag.post_tag_price + '</span>'
									tmp += '</div>'
								})
								return tmp
							}
						    
						    
						/* }) */
				
					</script> -->
		        </c:if>
			</c:forEach>
		</div>
	</div>
	<script type="text/javascript" src="${contextPath}/resources/admin/js/snsTotalList.js"></script>
	<%@ include file="/WEB-INF/views/fix/footer.jsp"%>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<title>LOOKST</title>

<style type="text/css">
#profile_img {
	width: 40px;
	height: 40px;
	border-radius: 50%
}

.prod_detail {
	max-width: 150px;
	font-size: 12px;
	text-overflow: ellipsis;
	display: -webkit-box;
	overflow: hidden;
	-webkit-box-orient: vertical;
	-webkit-line-clamp: 2;
}

.like_comment 
	button:first-child
	.active {
	color: red;
	cursor: pointer;
}

.like_comment {
	margin: 10px 0 10px 0;
}

input {
	width: 100%;
	height: 35px;
	margin: 5px 0px 10px 0px;
	border: 1px solid #e9e8e8;
	padding: 8px;
	background: #f8f8f8;
	outline-color: #e6e6e6;
}
</style>

</head>
<body>
<%@ include file="/WEB-INF/views/fix/header.jsp"%>

	<script type="text/javascript">
		function clickBtn(e) {
			var post_no = $(e).children().children().attr("data-productNo");
			alert(post_no)
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
						$.ajax({
							type: 'POST',   //get방식으로 명시
							url : '${contextPath}/admin/postLikeInsert',  //이동할 jsp 파일 주소
							data:{
									post_no : post_no,
							},   
							success: function(data){   //데이터 주고받기 성공했을 경우 실행할 결과
								
							},
							error:function(){   //데이터 주고받기가 실패했을 경우 실행할 결과
								alert('실패');
							}
						})
					} else {
						childElement.classList.remove("fas");
						childElement.classList.remove("active");
						childElement.classList.add("far");
						$.ajax({
							type: 'POST',   //get방식으로 명시
							url : '${contextPath}/admin/postLikeDelete',  //이동할 jsp 파일 주소
							data:{
									post_no : post_no,
							},   
							success: function(data){   //데이터 주고받기 성공했을 경우 실행할 결과
								
							},
							error:function(){   //데이터 주고받기가 실패했을 경우 실행할 결과
								alert('실패');
							}
						})
					}
				} else {
					if (_buttonI.classList.contains("far")) {
						_buttonI.classList.add("fas");
						_buttonI.classList.add("active");
						_buttonI.classList.remove("far");
						$.ajax({
							type: 'POST',   //get방식으로 명시
							url : '${contextPath}/admin/postLikeInsert',  //이동할 jsp 파일 주소
							data:{
									post_no : post_no,
							},   
							success: function(data){   //데이터 주고받기 성공했을 경우 실행할 결과
								
							},
							error:function(){   //데이터 주고받기가 실패했을 경우 실행할 결과
								alert('실패');
							}
						})
					} else {
						_buttonI.classList.remove("fas");
						_buttonI.classList.remove("active");
						_buttonI.classList.add("far");
						$.ajax({
							type: 'POST',   //get방식으로 명시
							url : '${contextPath}/admin/postLikeDelete',  //이동할 jsp 파일 주소
							data:{
									post_no : post_no,
							},   
							success: function(data){   //데이터 주고받기 성공했을 경우 실행할 결과
								
							},
							error:function(){   //데이터 주고받기가 실패했을 경우 실행할 결과
								alert('실패');
							}
						})
					}
				}
			}
		}
		
		// 프로필화면 이동
		/* $(document).ready(function() {
			$('.IDbox').on('click', function() {
				let member_id = $(this).children().attr("data-member_id")
				location.href = '${contextPath}/sns/snsProfile/?member_id='+member_id;
			});
		}); */
	</script>

	<div class="container">
		<!-- sns 리스트 상세#2 -->
		<div class="list_container row justify-content-center">
			<div class="card mb-3 w-50 p-3 " style="position: relative;">
				<!-- sns 프로필/닉네임 -->
				<div class="d-flex justify-content-between">
					<div <%-- href="${contextPath}/sns/snsProfile/?member_id=${snsDetailClick.member_id}" --%> >
						<div class="mb-2 mt-2 align-self-centertext-decoration-underline" data-memberID="${snsDetailClick.member_id}">
							<img src="${contextPath}/resources/img/profile/${snsDetailClick.profile_img}" id="profile_img">
							<p class="my-auto d-inline ms-3">${snsDetailClick.member_nick}</p>
						</div>
					</div>
					<!-- sns 팔로우버튼 -->
					<button type="button"
						class="btn btn-outline-dark h-75 align-self-center">
						<p>팔로우</p>
					</button>
				</div>
				<!-- sns 캐러셀 #2 -->
				<div id="carouselExampleIndicators1" class="carousel slide" data-bs-touch="false" data-bs-ride="false">
					<div class="carousel-indicators">
						<c:forEach items="${snsDetailClickImg}" var="snsDetailClickImg" varStatus="status">
							<button type="button" data-bs-target="#carouselExampleIndicators1" data-bs-slide-to="${status.index}" <c:if test="${status.first}">class="active" aria-current="true"</c:if> aria-label="Slide ${status.count}"></button>
						</c:forEach>
					</div>
					<div class="carousel-inner">
						<c:forEach items="${snsDetailClickImg}" var="snsDetailClickImg" varStatus="status">
							<div class="carousel-item <c:if test="${status.first}">active</c:if>">
								<img src="${pageContext.request.contextPath }/resources/img/post/${snsDetailClickImg.post_img_img}" class="d-block w-100" alt="...">
							</div>
						</c:forEach>
					</div>
					<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators1" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators1" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
				<!-- sns 캐러셀 #2 끝 -->
				<!-- 상품 상세 설명 -->
				<div class="card-body" style="padding: 10px;">
					<p class="card-text">
						<small class="text-muted">${snsDetailClick.NPostDto.post_date}</small>
					</p>
					<p class="card-title">
						<b>상품태그 ${postTagInfoCnt}개</b>
					</p>
					<div class="row row-cols-1 row-cols-md-3 g-4">
						<c:forEach items="${postTagInfo}" var="postTagInfo">
							<div class="col">
								<div class="card">
									<img src="${contextPath}/resources/img/product/${postTagInfo.post_tag_img}"class="card-img-top" onclick="location.href='${contextPath}/admin/productDetail/?product_no=${postTagInfo.product_no}'">
									<div class="card-body">
										<span class="prod_detail">${postTagInfo.post_tag_name}</span>
										<p><fmt:formatNumber value="${postTagInfo.post_tag_price}" pattern="#,###"/>원</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<!-- 상품 상세 설명 끝 -->
					<!-- 좋아요 / 댓글 / 공유 버튼 -->
					<div class="like_comment">
						<button onclick="clickBtn(this)" class="border border-white" style="background-color: transparent;">
							<c:if test="${member_id eq null || member_id eq ''}">
								<i class="far fa-heart fa-2x" data-productNo="${snsDetailClick.post_no}" id="heart${snsTopList.NPostDto.post_no}"></i>${snsDetailClick.post_no}
							</c:if>
							<c:if test="${member_id ne null || member_id ne ''}">
								<c:if test="${postLikedCheck ne 0}">
									<i class="fa-heart fa-2x fas active"></i>
								</c:if>
							</c:if>
						</button>
						<button onclick="clickBtn()" class="border border-white" style="background-color: transparent;">
							<i class="fa-regular fa-comment-dots fa-2x"></i>
						</button>
						<!-- <button onclick="clickBtn()" class="border border-white position-absolute end-0" style="background-color: transparent; margin-right: 20px;">
							<i class="fa-regular fa-bookmark fa-2x"></i>
						</button> -->
					</div>
					<!-- 좋아요 개수-->
					<p class="card-title">
						<b>좋아요 ${postLikedCnt}개</b>
					</p>
					<!-- 게시글 / 태그 -->
					<p class="card-text">${snsDetailClick.NPostDto.post_content}</p>
					<div class="tag_link">
						<c:forEach items="${tagInfoList}" var="tagInfoList">
							<p class="tag_text" onclick="location.href='./'" style="display: inline;">
								<b>#${tagInfoList}</b>
							</p>
						</c:forEach>
					</div>
					<!-- 댓글 -->
					<div class="comment_box" style="display: inline;">
						<div class="profile_info" style="display: flex;">
							<img
								src="${pageContext.request.contextPath }/resources/img/post/프사2.jpg"
								id="profile_img">
							<div class="comment_detail" style="margin-left: 10px;">
								<div class="comment_main">
									<span class="user_nm">ezen_0111</span> <span class="comment_txt">감망이감망이감망이</span>
								</div>
								<div class="sub">
									<span class="upload-time">8분전</span>
								</div>
							</div>
						</div>
						<div class="profile_info" style="display: flex;">
							<img
								src="${pageContext.request.contextPath }/resources/img/post/프사2.jpg"
								id="profile_img">
							<div class="comment_detail" style="margin-left: 10px;">
								<div class="comment_main">
									<span class="user_nm">ezen_0111</span> <span class="comment_txt">감망이감망이감망이</span>
								</div>
								<div class="sub">
									<span class="upload-time">8분전</span>
								</div>
							</div>
						</div>
					</div>
					<button type="button" class="btn btn-secondary">댓글 더보기...</button>
				</div>
			</div>
		</div>
	</div>

<%@ include file="/WEB-INF/views/fix/footer.jsp"%>
</body>
</html>

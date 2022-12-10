<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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
				
	</script>
	<!-- Feed -->
	<div class="container">
		<div class="row justify-content-md-center">
			<h2 class="col-auto my-5">${pro_info.member_nick}'sFeed</h2>
		</div>
	</div>

	<div class="container">
		<!-- sns 리스트 #1 -->
		<c:forEach var="pro_feed" items="${pro_feed}" varStatus="status">
			<div class="row g-4 my-2">
				<div class="col-md-6 offset-md-3">
					<div class="card border-0">
						<%-- ${fn:contains(snsTopList.NPostDto.post_no, 10)? 'functionName':'no'} --%>
						<img
							src="${contextPath}/resources/img/post/${pro_feed.post_img_img}"
							class="card-img-top rounded position-relative"> <span
							class="position-absolute badge rounded-pill bg-light m-1 postNo"
							id="postNo" data-postNo="${pro_feed.post_no}">No.${pro_feed.post_no}</span>
						<div class="row justify-content-start d-flex m-2">
							<div class="col-3">
								<img
									src="${contextPath}/resources/img/profile/${pro_info.profile_img}"
									 onclick="location.href='${contextPath}/sns/snsProfile/?member_id=${pro_info.member_id}'" id="profile_img">
							</div>
							<div class="col-9 my-auto" onclick="location.href='${contextPath}/sns/snsProfile/?member_id=${pro_info.member_id}'">${pro_info.member_nick}</div>
						</div>
						<p class="card-text m-2" style="margin-top: 20px;">${pro_feed.post_content}</p>
						<div class="tag_link" style="margin-top: 1%; margin-bottom: 1%;">
							<p class="tag_text" onclick="location.href='./'"
								style="display: inline;">
								<b> <%-- ${snsComTag.tag_content} --%></b>
							</p>
						</div>

						<div class="like_comment">
							<button onclick="clickBtn()" class="border border-white"
								style="background-color: transparent;">
								<i class="far fa-heart fa-lg"></i>
							</button>
							<button onclick="clickBtn()" class="border border-white"
								style="background-color: transparent;">
								<i class="fa-regular fa-comment-dots fa-lg"></i>
							</button>
						</div>
						<%-- 						<c:forEach var="postTagInfo" items="${postTagInfo10}">
							<div class="productDetail d-flex row justify-content-start ">
								<img src="${contextPath}/resources/img/post/${postTagInfo.post_tag_img}" onclick="location.href='./'" id="product_img" class="col-3">
								<span class="d-inline-block text-truncate" style="max-width: 280px; font-size: 14px; padding-top: 10px;">
									${postTagInfo.post_tag_name}<br>${postTagInfo.post_tag_price}
								</span>
							</div>
						</c:forEach> --%>
					</div>
				</div>

			</div>
		</c:forEach>
	</div>
	<%@ include file="/WEB-INF/views/fix/footer.jsp"%>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="follow_unfollow" value="${checkFollow==1 ? '팔로우 취소' : '팔로우' }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>

<style type="text/css">
	.profileEdit_Btn {
		margin-left: 100px;
	}
	
	.pro_img_box {
		width: 300px;
		height: 300px;
		border-radius: 70%;
	}
	
	#profile_img {
		width: 300px;
		height: 300px;
		border-radius: 70%;
		object-fit: cover;
	}
	
	.feed_img {
		width: 100%;
		height: 400px;
		object-fit: cover;
	}
	
	
	@media ( max-width : 576px;) {
	}
	
	.follow_thmbnail {
		width: 70px;
		height: 70px;
		object-fit: cover;
		margin-right: 15px;
		border: 1px solid #E2E2E2;
		padding: 1%;
	}
</style>

<script type="text/javascript">
	
	$(document).ready(function() {
		// 팔로잉 프로필화면 이동
		$('.followingIDbox').on('click', function() {
			let member_id = $(this).children().attr("data-member_id")
			location.href = '${contextPath}/sns/snsProfile/?member_id='+member_id;
		});
		
		// 팔로워 프로필화면 이동
		$('.followerIDbox').on('click', function() {
			let member_id = $(this).children().attr("data-member_id")
			location.href = '${contextPath}/sns/snsProfile/?member_id='+member_id;
		});
		
		// 개인 피드 리스트 이동
		$('.Personal_post').on('click', function() {
			let member_id = $(this).children().attr("data-member_id")
			alert(member_nick)
			location.href = '${contextPath}/sns/personalPost/?member_id='+member_id;
		});
		
		// 팔로우
		$('#follow-unfollow-btn').on('click', function() {
			let member_id = $(this).attr("data-member_id")
			let following_id = $(this).attr("data-following_id")
			let checkfollow = $(this).attr("data-checkfollow")
			if(checkfollow == 0){
				$.ajax({
					type : 'post',
					url : '${contextPath}/sns/follow',
					data : {
						login_id : member_id,
						member_id : following_id
					},
					success : function() {
						location.reload()
					},
					error : function() {alert("팔로우 실패!!")}
				})
			} 
			else if(checkfollow == 1){
				$.ajax({
					type : 'post',
					url : '${contextPath}/sns/unfollow',
					data : {
						login_id : member_id,
						member_id : following_id
					},
					success : function() {
						location.reload()
					},
					error : function() {alert("언팔로우 실패!!")}
				})
			}
		})
	})
	
	
</script>

<title>snsProfile</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/fix/header.jsp"%>
	<!-- 바디 시작 -->
	<!-- myProfile -->
	<div class="container">
		<div class="row justify-content-md-center">
			<h2 class="col-auto my-5">${pro_info.member_nick}'s Profile</h2>
		</div>
	</div>
	<!-- myProfile 끝 -->
	<!-- 프로필 정보 -->
	<div class="profile container justify-content-center">
		<div class="profile-card card mb-5 pb-5"
			style="max-width: 100%; border: none; border-bottom: 1px solid #E2E2E2;">
			<div class="row g-0">
				<!-- 프로필 이미지-->
				<div class="profile_img col-6">
					<div class="col-6 offset-3 ">
						<div class="pro_img_box">
							<img
								src="${pageContext.request.contextPath }/resources/img/profile/${pro_info.profile_img}"
								id="profile_img" class="" alt="...">
						</div>
					</div>
				</div>
				<!-- 프로필 기본정보 -->
				<div class="profile_info col-md-6">
					<div class="card-body">
						<!-- nickname -->
						<div class="nickname fw-bold fs-1 mb-md-4">${pro_info.member_nick }
							<c:if test="${login_Id == pro_info.member_id }">
								<!-- 프로필 수정-->
								<button type="button"
									class="profileEdit_Btn btn btn-primary fs-4 ms-auto"
									data-bs-toggle="modal" data-bs-target="#profile-edit-Modal">
									<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
										fill="currentColor" class="bi bi-gear" viewBox="0 0 19 19">
                                    <path
											d="M8 4.754a3.246 3.246 0 1 0 0 6.492 3.246 3.246 0 0 0 0-6.492zM5.754 8a2.246 2.246 0 1 1 4.492 0 2.246 2.246 0 0 1-4.492 0z"></path>
                                    <path
											d="M9.796 1.343c-.527-1.79-3.065-1.79-3.592 0l-.094.319a.873.873 0 0 1-1.255.52l-.292-.16c-1.64-.892-3.433.902-2.54 2.541l.159.292a.873.873 0 0 1-.52 1.255l-.319.094c-1.79.527-1.79 3.065 0 3.592l.319.094a.873.873 0 0 1 .52 1.255l-.16.292c-.892 1.64.901 3.434 2.541 2.54l.292-.159a.873.873 0 0 1 1.255.52l.094.319c.527 1.79 3.065 1.79 3.592 0l.094-.319a.873.873 0 0 1 1.255-.52l.292.16c1.64.893 3.434-.902 2.54-2.541l-.159-.292a.873.873 0 0 1 .52-1.255l.319-.094c1.79-.527 1.79-3.065 0-3.592l-.319-.094a.873.873 0 0 1-.52-1.255l.16-.292c.893-1.64-.902-3.433-2.541-2.54l-.292.159a.873.873 0 0 1-1.255-.52l-.094-.319zm-2.633.283c.246-.835 1.428-.835 1.674 0l.094.319a1.873 1.873 0 0 0 2.693 1.115l.291-.16c.764-.415 1.6.42 1.184 1.185l-.159.292a1.873 1.873 0 0 0 1.116 2.692l.318.094c.835.246.835 1.428 0 1.674l-.319.094a1.873 1.873 0 0 0-1.115 2.693l.16.291c.415.764-.42 1.6-1.185 1.184l-.291-.159a1.873 1.873 0 0 0-2.693 1.116l-.094.318c-.246.835-1.428.835-1.674 0l-.094-.319a1.873 1.873 0 0 0-2.692-1.115l-.292.16c-.764.415-1.6-.42-1.184-1.185l.159-.291A1.873 1.873 0 0 0 1.945 8.93l-.319-.094c-.835-.246-.835-1.428 0-1.674l.319-.094A1.873 1.873 0 0 0 3.06 4.377l-.16-.292c-.415-.764.42-1.6 1.185-1.184l.292.159a1.873 1.873 0 0 0 2.692-1.115l.094-.319z"></path>
                                </svg>
									&nbsp; 프로필 수정
								</button>
							</c:if>

							<c:if test="${login_Id != pro_info.member_id }">
								<button class="followBtn btn btn-primary fs-4 ms-auto" id="follow-unfollow-btn"
								 data-member_id = "${login_Id }" data-following_id = "${pro_info.member_id }" 
								 data-checkfollow = "${checkFollow }">${follow_unfollow }</button></div>
							</c:if>


						</div>
						<div class="cnt d-flex flex-row mb-5 d-grid gap-md-5 mt-5">
							<button type="button" class="post_Cnt btn fs-4">
								게시물
								<div class="count fs-4 fw-bold m-auto">${fn:length(pro_feed) }</div>
							</button>
							<button type="button" class="following_Cnt btn fs-4"
								data-bs-toggle="modal" data-bs-target="#following-Modal">
								팔로잉
								<div class="count fs-4 fw-bold m-auto">${fn:length(pro_following) }</div>
							</button>
							<button type="button" class="show btn fs-4 "
								data-bs-toggle="modal" data-bs-target="#follower-Modal"
								value="follower">
								팔로워
								<div class="count fs-4 fw-bold m-auto">${fn:length(pro_follower) }</div>
							</button>
						</div>
						<div class="IDIntro d-flex flex-row mb-3 d-grid gap-md-2 mt-5">
							<div class="userid fw-bold fs-4">${pro_info.member_id}</div>
							<div class="intro fs-4 align-text-bottom">${pro_info.profile_intro }</div>
						</div>
					</div>
				</div>
				<!-- 프로필 기본정보 -->
			</div>
		</div>
		<!-- 피드 -->
		<div class="post container">
			<div class="row mt-5 mb-5">
				<c:if
					test="${fn:length(pro_feed) == null || fn:length(pro_feed) == 0 }">
					<div class="none_feed fs-4 fw-bold"
						style="justify-content: center; text-align: center;">게시물이
						없습니다.</div>
				</c:if>
				<c:if
					test="${fn:length(pro_feed) != null || fn:length(pro_feed) != 0 }">
					<c:forEach var="pro_feed" items="${pro_feed }">
						<div class="col-sm-4 mb-3">
							<div class="card" style="border: none;">
								<div class="post_img card-body">
									<a href="${contextPath}/sns/personalPost/?member_id=${pro_feed.member_id}" class="Personal_post" >
										<img class="feed_img"
											src="${pageContext.request.contextPath }/resources/img/post/${pro_feed.post_img_img}"
											alt="...">
									</a>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:if>
			</div>
		</div>
		<!-- 피드 끝 -->
	</div>
	<!-- 프로필 정보 끝 -->
	<!--profile-edit-Modal -->
	<div class="modal fade" id="profile-edit-Modal" tabindex="-1"
		aria-labelledby="profile-edit-ModalLabel" aria-hidden="true">
		<div
			class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="profile-edit-Modal">프로필수정</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="mb-3">
						<label for="formFile" class="form-label">프로필 이미지 선택</label> <input
							class="form-control" type="file" id="formFile">
					</div>
					
					
					<form commandName="nickMod" method="post">
					<div class="input-group mb-3">
						<span class="input-group-text" id="basic-addon1">닉네임</span> <input
							type="text" class="form-control"
							placeholder="${pro_info.member_nick }" aria-label="Username"
							aria-describedby="basic-addon1">
					</div>
					</form>
					
					
					<div class="input-group">
						<span class="input-group-text">자기소개 글</span>
						<textarea class="form-control"
							placeholder="${pro_info.profile_intro }"
							aria-label="With textarea"></textarea>
					</div>
				</div>
				<div class="modal-footer">
					<input type="submit" class="submit btn btn-primary" value="저장">
				</div>
			</div>
		</div>
	</div>
	<!--profile-edit-Modal 끝 -->

	<!-- following-Modal -->
	<div class="modal fade" id="following-Modal" tabindex="-1"
		aria-labelledby="following-Modal" aria-hidden="true">
		<div
			class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="following-Modal">팔로잉</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<ul>
						<c:if
							test="${fn:length(pro_following) == null || fn:length(pro_following) == 0 }">
							<br/>
							<li class="fs-4" style="list-style: none;"><span>팔로잉이 없습니다.</span></li>

						</c:if>
						<c:if
							test="${fn:length(pro_following) != null || fn:length(pro_following) != 0 }">
							<c:forEach var="pro_following" items="${pro_following }"
								varStatus="following_status">
								<br/>
								<li class="fs-4" style="list-style: none;" data-memberID="${pro_following.following}">
									<a href="${contextPath}/sns/snsProfile/?member_id=${pro_following.following}" class="followingIDbox" style="text-decoration-line: none;">
										<img src="${pageContext.request.contextPath }/resources/img/profile/${pro_following.profile_img}" class="follow_thmbnail rounded-circle" alt="...">
										<span>${pro_following.member_nick }</span>
									</a>
								</li>
							</c:forEach>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- following-Modal 끝 -->

	<!-- follower-Modal -->
	<div class="modal fade" id="follower-Modal" tabindex="-1"
		aria-labelledby="follower-Modal" aria-hidden="true">
		<div
			class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="follower-Modal">팔로워</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="follower modal-body" id="followerList">
					<ul>
					
						<c:if
							test="${fn:length(pro_follower) == null || fn:length(pro_follower) == 0 }">
							<br/>
							<li class="fs-4" style="list-style: none;"><span>팔로워가 없습니다.</span></li>

						</c:if>
						<c:if
							test="${fn:length(pro_follower) != null || fn:length(pro_follower) != 0 }">
						<c:forEach var="pro_follower" items="${pro_follower }"
							varStatus="follower_status">
							<br/>
								<li class="fs-4" style="list-style: none;">							
									<a href="${contextPath}/sns/snsProfile/?member_id=${pro_follower.member_id}" class="followerIDbox" style="text-decoration-line: none;">
										<img src="${pageContext.request.contextPath }/resources/img/profile/${pro_follower.profile_img}" class="follow_thmbnail rounded-circle" alt="...">
										<span>${pro_follower.member_nick }</span>
									</a>
								</li>
						</c:forEach>
						</c:if>

					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- follower-Modal 끝 -->
	<%@ include file="/WEB-INF/views/fix/footer.jsp"%>
</body>
</html>
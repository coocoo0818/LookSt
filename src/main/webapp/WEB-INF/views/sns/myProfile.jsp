<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--   	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous"> -->
<!--     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script> -->
    <style type="text/css">
    
    #profile_img{
        width: 250px;
        height: 250px;
        border-radius: 50%;
    }
    
    .profileEdit_Btn{
        margin-left: 100px;
    }
    

    </style>
    
<title>MyProfile</title>
</head>
<body>
<%@ include file="/WEB-INF/views/fix/header.jsp" %>
	<!-- 바디 시작 -->
<!-- myProfile -->
	<div class="container">
		<div class="row justify-content-md-center">
			<h2 class="col-auto my-5">My Profile</h2>
        </div>
    </div>
    <!-- myProfile 끝 -->
	<!-- 프로필 정보 -->
	<div class="profile container justify-content-center">
        <div class="profile-card card mb-5" style="max-width: 100%; border: none;">
            <div class="row g-0">
                <!-- 프로필 이미지-->
                <div class="profile_img col-md-6">
                    <div class="col-md-6 offset-md-3">
                        <img src="https://item.kakaocdn.net/do/4f457e7df2f7242fc74ec4667b4bccb5d0bbab1214a29e381afae56101ded106" id="profile_img" class="img-thumbnail" alt="..." >
                    </div>
                </div>
                <!-- 프로필 기본정보 -->
                <div class="profile_info col-md-6">
                    <div class="card-body">
                        <!-- nickname --> 
                        <div class="nickname fw-bold fs-1 mb-md-4">Kuromi
                            <!-- 프로필 수정-->
                            <button type="button" class="profileEdit_Btn btn btn-primary fs-4 ms-auto" data-bs-toggle="modal" data-bs-target="#profile-edit-Modal">
                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-gear" viewBox="0 0 19 19">
                                    <path d="M8 4.754a3.246 3.246 0 1 0 0 6.492 3.246 3.246 0 0 0 0-6.492zM5.754 8a2.246 2.246 0 1 1 4.492 0 2.246 2.246 0 0 1-4.492 0z"></path>
                                    <path d="M9.796 1.343c-.527-1.79-3.065-1.79-3.592 0l-.094.319a.873.873 0 0 1-1.255.52l-.292-.16c-1.64-.892-3.433.902-2.54 2.541l.159.292a.873.873 0 0 1-.52 1.255l-.319.094c-1.79.527-1.79 3.065 0 3.592l.319.094a.873.873 0 0 1 .52 1.255l-.16.292c-.892 1.64.901 3.434 2.541 2.54l.292-.159a.873.873 0 0 1 1.255.52l.094.319c.527 1.79 3.065 1.79 3.592 0l.094-.319a.873.873 0 0 1 1.255-.52l.292.16c1.64.893 3.434-.902 2.54-2.541l-.159-.292a.873.873 0 0 1 .52-1.255l.319-.094c1.79-.527 1.79-3.065 0-3.592l-.319-.094a.873.873 0 0 1-.52-1.255l.16-.292c.893-1.64-.902-3.433-2.541-2.54l-.292.159a.873.873 0 0 1-1.255-.52l-.094-.319zm-2.633.283c.246-.835 1.428-.835 1.674 0l.094.319a1.873 1.873 0 0 0 2.693 1.115l.291-.16c.764-.415 1.6.42 1.184 1.185l-.159.292a1.873 1.873 0 0 0 1.116 2.692l.318.094c.835.246.835 1.428 0 1.674l-.319.094a1.873 1.873 0 0 0-1.115 2.693l.16.291c.415.764-.42 1.6-1.185 1.184l-.291-.159a1.873 1.873 0 0 0-2.693 1.116l-.094.318c-.246.835-1.428.835-1.674 0l-.094-.319a1.873 1.873 0 0 0-2.692-1.115l-.292.16c-.764.415-1.6-.42-1.184-1.185l.159-.291A1.873 1.873 0 0 0 1.945 8.93l-.319-.094c-.835-.246-.835-1.428 0-1.674l.319-.094A1.873 1.873 0 0 0 3.06 4.377l-.16-.292c-.415-.764.42-1.6 1.185-1.184l.292.159a1.873 1.873 0 0 0 2.692-1.115l.094-.319z"></path>
                                </svg>
                                &nbsp; 프로필 수정
                            </button>
                        </div>
                        <div class="cnt d-flex flex-row mb-5 d-grid gap-md-5 mt-5">
                            <button type="button" class="post_Cnt btn fs-4">게시물
                                <div class="count fs-4 fw-bold m-auto">3</div>
                            </button>
                            <button type="button" class="follwing_Cnt btn fs-4" data-bs-toggle="modal" data-bs-target="#following-Modal">
                                팔로잉<div class="count fs-4 fw-bold m-auto">3</div>
                            </button>
                            <button type="button" class="follwer_Cnt btn fs-4" data-bs-toggle="modal" data-bs-target="#follwer-Modal">
                                팔로워<div class="count fs-4 fw-bold m-auto">3</div>
                            </button>
                        </div>
                        <div class="IDIntro d-flex flex-row mb-3 d-grid gap-md-2 mt-5">
                            <div class="userid fw-bold fs-4">@kuromi0111</div>
                            <div class="intro fs-4 align-text-bottom">안녕~ 나는 쿠로미야</div>
                        </div>
                    </div>
                </div>
                <!-- 프로필 기본정보 -->
            </div>
        </div>
        <!-- 피드 -->
        <div class="post container">
            <div class="row mt-5">
                <div class="col-sm-4">
                <div class="card">
                    <div class="post_img card-body">
                        <img src="https://4.bp.blogspot.com/-2Forv_3YhZE/UwsBOsJgcmI/AAAAAAAADHk/3GV8qosJgGs/s1600/07.png" class="card-img-top" alt="...">
                    </div>
                </div>
                </div>
                <div class="col-sm-4">
                <div class="card">
                    <div class="post_img card-body">
                        <img src="https://2.bp.blogspot.com/-Rlu0HE8eWJU/UwsBNjfEKlI/AAAAAAAADHU/QguxF9EVof4/s1600/04.png" class="card-img-top" alt="...">
                    </div>
                </div>
                </div>
                <div class="col-sm-4">
                    <div class="card">
                    <div class="post_img card-body">
                        <img src="https://3.bp.blogspot.com/-0YfJDT1MwnY/UwsBMzjhvjI/AAAAAAAADHI/6H27BmlKniw/s1600/01.png" class="card-img-top" alt="...">
                    </div>
                    </div>
                </div>
            </div>
            <!-- 피드 끝 -->
        </div>
	</div>
    <!-- 프로필 정보 끝 -->
    <!--profile-edit-Modal -->
    <div class="modal fade" id="profile-edit-Modal" tabindex="-1" aria-labelledby="profile-edit-ModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
            <h1 class="modal-title fs-5" id="profile-edit-Modal">프로필수정</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="mb-3">
                    <label for="formFile" class="form-label">프로필 이미지 선택</label>
                    <input class="form-control" type="file" id="formFile">
                </div>
                <div class="input-group mb-3">
                    <span class="input-group-text" id="basic-addon1">@</span>
                    <input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">
                </div>
                <div class="input-group">
                    <span class="input-group-text">자기소개 글</span>
                    <textarea class="form-control" placeholder="자신을 소개해주세요." aria-label="With textarea"></textarea>
                </div>
            </div>
            <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
            <button type="button" class="btn btn-primary">저장</button>
            </div>
        </div>
        </div>
    </div>
    <!--profile-edit-Modal 끝 -->
    <!-- following-Modal -->
    <div class="modal fade" id="following-Modal" tabindex="-1" aria-labelledby="following-Modal" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="following-Modal">팔로워</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    ...
                </div>
            </div>
        </div>
    </div>
    <!-- following-Modal 끝 -->
    <!-- follower-Modal -->
    <div class="modal fade" id="follwer-Modal" tabindex="-1" aria-labelledby="follwer-Modal" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="follwer-Modal">팔로워</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    ...
                </div>
            </div>
        </div>
    </div>
    <!-- follower-Modal 끝 -->
<%@ include file="/WEB-INF/views/fix/footer.jsp" %>
</body>
</html>
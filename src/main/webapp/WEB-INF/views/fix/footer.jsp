<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="loginId" />
</sec:authorize>

<!DOCTYPE html>
<html>
<head>
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
<meta charset="UTF-8">
<title>footer</title>
	<!-- 플로팅버튼 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" />
<!-- <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css'> -->
<!-- <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css'> -->
<link href="${contextPath}/resources/fix/css/footer.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<!--하단 플로팅 버튼 시작-->
<div class="floating-button">
   <span class="move-guestBook">
      <a class="guest-btn btn-info" href="#"></a>
	  </span>
   	<!-- <span class="move-myWebSite">
      <a class="myWebSite-btn" href="https://goldsystem.tistory.com/"></a>
	  </span> -->
</div>
<!--하단 플로팅 버튼 끝-->
<!-- Footer -->
<div class="footer-dark">
        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-md-3 item">
                        <h3>Services</h3>
                        <ul>
                            <li><a href="#">SNS</a></li>
                            <li><a href="#">SHOP</a></li>
                            <li><a href="#">BOARD</a></li>
                        </ul>
                    </div>
                    <div class="col-sm-6 col-md-3 item">
                        <h3>Join</h3>
                        <ul>
                            <li><a href="#">LOGIN</a></li>
                            <li><a href="#">REGISTER</a></li>
                        </ul>
                    </div>
                    <div class="col-md-6 item text">
                        <h3>Company Intro</h3>
                        <p>Hello. This is a homepage called LOOKST, which is developing a project while studying SPRING WEB.
I hope everyone will work hard until the end and do more disappointing projects to be greedy for endless development.Thank you.</p>
                    </div>
                    <div class="col item social">
                    <a href="#"><i class="fa-brands fa-facebook"></i></a>
                    <a href="#"><i class="fa-brands fa-twitter"></i></a>
                    <a href="#"><i class="fa-brands fa-github"></i></a>
                    <a href="#"><i class="fa-brands fa-instagram"></i></a>
                    </div>
                </div>
                <p class="copyright">Company EZEN © 2022</p>
            </div>
        </footer>
    </div>
<!-- Footer -->
</body>
<script type="text/javascript" src="${contextPath}/resources/Bootswatch/_vendor/bootstrap/dist/js/bootstrap.bundle.js"></script>
<script type="text/javascript" src="${contextPath}/resources/fix/js/header.js"></script>
<%--  <script type="module" src="${pageContext.request.contextPath }/resources/_vendor/bootstrap/dist/js/bootstrap.esm.js"></script>
  <script type="module" src="${pageContext.request.contextPath }/resources/_vendor/bootstrap/dist/js/bootstrap.esm.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath }/resources/_assets/js/custom.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath }/resources/_vendor/bootstrap/dist/js/bootstrap.bundle.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath }/resources/_vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath }/resources/_vendor/bootstrap/dist/js/bootstrap.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath }/resources/_vendor/bootstrap/dist/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath }/resources/_vendor/jquery/dist/jquery.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath }/resources/_vendor/jquery/dist/jquery.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath }/resources/_vendor/jquery/dist/jquery.slim.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath }/resources/_vendor/jquery/dist/jquery.slim.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath }/resources/_vendor/prismjs/prism.js"></script> --%>

</html>
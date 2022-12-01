<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="auth_admin_menu" value="${auth eq 'admin' ? 'dropdown-item' : 'visually-hidden'}" />
<c:set var="auth_seller_menu" value="${auth eq 'seller' ? 'dropdown-item' : 'visually-hidden'}" />
<c:set var="loginout" value="${sessionScope.res==null ? 'LOGIN' : 'LOGOUT' }"/>
<c:set var="loginhidden" value="${sessionScope.res==null ? 'dropdown-item' : 'visually-hidden' }"/>
<c:set var="logouthidden" value="${sessionScope.res!=null ? 'dropdown-item' : 'visually-hidden' }"/>
<c:set var="loginoutlink" value="${sessionScope.res==null ? '/lookst/login' : '/lookst/logout' }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LookSt</title>
<c:set var="contextPath" value="${pageContext.request.contextPath == '/' ? '' : pageContext.request.contextPath }" scope="application" />
	<!-- CDN only -->
	<!-- <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.0/css/all.css"> -->
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script> -->
	<!-- CSS only -->
	<link href="${contextPath}/resources/Bootswatch/5/lux/bootstrap.css" rel="stylesheet">
	<link href="${contextPath}/resources/Bootswatch/5/lux/bootstrap.min.css" rel="stylesheet">
	<link href="${contextPath}/resources/fix/css/header.css" rel="stylesheet">
 	<%-- <link href="${pageContext.request.contextPath }/resources/5/lux/_bootswatch.scss" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/5/lux/_variables.scss" rel="stylesheet"> --%>
<%-- 	<link href="${pageContext.request.contextPath }/resources/_assets/css/custom.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/_assets/scss/custom.scss" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/_vendor/bootstrap/dist/css/bootstrap-grid.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/_vendor/bootstrap/dist/css/bootstrap-grid.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/_vendor/bootstrap/dist/css/bootstrap-grid.rtl.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/_vendor/bootstrap/dist/css/bootstrap-grid.rtl.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/_vendor/bootstrap/dist/css/bootstrap-reboot.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/_vendor/bootstrap/dist/css/bootstrap-reboot.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/_vendor/bootstrap/dist/css/bootstrap-reboot.rtl.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/_vendor/bootstrap/dist/css/bootstrap-reboot.rtl.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/_vendor/bootstrap/dist/css/bootstrap-utilities.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/_vendor/bootstrap/dist/css/bootstrap-utilities.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/_vendor/bootstrap/dist/css/bootstrap-utilities.rtl.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/_vendor/bootstrap/dist/css/bootstrap-reboot.rtl.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/_vendor/bootstrap/dist/css/bootstrap.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/_vendor/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
  	<link href="${pageContext.request.contextPath }/resources/_vendor/bootstrap/dist/css/bootstrap.rtl.css" rel="stylesheet">
  	<link href="${pageContext.request.contextPath }/resources/_vendor/bootstrap/dist/css/bootstrap.rtl.min.css" rel="stylesheet">
  	<link href="${pageContext.request.contextPath }/resources/_vendor/prismjs/themes/prism-okaidia.css" rel="stylesheet"> --%>

</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container-fluid">
    <a class="navbar-brand" href="<c:url value="/"/>">LookSt</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    
    <div class="collapse navbar-collapse" id="navbarColor01">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item align-self-center">
          <a class="nav-link text-center" href="#">Home
            <!-- <span class="visually-hidden">(current)</span> -->
          </a>
        </li>
        <li class="nav-item align-self-center">
          <a class="nav-link text-center" href="${contextPath}/admin/member_management">MEMBER<br>MANAGEMENT</a>
        </li>
        <li class="nav-item align-self-center">
          <a class="nav-link text-center" href="${contextPath}/admin/sns_management">SNS<br>MANAGEMENT</a>
        </li>
        <li class="nav-item align-self-center">
          <a class="nav-link text-center" href="${contextPath}/admin/board_management">BOARD<br>MANAGEMENT</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle text-center" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">REQUEST<br>MANAGEMENT</a>
          <div class="dropdown-menu dropdown-menu-end dropdown-menu-xs-start">
            <a class="dropdown-item text-center" href="${contextPath}/admin/magazin_request">MAGAZIN</a>
            <a class="dropdown-item text-center" href="${contextPath}/admin/seller_request">SELLER</a>
            <a class="${logouthidden} text-center" href="/lookst/member/mypage">MY PAGE</a>
            <a class="${logouthidden} text-center" href="/lookst/sns/snsProfile/?member_id=${res}">MY PROFILE</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item text-center" href="${loginoutlink}">${loginout}</a>
          </div>
        </li>
      </ul>
    </div>
  </div>
</nav>
</body>
</html>
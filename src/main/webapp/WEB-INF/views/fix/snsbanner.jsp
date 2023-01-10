<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sub-banner</title>

	<link href="${contextPath}/resources/fix/css/snsbanner.css" rel="stylesheet">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.0/css/all.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
	<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.1.3/assets/owl.carousel.min.css'>
</head>
<body>

<div class="style_title">
	<h3>Style Picks!</h3>
</div>
<!-- 서브캐러셀 시작 -->
<div class="carousel-wrap">
  <div class="owl-carousel">
  	<c:forEach var="stylePick" items="${stylePick}">
	    <div class="item">
		    <a href="${contextPath}/sns/snsProfile/?member_id=${stylePick.member_id}" class="card_link align-self-center">
		    	<img id="post_img_box" class="post_img_box" src="${stylePick.post_img_img}" >
		    	<div class="rounded-circle profile_img_box">
		    		<img class="rounded-circle img_profile" alt="img" src="${stylePick.profile_img}">
		    	</div>
		    	<p class="profile_id">@${stylePick.member_nick}</p>
		    </a>
	    </div>
  	</c:forEach>
  </div>
</div>
<!-- 서브캐러셀 끝 -->
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.2/jquery.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.1.3/owl.carousel.min.js'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/js/all.min.js" integrity="sha512-naukR7I+Nk6gp7p5TMA4ycgfxaZBJ7MO5iC3Fp6ySQyKFHOGfpkSZkYVWV5R7u7cfAicxanwYQ5D1e17EfJcMA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

</body>
<script type="text/javascript" src="${contextPath}/resources/fix/js/snsbanner.js"></script>

</html>
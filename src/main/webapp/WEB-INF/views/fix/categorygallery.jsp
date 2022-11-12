<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>category Gallery</title>
	<link href="${pageContext.request.contextPath }/resources/fix/css/categorygallery.css" rel="stylesheet">
</head>
<body>

<div class="category_title">
	<h3>Category Picks!</h3>
</div>

<section class="gallery">
	<div class="row-gallery">
		<ul>
			<li>
				<a href="#item02">
					<img class="gallery-img" src="https://cdn.dribbble.com/users/545884/screenshots/3981307/lorena2.png" alt="">
				</a>
					<p class="prdt_item_title text-center text-primary">오픈예정</p>
			</li>

			<li>
				<a href="#item02">
					<img src="https://cdn.dribbble.com/users/545884/screenshots/3892302/contact.png" alt="">
				</a>
					<p class="prdt_item_title text-center text-primary">남성추천</p>
			</li>

			<li>
				<a href="#item02">
					<img src="https://cdn.dribbble.com/users/545884/screenshots/4154721/dive--001.png" alt="">
				</a>
					<p class="prdt_item_title text-center text-primary">여성추천</p>
			</li>
			<li>
				<a class="image" href="#item01">
					<img src="https://cdn.dribbble.com/users/545884/screenshots/4356121/darko--dr.jpg" alt="">
				</a>
					<p class="prdt_item_title text-center text-primary">럭키드로우</p>
			</li>
			<li>
				<a class="image" href="#item02">
					<img src="https://cdn.dribbble.com/users/545884/screenshots/3695553/news.png" alt="">
				</a>
					<p class="prdt_item_title text-center text-primary">브랜드관</p>
			</li>
			<li>
				<a class="image" href="#item01">
					<img src="https://cdn.dribbble.com/users/545884/screenshots/4360101/liberosis_--_12.png" alt="">
				</a>
					<p class="prdt_item_title text-center text-primary">정가아래</p>
			</li>
			<li>
				<a class="image" href="#item01">
					<img src="https://cdn.dribbble.com/users/545884/screenshots/3148799/technical-book.jpg" alt="">
				</a>
					<p class="prdt_item_title text-center text-primary">인기</p>
			</li>
			<li>
				<a class="image" href="#item01">
					<img src="https://cdn.dribbble.com/users/545884/screenshots/2883479/cover.jpg" alt="">
				</a>
					<p class="prdt_item_title text-center text-primary">니트</p>
			</li>
		</ul>
	</div> 
	<!-- / row -->
</section> <!-- / projects -->
<%-- <script type="text/javascript" src="${pageContext.request.contextPath }/resources/fix/js/categorygallery.js"></script> --%>
</body>
</html>
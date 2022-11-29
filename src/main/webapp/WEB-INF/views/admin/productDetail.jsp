<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<title>member management</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/admin/css/productDetail.css">
<script type="text/javascript">
	$(document).ready(function() {
		
		
		$("#buyNow").click(function(){
			var product_no1 =  $('.productSize.activ').attr('value');
			var product_no2 =  $('.optionColor.activ').attr('value');
			var product_no3 = $("#exampleSelect1 option:selected").val();
			alert(product_no1)
			alert(product_no2)
			alert(product_no3)
			if(product_no1 != ''){
				alert("입력해");
			}
			$("#frm").attr("action", "insertAf.jsp"); // attribute setting
			$("#frm").submit();
		})
		
		let toHtml = function(prdtOptions) {
			let tmp = "<div class='options'>"
			prdtOptions.forEach(function(prdtOption, index) {
				tmp += '<div class="option optionColor" id = "color" value="'+prdtOption.prdt_option_color+'"style="width:25px; color:' + prdtOption.prdt_option_color + ';"></div>'
			})

			return tmp += "</div>"
		}
		$(".productSize").click(function() { 
			var product_no = $(this).attr("data-productNo") // <li>태그는 <button>의 부모임.
			var prdt_option_size = $(this).attr("data-prdt-size") // <li>태그는 <button>의 부모임.

			const encoded = encodeURI("${contextPath}/admin/productColor/")
			$.ajax({
				type : 'GET',
				url : encoded,

				data : {
					product_no : product_no,
					prdt_option_size : prdt_option_size
				},
				success : function(result) {
					$("#optionColor").html(toHtml(result))
					
					$(function(){
					  $('.attrib .option').click(function(){
					    $(this).siblings().removeClass('activ');
					    $(this).addClass('activ');
					  })
					  $('.zoomControl').click(function(){
					    $(this).parents('.productCard').addClass('morph');
					    $('body').addClass('noScroll');
					  })
					  $('.closePreview').click(function(){
					    $(this).parents('.productCard').removeClass('morph');
					    $('body').removeClass('noScroll');
					  })
					  $('.movControl').click(function(){
					    let imgActiv = $(this).parents('.preview').find('.imgs img.activ');
					    if ($(this).hasClass('left')) {
					      imgActiv.index() == 0 ? $('.imgs img').last().addClass('activ') : $('.imgs img.activ').prev().addClass('activ');
					    } else {
					      imgActiv.index() == ($('.imgs img').length - 1) ? $('.imgs img').first().addClass('activ') : $('.imgs img.activ').next().addClass('activ');
					    }
					    imgActiv.removeClass('activ');
					  })
					})
 				},
 				error : function() {alert("error")}		//에러가 발생했을 때 호출될 함수
			})
		})

	})
		
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/fix/header.jsp"%>
	<!-- partial:index.partial.html -->
	<div class="container">
		<section class="productCard">
			<div class="container">
				<div class="info">
				<form action="${contextPath}/post/orderFormpage" method="post">
				<p class="header" name="product_no">${productInfo.product_no}</p>
					<h3 class="name" name="product_kind">
							<c:if test="${productInfo.product_kind eq 'T'}">TOP</c:if>
							<c:if test="${productInfo.product_kind eq 'B'}">PANTS</c:if>
							<c:if test="${productInfo.product_kind eq 'S'}">SHOES</c:if>
							<c:if test="${productInfo.product_kind eq 'A'}">ACC</c:if>
							<c:if test="${productInfo.product_kind eq 'K'}">KNIT</c:if>
					</h3>
					<h1 class="slogan" name="product_name">${productInfo.product_name}</h1>
					<p class="price" name ="product_price"><fmt:formatNumber value="${productInfo.product_price}" pattern="#,###"/>원</p>
					<div class="attribs">
						<div class="attrib size" name ="product_kind">
							<p class="header">Select Size</p>
							<div class="options" id="options">
								<c:forEach var="productSize" items="${productSize}" varStatus="sizeStatus">
									<div class="option productSize" name="prdt_option_size" data-productNo="${productInfo.product_no}" data-prdt-size="${productSize.prdt_option_size}" id="prdt_option_size" value="${productSize.prdt_option_size}">${productSize.prdt_option_size}</div>
								</c:forEach>
							</div>
						</div>
						<div class="attrib color">
							<p class="header">Select Color</p>
							<div id="optionColor" name="prdt_option_color"></div>
						</div>
					</div>
					<div class="quantity attribs">
                            <div class="form-group attrib">
						      <label for="exampleSelect1" class="form-label mt-4 attrib"></label>
						      <p class="header">Quantity</p>
						      <select class="form-select" id="exampleSelect1">
						        <option name="Quantity">1</option>
						        <option name="Quantity">2</option>
						        <option name="Quantity">3</option>
						        <option name="Quantity">4</option>
						        <option name="Quantity">5</option>
						      </select>
						    </div>
                        </div>
					<div class="buttons">
						<!-- <div class="button">Add to cart</div> -->
						<div class="button colored buyButton" id="buyNow">Buy now</div>
					</div>
				</form>
				</div>
				<div class="colorLayer"></div>
				<div class="preview">
					<h1 class="brand">EZEN</h1>
					<div class="imgs">
						<c:forEach var="productImg"  items="${productImg}" varStatus="status">	
							<img class="<c:if test='${status.index == 1}'>activ</c:if>" src="${contextPath}/resources/img/product/${productImg.prdt_img_name}" alt="img ${status.index + 1}"> 
						</c:forEach>
						
						<!-- <img src="https://firebasestorage.googleapis.com/v0/b/fotos-3cba1.appspot.com/o/tenis%2Ffila%2Ft3.png?alt=media&token=b2352ce3-be90-411d-b112-cfc6453760a0" alt="img 2"> 
						<img src="https://firebasestorage.googleapis.com/v0/b/fotos-3cba1.appspot.com/o/tenis%2Ffila%2Ft1.png?alt=media&token=9b161cad-8068-418e-a0d3-ee2e0975e6f4" alt="img 3"> -->
					</div>
					<div class="zoomControl"></div>
					<div class="closePreview"></div>
					<div class="movControls">
						<div class="movControl left"></div>
						<div class="movControl right"></div>
					</div>
				</div>
			</div>
		</section>
	</div>
	<!-- partial -->
	<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js'></script>
	<script type="text/javascript" src="${contextPath}/resources/admin/js/productDetail.js"></script>
	<%@ include file="/WEB-INF/views/fix/footer.jsp"%>
</body>
</html>
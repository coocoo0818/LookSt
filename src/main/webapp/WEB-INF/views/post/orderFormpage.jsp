<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- <script src="http://code.jquery.com/jquery-3.4.1.js"></script> -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<title>LOOKST</title>

<style type="text/css">
* {
  box-sizing: border-box;
}

html {font-size: 12px;}

body {
  margin: 20px 0;
  padding: 0;
  font-family: arial, sans-serif;
  overflow: scroll;
}

img {
  max-width: 100%;
  vertical-align: middle;
  border-radius: 4px;
}

a {text-decoration: none; color: #333333;}

a:hover {color: #f58551;}

button {
  background-color: #16cc9b;
  border: 2px solid #16cc9b;
  color: #ffffff;
  transition: all 0.25s linear;
  cursor: pointer;
}

button::after {
  position: relative;
  right: 0;
  content: " \276f";
  transition: all 0.15s linear;
}

button:hover {
  background-color: #f58551;
  border-color: #f58551;
}

button:hover::after {right: -5px;}

button:focus {outline: none;}

ul {
  padding: 0;
  margin: 0;
  list-style-type: none;
}

input {transition: all 0.25s linear;}

input[type=number]::-webkit-inner-spin-button,
input[type=number]::-webkit-outer-spin-button {
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  margin: 0;
}

input {outline: none;}

.container {
  width: 90%;
  margin: 0 auto;
  overflow: auto;
}

/* --- HEADER --- */
header.container {margin-bottom: 1.5rem;}

header .breadcrumb {color: #7d7d7d;}

header .breadcrumb li {float: left; padding: 0 6px;}

header .breadcrumb li:first-child {padding-left: 2px;}

header .breadcrumb li:not(:last-child)::after {content: " \276f"; padding-left: 8px;}

header .count {float: right; color: #333333;}

/* --- PRODUCT LIST --- */
.products {border-top: 1px solid #ddd;}

.products > li {padding: 1rem 0; border-bottom: 1px solid #ddd;}

.row {position: relative; overflow: auto; width: 100%;}

.col, .quantity, .remove {float: left;}

.col.left {width: 70%;}

.col.right {
  width: 30%;
  position: absolute;
  right: 0;
  top: calc(50% - 30px);
}

.detail {padding: 0 0.5rem; line-height: 2.2rem;}

.detail .name {font-size: 1.2rem;}

.detail .description {color: #7d7d7d; font-size: 1rem;}

.detail .price {font-size: 1.5rem;}

.quantity, .remove {width: 50%; text-align: center;}

.remove svg {width: 60px; height: 60px;}

.quantity > input {
  display: inline-block;
  width: 60px;
  height: 60px;
  position: relative;
  left: calc(50% - 30px);
  background: #fff;
  border: 2px solid #ddd;
  color: #7f7f7f;
  text-align: center;
  font: 600 1.5rem Helvetica, Arial, sans-serif;
}

.quantity > input:hover, .quantity > input:focus {border-color: #f58551;}

.close {
  fill: #7d7d7d;
  transition: color 150ms linear,
    background-color 150ms linear,
    fill 150ms linear,
    150ms opacity linear;
  cursor: pointer;
}

.close:hover {fill: #f58551;}

/* --- SUMMARY --- */
.promotion, .summary, .checkout {
  float: left;
  width: 100%;
  margin-top: 1.5rem;
}

.promotion > label {
  float: left;
  width: 100%;
  margin-bottom: 1rem;
}

.promotion > input {
  float: left;
  width: 80%;
  font-size: 1rem;
  padding: 0.5rem 0 0.5rem 1.8rem;
  border: 2px solid #16cc9b;
  border-radius: 2rem 0 0 2rem;
}

.promotion:hover > input {border-color: #f58551;}

.promotion > button {
  float: left;
  width: 20%;
  padding: 0.5rem 0;
  border-radius: 0 2rem 2rem 0;
}

.promotion:hover > button {border-color: #f58551; background-color: #f58551;}

.promotion > button::after {content: "\276f"; font-size: 1rem;}

.summary {font-size: 1.2rem; text-align: right;}

.summary ul li {padding: 0.5rem 0;}

.summary ul li span {display: inline-block; width: 30%;}

.summary ul li.total {font-weight: bold;}

.checkout {text-align: right;}

.checkout > button {font-size: 1.2rem; padding: 0.8rem 2.8rem; border-radius: 1.5rem;}

.empty-product {text-align: center;}

.empty-product > button {font-size: 1.3rem; padding: 10px 30px; border-radius: 5px;}

/* --- SMALL SCREEN --- */
@media all and (max-width: 599px) {
  .thumbnail img {
    display: none;
  }
  
  .quantity > input {width: 40px; height: 40px; left: calc(50% - 20px);}
  
  .remove svg {width: 40px; height: 40px;}
}

/* --- MEDIUM & LARGE SCREEN --- */
@media all and (min-width: 600px) {
  html {font-size: 14px;}

  .container {width: 75%; max-width: 960px;}

  .thumbnail, .detail {float: left;}

  .detail {width: 65%;}

  .promotion, .summary {width: 50%;}

  .checkout {idth: 100%;}

  .checkout, .summary {text-align: right;}
}

/* --- LARGE SCREEN --- */
@media all and (min-width: 992px) {
  html {
    font-size: 16px;
  }
}


/* 전체 가격 */
	 table{
	 	border-collapse: collapse;
	 	width: 100%;
	 }
	 .table_text_align_center{
				text-align: center;
	 }	
	 caption{
	    visibility: hidden;
	    width: 0;
	    height: 0;
	    font-size: 0;
	    line-height: 0;
	    overflow: hidden; 
	 }	  

	 .content_subject{
		height: 110px;
	    line-height: 110px;
	    background-color: #5080bd;
	    margin-bottom: 60px; 
	 
	 }
		 .content_subject span{ 
		    padding-left: 30 px;
		    display: inline-block;
		    color: white;
		    font-size: 50px;
		    font-weight: bolder; 
		 }
	 
	 .content_totalCount_section{
	 	margin-bottom: 12px;
	 }
	 .content_btn_section{
	 	margin-top: 20px;
	 	text-align: right;
	 }
	 	.content_btn_section a{
	    color: #fefeff;
	    background-color: #365fdd;
	    min-width: 125px;
	    padding: 17px 25px;
	    display: inline-block;
	    height: 39px;
	    font-size: 23px;
	    font-weight: bold;
	    text-align: center;
	    margin-right: 14px;
	    line-height: 39px; 	
	 	}
	 

	 .subject_table{
		font-size: 14px;
	    line-height: 20px;
	    width: 100%;
	    text-align: center; 	
	 }

		 th{
		text-align: center;
	    color: #333;
	    border-bottom: 1px solid #e7e7e7;
	    border-top: 1px solid #3084d9;
	    background: #f4f9fd;
	    padding: 2px 0;	 
		 }
		.td_width_1{
			width: 5%;
		}	 	 	 
		.td_width_2{
			width: 10%;
		}	 	 
		.td_width_3{
			width: 25%;
		}	 
		.td_width_4{
			width: 15%;
		}	
		.cart_table{
			font-size: 14px;
			line-height: 20px;
		}  
			.cart_table tr{
				height: 110px;
			}
			.price_td{
				padding-left: 5px;
			}
				.red_color{
					color : red;
				}
				.green_color{
					color : green;
				}
			.cart_table td{
				border-bottom: 1px solid #e7e7e7;
			}
			.quantity_div{
				position: relative;
			    width: 42px;
			    height: 25px;
			    text-align: left;
			    margin: 5px auto;		
			}
			.quantity_input{
				position: absolute;
				width: 27px;
			    height: 23px;
			    text-align: center;
			    border: 1px solid #c6c6c6;
			    border-right: 0px;
			    line-height: 19px;
			    font-size: 12px;
			    color: #4c4848;	
			    left: 0;
			}
			.quantity_btn{
				position: absolute;
			    border: 1px solid #aaa;
			    color: #3a60df;
			    width: 14px;
			    height: 13px;
			    padding: 0px;
			    background-color: #fff;
			    font-weight: bold;
			    font-size: 7px;
			    line-height: 6px;
			    vertical-align: middle;	
			}
			.plus_btn{
				top: 0;
				right: 0
			}
			.minus_btn{
				bottom: 0;
				right: 0
			}		
			.quantity_modify_btn{
				border: 1px solid #d0d0d0;
			    height: 13px;
			    line-height: 13px;
			    background-color: #fff;
			    text-align: center;
			    width: 28px;
			    display: inline-block;
			    padding: 3px 6px 2px;
			    margin-top: 3px;		
			}
			.table_text_align_center{
				text-align: center;
			}
			.delete_btn{
				width: 40px;		
			}
		
	.content_total_section{
		    background-color: rgb(227, 237, 247);
	}		
		.total_wrap{
			width: 80%;
		    margin: auto;
		    padding: 10px 0 10px 0;	
		}
			.total_wrap td{
				width : 50%;
			}
			.finalTotalPrice_span{
				color: #854A72;
				font-size: 17px;
				font-weight: bold;
			}
			.totalPoint_span{
				font-size: 17px;
				font-weight: bold;		
			}
			.boundary_div{
				font-size: 0;
			    border: 1px dotted #d1c7c7;
			    margin: 5px 0 5px 0;		
			}
</style>


</head>
<body>
	<%@ include file="/WEB-INF/views/fix/header.jsp"%>
	<script>
	function quanCheck(){
		alert(document.getElementById('quan').value())

	}
	
	</script>
	
	<script type="text/javascript">
	
	$('#checkoutbtn').click(function(){
		var new_form = $('<form></form>');
		new_form.attr("firstName",$('#firstName').val());
		new_form.attr("action","<c:url value='lookst/post/orderFormpage'></c:url>")
		new_form.attr("method","post");
		new_form.submit();
	})
	
	function Header({ itemCount }) {
		  return (
		    <header className="container">
		      <h1>Shopping Cart</h1>

		      <ul className="breadcrumb">
		        <li>Home</li>
		        <li>Shopping Cart</li>
		      </ul>

		      <span className="count">{itemCount} items in the bag</span>
		    </header>
		  );
		}

		function ProductList({ products, onChangeProductQuantity, onRemoveProduct }) {
		  return (
		    <section className="container">
		      <ul className="products">
		        {products.map((product, index) => {
		          return (
		            <li className="row" key={index}>
		              <div className="col left">
		                <div className="thumbnail">
		                  <a href="#">
		                    <img src={product.image} alt={product.name} />
		                  </a>
		                </div>
		                <div className="detail">
		                  <div className="name">
		                    <a href="#">{product.name}</a>
		                  </div>
		                  <div className="description">{product.description}</div>
		                  <div className="price">{formatCurrency(product.price)}</div>
		                </div>
		              </div>

		              <div className="col right">
		                <div className="quantity">
		                  <input
		                    type="text"
		                    className="quantity"
		                    step="1"
		                    value={product.quantity}
		                    onChange={(event) => onChangeProductQuantity(index, event)}
		                  />
		                </div>

		                <div className="remove">
		                  <svg
		                    onClick={() => onRemoveProduct(index)}
		                    version="1.1"
		                    className="close"
		                    x="0px"
		                    y="0px"
		                    viewBox="0 0 60 60"
		                    enableBackground="new 0 0 60 60"
		                  >
		                    <polygon points="38.936,23.561 36.814,21.439 30.562,27.691 24.311,21.439 22.189,23.561 28.441,29.812 22.189,36.064 24.311,38.186 30.562,31.934 36.814,38.186 38.936,36.064 32.684,29.812" />
		                  </svg>
		                </div>
		              </div>
		            </li>
		          );
		        })}
		      </ul>
		    </section>
		  );
		}
		

	</script>
	<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>

<script type="text/javascript">
	$(document).ready(function(){
		let totalPrice = 0;				// 총 가격
		let totalCount = 0;				// 총 상품 개수
		let deliveryPrice = 0;			// 배송비
		let finalTotalPrice = 0;		// 최종 가격
		
		$(".cart_info_td").each(function(index, element){
			
			// 총 가격
			totalPrice += parseInt($(element).find(".individual_totalPrice_input").val());
			// 총 개수
			totalCount += parseInt($(element).find(".individual_bookCount_input").val());
		});
		
		/* 배송비 결정 */
		if(totalPrice >= 50000){
			deliveryPrice = 0;
		} else if(totalPrice == 0){
			deliveryPrice = 0;
		} else {
			deliveryPrice = 3000;	
		}
		
		/* 최종가격 */
		finalTotalPrice = totalPrice + deliveryPrice;
		
		/* 값 삽입 */
		// 총 가격 
		$(".totalPrice_span").text(totalPrice.toLocaleString());
		// 총 개수
		$(".totalCount_span").text(totalCount);
		// 배송비
		$(".delivery_price").text(deliveryPrice);
		// 최종 가격(총 가격 + 배송비)
		$(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());
	});
</script>

	<div id="app">

  <!-- Header -->
  <header class="container">
    <h1>Order List</h1>
    <ul class="breadcrumb">
      <li>Home</li>
      <li>Shopping Cart</li>
    </ul>
    <!-- <span class="count">{{ itemCount }} items in the bag</span> -->
  </header>
  <!-- End Header -->
  
  <!-- Product List -->
  <section class="container">
  			<div class="content_subject"><span>장바구니</span></div>
			<!-- 장바구니 리스트 -->
			<div class="content_middle_section"></div>
			<!-- 장바구니 가격 합계 -->
			<!-- cartInfo -->
			<div class="content_totalCount_section">
				
				<table class="subject_table">
					<caption>표 제목 부분</caption>
					<tbody>

						<tr>
							<th class="td_width_1"></th>
							<th class="td_width_2"></th>
							<th class="td_width_3">상품명</th>
							<th class="td_width_4">가격</th>
							<th class="td_width_4">수량</th>
							<th class="td_width_4">합계</th>
							<th class="td_width_4">삭제</th>
						</tr>
					</tbody>
				</table>
				<table class="cart_table">
					<caption>표 내용 부분</caption>
					<tbody>
						<c:forEach var="orderPagePrdt" items="${orderPagePrdt}">
							<tr>
								<td class="td_width_1 cart_info_td">
									<%-- <input type="hidden" class="individual_bookPrice_input" value="${ci.bookPrice}"> --%>
									<input type="hidden" class="individual_salePrice_input" value="${orderPagePrdt.post_tag_price}">
									<input type="hidden" class="individual_bookCount_input" value="2">
									<input type="hidden" class="individual_totalPrice_input" value="${orderPagePrdt.post_tag_price * 2}">
									<%-- <input type="hidden" class="individual_point_input" value="${ci.point}"> --%>
									<input type="hidden" class="individual_totalPoint_input" value="${orderPagePrdt.post_tag_price}">
								</td>
								<td class="td_width_2">
									<div class="thumbnail">
							            <a href="#">
							             <img src="${contextPath}/resources/img/product/${OrderInfoDto.prdt_img_name}" style="height:150px; weight: 150px;">
							            </a>
							        </div>
								</td>
								<td class="td_width_3">${orderPagePrdt.post_tag_name}</td>
								<td class="td_width_4 price_td">
									<%-- <del>정가 : <fmt:formatNumber value="${orderPagePrdt.post_tag_price}" pattern="#,### 원" /></del><br> --%>
									판매가 : <span class="red_color" <%-- value="${orderPagePrdt.post_tag_price}" --%> pattern="#,### 원" />${orderPagePrdt.post_tag_price}원</span><br>
									<%-- 마일리지 : <span class="green_color"><fmt:formatNumber value="${ci.point}" pattern="#,###" /></span> --%>
								</td>
								<td class="td_width_4 table_text_align_center">
									<div class="table_text_align_center quantity_div">
										<input type="text" value="2<%-- ${ci.bookCount} --%>" class="quantity_input">	
										<button class="quantity_btn plus_btn">+</button>
										<button class="quantity_btn minus_btn">-</button>
									</div>
									<!-- <a class="quantity_modify_btn">변경</a> -->
								</td>
								<td class="td_width_4 table_text_align_center" value="${orderPagePrdt.post_tag_price}*2" pattern="#,### 원" />
									<%-- <fmt:formatNumber value="${orderPagePrdt.post_tag_price * 2}" pattern="#,### 원" /> --%>
								</td>z
								<td class="td_width_4 table_text_align_center delete_btn"><button>삭제</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<table class="list_table">
				</table>
			</div>
    <%-- <div v-if="products.length > 0">
      <ul class="products">
      <li class="row" v-for="(product, index) in products">
        <div class="col left">
          <c:forEach var="orderPagePrdt" items="${orderPagePrdt}">
	          <div class="thumbnail">
	            <a href="#">
	             <img src="${contextPath}/resources/img/product/${product_no.prdt_img_name}" style="height:150px; weight: 150px;">
	            </a>
	          </div>
          </c:forEach>
          <c:forEach var="orderPagePrdt" items="${orderPagePrdt}">
	          <div class="detail cart_info_td">
	            <div class="name"><a href="#">${orderPagePrdt.post_tag_name}</a></div>
	            <div class="description">${orderPagePrdt.product_info}</div>
	            <div class="price individual_totalPrice_input" id="prdt_price" value="${orderPagePrdt.post_tag_price}" pattern="#,### 원">${orderPagePrdt.post_tag_price}원</div>
	          </div>
          </c:forEach>
        </div>
	
        <div class="col right">
           <div class="quantity">
           		<tbody>
		          	<tr>
		          		<td class="td_width_4 table_text_align_center">
		          			<div class="table_text_align_center quantity_div">
								<input type="text" value="${ci.bookCount}" class="quantity_input">	
								<button class="quantity_btn plus_btn">+</button>
								<button class="quantity_btn minus_btn">-</button>
							</div>
							<a class="quantity_modify_btn">변경</a>
		          		</td>
          			</tr>
          		</tbody>
            <!-- <input type="number" class="individual_bookCount_input" id="quan11" step="1" onkeyup="quanCheck()"/> -->
           </div>
           
          <div class="remove">
            <svg @click="removeItem(index)" version="1.1" class="close" xmlns="//www.w3.org/2000/svg" xmlns:xlink="//www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 60 60" enable-background="new 0 0 60 60" xml:space="preserve"><polygon points="38.936,23.561 36.814,21.439 30.562,27.691 24.311,21.439 22.189,23.561 28.441,29.812 22.189,36.064 24.311,38.186 30.562,31.934 36.814,38.186 38.936,36.064 32.684,29.812"></polygon></svg>
          </div>
        </div>
      </li>
    </ul>
    </div> --%>
    <!-- 전체가격기능 구현 -->
    <div class="content_total_section">
    	<div class="total_wrap">
    		<table>
    			<tr>
    				<td>
    					<table>
    						<tr>
								<td>총 상품 가격</td>
									<td>
										<span class="totalPrice_span">70000</span> 원
									</td>
							</tr>
							<tr>
								<td>배송비</td>
								<td>
									<span class="delivery_price">3000</span>원
								</td>
							</tr>
							<tr>
								<td>총 주문 상품수</td>
								<td>
									<span class="totalKind_span"></span>총 <span class="totalCount_span"></span>권
								</td>
							</tr>		
    					</table>
    				</td>
    				<td>
    					<table>
    						<tr>
    							<td></td>
								<td></td>
    						</tr>
    					</table>
    				</td>
    			</tr>
    		</table>
    		<div class="boundary_div">구분선</div>
    			<table>
    				<tr>
    					<td>
    						<table>
    							<tbody>
    								<tr>
    									<td>
    										<strong>총 결제 예상 금액</strong>
    									</td>
    									<td>
											<span class="finalTotalPrice_span">70000</span> 원
										</td>
    								</tr>
    							</tbody>
    						</table>
    					</td>
    				</tr>
    			</table>
    	</div>
    </div>
    
    <div v-else class="empty-product">
      <h3>돈 더 써볼까요?</h3>
      <button>돈쭐을 내주마!</button>
    </div>
  </section>
  <!-- End Product List -->
  

  <!-- End Summary -->
</div><hr/>

<div class="container">
		<div class="row g-5">
      <div class="col-md-5 col-lg-4 order-md-last">
        <h4 class="d-flex justify-content-between align-items-center mb-3">
          <span class="text-primary">Your cart</span>
          <!-- <span class="badge bg-primary rounded-pill">3</span> -->
        </h4>
        <ul class="list-group mb-3">
          <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
              <h6 class="my-0">금액</h6>
              <small class="text-muted">Brief description</small>
            </div>
            <c:forEach var="orderPagePrdt" items="${orderPagePrdt}">
            <span class="text-muted totalPrice_span">${orderPagePrdt.post_tag_price}원</span>
            </c:forEach>
          </li>
          <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
              <h6 class="my-0">수량</h6>
              <small class="text-muted">Brief description</small>
            </div>
            <span class="text-muted quantity totalKind_span">2</span>
          </li>
          <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
              <h6 class="my-0">배송비</h6>
              <small class="text-muted">Brief description</small>
            </div>
            <span class="text-muted delivery_price">₩3,000</span>
          </li>
          <li class="list-group-item d-flex justify-content-between finalTotalPrice_span">
             <div>
              <h6 class="my-0">총 결제액</h6>
              <small class="text-muted">Brief description</small>
            </div>
          </li>
        </ul>
        <input type="button" id="checkoutbtn" class="w-100 btn btn-primary btn-lg" value="Continue to checkout"/>
      </div>
      
      <div class="col-md-7 col-lg-8">
        <h4 class="mb-3">주문자 정보</h4>
        <form class="needs-validation" novalidate="">
          <div class="row g-3">
            <div class="col-sm-6">
              <label for="firstName" class="form-label"><strong>고객명</strong></label>
              <input type="text" class="form-control" id="firstName" placeholder="" value="" required="">
              <div class="invalid-feedback">
                Valid first name is required.
              </div>
            </div>

            <div class="col-12">
              <label for="phoneNum" class="form-label"><strong>연락처</strong></label>
              <div class="input-group has-validation">
                <span class="input-group-text">H.P</span>
                <input type="text" class="form-control" id="username" placeholder="연락처를 입력해주세요" required="">
              <div class="invalid-feedback">
                  Your username is required.
                </div>
              </div>
            </div>

            <div class="col-12">
              <label for="email" class="form-label">Email <span class="text-muted">(Optional)</span></label>
              <input type="email" class="form-control" id="email" placeholder="you@example.com">
              <div class="invalid-feedback">
                Please enter a valid email address for shipping updates.
              </div>
            </div>
            <div class="col-12">
            	<label for="address" class="form-label"><strong>배송지</strong></label>
            		<input type="button" class="btn btn-light" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" ><br>
            		<div>
            			<input type="text" class="form-control" id="sample6_postcode" placeholder="우편번호"><br>
            		</div>
            		<div>
            			<input type="text" class="form-control" id="sample6_address" placeholder="주소"><br>
            		</div>
            		<div>
            			<input type="text" class="form-control" id="sample6_detailAddress" placeholder="상세주소"><br>
            		</div>
					<div>
            			<input type="text" class="form-control" id="sample6_extraAddress" placeholder="참고항목">
            		</div>
              <div class="invalid-feedback">
                Please enter your shipping address.
              </div>
            </div>

            <div class="col-12">
              <label for="address2" class="form-label"><strong>배송메세지</strong><span class="text-muted"></span></label>
              <input type="text" class="form-control" id="address2" placeholder="메세지를 남겨주세요">
            </div>
		
            

          <hr class="my-4">

          <div class="form-check">
            <input type="checkbox" class="form-check-input" id="same-address">
            <label class="form-check-label" for="same-address">Shipping address is the same as my billing address</label>
          </div>

          <div class="form-check">
            <input type="checkbox" class="form-check-input" id="save-info">
            <label class="form-check-label" for="save-info">배송지 정보 기억하기</label>
          </div>

          <hr class="my-4">

          <h4 class="mb-3">결제수단</h4>

          <div class="my-3">
            <div class="form-check">
              <input id="credit" name="paymentMethod" type="radio" class="form-check-input" checked="" required="">
              <label class="form-check-label" for="credit">체크/신용카드</label>
            </div>
            <div class="form-check">
              <input id="debit" name="paymentMethod" type="radio" class="form-check-input" required="">
              <label class="form-check-label" for="debit">무통장입금</label>
            </div>
          </div>
          <hr class="my-4">
		 
        </form>
      </div>
    </div>
</div>






		<a href="<c:url value="/admin/memberlist"/>">admin</a>
		<%@ include file="/WEB-INF/views/fix/footer.jsp"%>
</body>
</html>
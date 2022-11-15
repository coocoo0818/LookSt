<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
<title>order</title>
<style>
/* Global settings */
 
.product-image {
  float: left;
  width: 20%;
}
 
.product-details {
  float: left;
  width: 37%;
}
 
.product-price {
  float: left;
  width: 19%;
}
 
.product-quantity {
  float: left;
  width: 10%;
}
 
.product-removal {
  float: left;
  width: 9%;
}
 
.product-line-price {
  float: left;
  width: 14%;
  text-align: right;
}
 
/* This is used as the traditional .clearfix class */
.group:before, .shopping-cart:before, .column-labels:before, .product:before, .totals-item:before,
.group:after,
.shopping-cart:after,
.column-labels:after,
.product:after,
.totals-item:after {
  content: '';
  display: table;
}
 
.group:after, .shopping-cart:after, .column-labels:after, .product:after, .totals-item:after {
  clear: both;
}
 
.group, .shopping-cart, .column-labels, .product, .totals-item {
  zoom: 1;
}
 
/* Apply clearfix in a few places */
/* Apply dollar signs */
.product .product-price::after, .product .product-line-price::after, .totals-value::after {
  content: '원';
}
 
/* Body/Header stuff */
body {
  padding: 0px -1px 30px 100px;
 
  font-weight: 100;
}
 
h1 {
  font-weight: 100;
 
}
 
label {
  color: black;
}
 
.shopping-cart {
  margin-top: 45px;
}
 
/* Column headers */
.column-labels label {
  padding-bottom: 20px;
  margin-bottom: 10px;
  border-bottom: 1px solid black;
}
/* .column-labels .product-image, .column-labels .product-details, .column-labels .product-removal {
  text-indent: -9999px;
}*/
 
/* Product entries */
.product {
  margin-bottom: 20px;
  padding-bottom: 10px;
  border-bottom: 1px solid black;
}
.product .product-image {
  text-align: inherit;
}
.product .product-image img {
  width: 100px;
}
.product .product-details .product-title {
  margin-right: 20px;
  font-family: "HelveticaNeue-Medium", "Helvetica Neue Medium";
}
.product .product-details .product-description {
  margin: 5px 20px 5px 0;
  line-height: 1.4em;
}
.product .product-quantity input {
  width: 40px;
}
.product .remove-product {
  border: 0;
  padding: 4px 8px;
  background-color: #c66;
  color: black;
  font-family: "HelveticaNeue-Medium", "Helvetica Neue Medium";
  font-size: 12px;
  border-radius: 3px;
}
.product .remove-product:hover {
  background-color: #a44;
}
 
/* Totals section */
.totals .totals-item {
  float: right;
  clear: both;
  width: 100%;
  margin-bottom: 10px;
  
}
.totals .totals-item label {
  float: left;
  clear: both;
  width: 79%;
  text-align: right;
}
.totals .totals-item .totals-value {
  float: right;
  width: 21%;
  text-align: right;
}
.totals .totals-item-total {
  font-family: "HelveticaNeue-Medium", "Helvetica Neue Medium";
}
 
.checkout {
  
  border: 0;
  margin-top: 20px;
  margin-bottom: 20px;
  padding: 6px 25px;
  background-color: black;
  color: #fff;
  font-size: 25px;
  border-radius: 3px;
}
 
.checkout:hover {
  background-color: #494;
}
 
/* Make adjustments for tablet */
@media screen and (max-width: 650px) {
  .shopping-cart {
    margin: 0;
    padding-top: 20px;
    border-top: 1px solid black;
  }
 
  .column-labels {
    display: none;
  }
 
  .product-image {
    float: right;
    width: auto;
  }
  .product-image img {
    margin: 0 0 10px 10px;
  }
 
  .product-details {
    float: none;
    margin-bottom: 10px;
    width: auto;
  }
 
  .product-price {
    clear: both;
    width: 70px;
  }
 
  .product-quantity {
    width: 100px;
  }
  .product-quantity input {
    margin-left: 20px;
  }
 
  .product-quantity:before {
    content: 'x';
  }
 
  .product-removal {
    width: auto;
  }
 
  .product-line-price {
    float: right;
    width: 70px;
  }
}
/* Make more adjustments for phone */
@media screen and (max-width: 350px) {
  .product-removal {
    float: right;
  }
 
  .product-line-price {
    float: right;
    clear: left;
    width: auto;
    margin-top: 10px;
  }
 
  .product .product-line-price::after {
    content: '원';
  }
 
  .totals .totals-item label {
    width: 60%;
  }
  .totals .totals-item .totals-value {
    width: 40%;
  }
  
  @import url('https://fonts.googleapis.com/css?family=Arimo');
$coral: #eb9478;
$maroon: #8e2807;
$title: #493b76;

body {
    display: flex;
    justify-content: center;
}

.wrapper {
    margin-top: 5%;
    width: 80%;
    display: flex;
    justify-content: center;
    font-family: "Arimo";
    background-color: $coral;
    -webkit-box-shadow: 9px 13px 25px 0px rgba(0, 0, 0, 0.18);
    -moz-box-shadow: 9px 13px 25px 0px rgba(0, 0, 0, 0.18);
    box-shadow: 9px 13px 25px 0px rgba(0, 0, 0, 0.18);

}

@keyframes slideUp {
    0% {
        -webkit-transform: translateY(100%);
        transform: translateY(100%);
        visibility: visible;
    }

    100% {
        -webkit-transform: translateY(0);
        transform: translateY(0);

    }
}

.container {
    width: 65%;
    padding: 5% 10%;
    
}

h1 {
    align-self: center;
}

form {
    width: 100%;

    >* {
        margin-top: 20px;
    }

    input {
        width: 100%;
        min-height: 25px;
        border: 0;
        font-size: 1rem;
        letter-spacing: .15rem;
        font-family: "Arimo";
        margin-top: 5px;
        color: $maroon;
        border-radius: 4px;
    }

    label {
        text-transform: uppercase;
        font-size: 12px;
        letter-spacing: 2px;
        color: $maroon;
    }

    h1 {
        font-size: 24px;
        line-height: 10px;
        color: $title;
        letter-spacing: 1px;
    }

    h1:nth-of-type(2) {
        margin-top: 10%;
    }
}

.name {
    justify-content: space-between;
    display: flex;
    width: 100%;

    div {
        width: 45%;
    }
}

.address-info {
    display: flex;
    justify-content: space-between;
    width: 10%;
 
}

.cc-info {
    display: flex;
    justify-content: space-between;

    div {
        width: 45%;
    }
}

.btns {
    display: flex;
    flex-direction: column;
    align-items: flex-end;

    button {
        margin: 3px 0;
        height: 30px;
        width: 40%;
        color: #cfc9e1;
        background-color: #4a3b76;
        text-transform: uppercase;
        border: 0;
        border-radius: .3rem;
        letter-spacing: 2px;

        &:hover {
            animation-name: btn-hov;
            animation-duration: 550ms;
            animation-fill-mode: forwards;
        }
    }
}

@keyframes btn-hov {
    100% {
        background-color: #cfc9e1;
        color: #4a3b76;
        transform: scale(1.05)
    }
}

input:focus,
button:focus {
    outline: none;
}

@media (max-width: 736px) {
    .wrapper {
        width: 100%;
    }

    .container {
        width: 100%;
    }

    .btns {
        align-items: center;

        button {
            width: 50%;
        }
    }

    form h1 {
        text-align: center;
    }

    .name,
    .address-info,
    .cc-info {
        flex-direction: column;
        width: 100%;
        justify-content: space-between;

        div {
            align-items: center;
            flex-direction: column;
            width: 100%;
            display: flex;
        }
    }

    .street,
    .cc-num {
        text-align: center;
    }

    input {
        margin: 5px 0;
        min-height: 30px;
    }
}

#orderform {
    margin-top: 50px;
}

#orderform .delivery_info_caption {
    display: flex;
    justify-content: space-between;
    padding: 7px 10px;
    font-size: 13px;
}
#orderform .delivery_info_caption .delivery_info_caption_right span{
    color: red;
}

#orderform .delivery_info_table {
    border-top: 1px solid var(--border-color-basic2);
}

#orderform .delivery_info_table th, td {
    font-weight: normal;
    padding: 7px 10px;
    border-bottom: 1px solid var(--border-color-basic2);
}

#orderform .delivery_info_table th{
    text-align: left;
    border-right: 1px solid var(--border-color-basic2);
}

#orderform .delivery_info_table th label span {
    font-size: 10px;
    color: red;
}

#orderform .delivery_info_table td .address_margin { /*주소, 상세주소 부분*/
    margin-top: 5px;
    width: 460px;
}

#orderform .delivery_info_table .address_choice {
    padding: 4px 0;
    display: flex;
}

#orderform .delivery_info_table .address_choice label{
    position: relative;
    top: -2px;
    margin-right: 5px;
}

#orderform .delivery_info_table .adjust_height {
    vertical-align: text-top;
}

#sample6_postcode {
    width: 70px;
}

#orderform .delivery_info_table td .address_home_number {
    width: 70px;
}

#orderform .delivery_info_table td .address_phone_number {
    width: 70px;
}
input {
  width:100px;
  height:20px;

}

</style>

</head>

<body>
<%@ include file="/WEB-INF/views/fix/header.jsp" %>
  <container>
  <center>
  <h1>
    주문정보
  </h1>
</center>
</div>
	 <br>
	<div class="shopping-cart">
  
	  <div class="column-labels">
		<label class="product-image">상품사진</label>
		<label class="product-details">상품명</label>
		<label class="product-price">가격</label>
		<label class="product-quantity">수량</label>
		<label class="product-line-price">합계금액</label>
    <label class="totals"></label>
	  </div>
  </br>
	  <div class="product">
		<div class="product-image">
		  <img src="">
		</div>
		<div class="product-details">
		  <div class="product-title">Nike</div>
		  <p class="product-description">아메카지2</p>
		</div>
		<div class="product-price">30,000</div>
		<div class="product-quantity">
		  <input type="number" value="2" min="1">
		</div>
		<div class="product-removal">

		</div>
		<div class="product-line-price">60,000</div>
	  </div>
	 
	  <div class="product">
		<div class="product-image">
		  <img src="">
		</div>
		<div class="product-details">
		  <div class="product-title">ULTRABOOST</div>
		  <p class="product-description">아메카지2</p>
		</div>
		<div class="product-price">22,000</div>
		<div class="product-quantity">
		  <input type="number" value="1" min="1">
		</div>
		<div class="product-removal">

		</div>
		<div class="product-line-price">22,000</div>
	  </div>
	 
	  <div class="totals">
		<div class="totals-item">
		  <label>상품금액</label>
		  <div class="totals-value" id="cart-subtotal">82,000</div>
		</div>
		<div class="totals-item">
		  <label>배송비</label>
		  <div class="totals-value" id="cart-tax">0</div>
		</div>
		<!--<div class="totals-item">
		  <label>합계금</label>
		  <div class="totals-value" id="cart-shipping">15.00</div>
		</div>-->
		<div class="totals-item totals-item-total">
		  <label>결제금액</label>
		  <div class="totals-value" id="cart-total">82,000</div>
		</div>
	  </div>
  </div>
    <div class="wrapper">
      
        <center>
              <h1>
                  배송정보
              </h1>
            </center>
            <p>
            <div class="container">
              <div class="name">
                  <div>
                    
                    <label for="f-name">이름</label>     
                      <input type="text" name="name" value="" size=7 maxlength=7 placeholder="받으시는분" >
                  </div>
                </p>
              </div>
              <p>
              <div class="street">
                  <label for="name">우편번호</label>
                  <input type="text" name="address" value="" size=7 maxlength=7 placeholder="우편번호">
                  <button type="button" onclick="sample6_execDaumPostcode()" id="postbtn"><span>우편번호</span><i class="fas fa-chevron-right"></i></button><br>
              </div>
              </p>
              <div class="street">
                  <p>
                      <label for="city">기본주소</label>
                      <input type="text" name="city" value="" size=30 maxlength=30 placeholder="기본주소">
                  </p>
                  <p>
                  <div>
                      <label for="state">상세주소</label>
                      <input type="text" name="state" value="" size=40 maxlength=30 placeholder="상세주소">
                  </div>
                  </p>
                  <!--<div>
                      <label for="state">연락처</label>
                      <input type="text" name="number" placeholder="휴대폰번호">
                  </div>-->
                  <p>
                  
                      <th><label for="address_phone_number">휴대전화</label></th>
                      <td>
                        <input type="text" name="phone" value="010" size=3 maxlength=4>
                          </select>
                          -
                          <input type="text" name="phone" value="" size=6 maxlength=4>
                          -
                          <input type="text" name="phone" value="" size=6 maxlength=4>
                      </td>
              </p>
              </div>
              </div>
              <center>
              <h1>
                  <i class="far fa-credit-card"></i> 결제정보
              </h1>
            </center>
            <div class="container">
            <p>
              <div class="cc-num">
                  <label for="card-num">카드번호</label>
                  <input type="text" name="card-num" value="" size=24 maxlength=30 placeholder="0000-0000-0000-0000">
              </div>
              </p>
              <p>
              <div class="cc-info">
                  <div>
                      <label for="card-num">유효기간</label>
                      <input type="text" name="expire" value="" size=6 maxlength=6 placeholder="mm/yy">
                  </div>
                  </p>
                  <div>
                  <p>
                      <label for="card-num">CCV</label>
                      <input type="text" name="security" value="" size=4 maxlength=4 placeholder="000">
                  </div>
              </div>
				</p>
          </form>
      </div>
  </div>
  </div>
    </container>
		   <center>
		  <button class="checkout">주문하기</button>
	 </center>
	</div>


<%@ include file="/WEB-INF/views/fix/footer.jsp" %>
</body>
</html>
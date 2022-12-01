<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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

		function Summary({
		  subTotal,
		  discount,
		  tax,
		  onEnterPromoCode,
		  checkPromoCode
		}) {
		  const total = subTotal - discount + tax;

		  return (
		    <section className="container">
		      <div className="promotion">
		        <label htmlFor="promo-code">Have A Promo Code?</label>
		        <input type="text" onChange={onEnterPromoCode} />
		        <button type="button" onClick={checkPromoCode} />
		      </div>

		      <div className="summary">
		        <ul>
		          <li>
		            Subtotal <span>{formatCurrency(subTotal)}</span>
		          </li>
		          {discount > 0 && (
		            <li>
		              Discount <span>{formatCurrency(discount)}</span>
		            </li>
		          )}
		          <li>
		            Tax <span>{formatCurrency(tax)}</span>
		          </li>
		          <li className="total">
		            Total <span>{formatCurrency(total)}</span>
		          </li>
		        </ul>
		      </div>

		      <div className="checkout">
		        <button type="button">Check Out</button>
		      </div>
		    </section>
		  );
		}

		const PRODUCTS = [
		  {
		    image: "https://via.placeholder.com/200x150",
		    name: "PRODUCT ITEM NUMBER 1",
		    description: "Description for product item number 1",
		    price: 5.99,
		    quantity: 2
		  },
		  {
		    image: "https://via.placeholder.com/200x150",
		    name: "PRODUCT ITEM NUMBER 2",
		    description: "Description for product item number 1",
		    price: 9.99,
		    quantity: 1
		  }
		];
		const PROMOTIONS = [
		  {
		    code: "SUMMER",
		    discount: "50%"
		  },
		  {
		    code: "AUTUMN",
		    discount: "40%"
		  },
		  {
		    code: "WINTER",
		    discount: "30%"
		  }
		];
		const TAX = 5;

		function Page() {
		  const CLONE_PRODUCTS = JSON.parse(JSON.stringify(PRODUCTS));
		  const [products, setProducts] = React.useState(CLONE_PRODUCTS);
		  const [promoCode, setPromoCode] = React.useState("");
		  const [discountPercent, setDiscountPercent] = React.useState(0); 
		  const itemCount = products.reduce((quantity, product) => {
		    return quantity + +product.quantity;
		  }, 0);
		  const subTotal = products.reduce((total, product) => {
		    return total + product.price * +product.quantity;
		  }, 0);
		  const discount = (subTotal * discountPercent) / 100;

		  onChangeProductQuantity = (index, event) => {
		    const value = event.target.value;
		    const valueInt = parseInt(value);
		    const cloneProducts = [...products];

		    // Minimum quantity is 1, maximum quantity is 100, can left blank to input easily
		    if (value === "") {
		      cloneProducts[index].quantity = value;
		    } else if (valueInt > 0 && valueInt < 100) {
		      cloneProducts[index].quantity = valueInt;
		    }

		    setProducts(cloneProducts);
		  };

		  onRemoveProduct = (i) => {
		    const filteredProduct = products.filter((product, index) => {
		      return index != i;
		    });

		    setProducts(filteredProduct);
		  };

		  onEnterPromoCode = (event) => {
		    setPromoCode(event.target.value);
		  };

		  checkPromoCode = () => {
		    for (var i = 0; i < PROMOTIONS.length; i++) {
		      if (promoCode === PROMOTIONS[i].code) {
		        setDiscountPercent(parseFloat(PROMOTIONS[i].discount.replace("%", "")));

		        return;
		      }
		    }

		    alert("Sorry, the Promotional code you entered is not valid!");
		  };

		  return (
		    <div>
		      <Header itemCount={itemCount} />

		      {products.length > 0 ? (
		        <div>
		          <ProductList
		            products={products}
		            onChangeProductQuantity={onChangeProductQuantity}
		            onRemoveProduct={onRemoveProduct}
		          />

		          <Summary
		            subTotal={subTotal}
		            discount={discount}
		            tax={TAX}
		            onEnterPromoCode={onEnterPromoCode}
		            checkPromoCode={checkPromoCode}
		          />
		        </div>
		      ) : (
		        <div className="empty-product">
		          <h3>There are no products in your cart.</h3>
		          <button onClick={() => setProducts(PRODUCTS)}>Shopping now</button>
		        </div>
		      )}
		    </div>
		  );
		}

		ReactDOM.render(<Page />, document.getElementById("root"));

		function formatCurrency(value) {
		  return Number(value).toLocaleString("en-US", {
		    style: "currency",
		    currency: "USD"
		  });
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
    <div v-if="products.length > 0">
      <ul class="products">
      <li class="row" v-for="(product, index) in products">
      
        <div class="col left">
          <c:forEach var="orderPagePrdt" items="${orderPagePrdt}">
          <div class="thumbnail">
            <a href="#">
             <img src="${contextPath}/resources/img/product/${orderPagePrdt.post_tag_img}" style="height:150px; weight: 150px;">
            </a>
          </div>
          </c:forEach>
          <c:forEach var="orderPagePrdt" items="${orderPagePrdt}">
	          <div class="detail">
	            <div class="name"><a href="#">${orderPagePrdt.post_tag_name}</a></div>
	            <div class="description">${orderPagePrdt.product_info}</div>
	            <div class="price" id="prdt_price" value="${orderPagePrdt.post_tag_price}">${orderPagePrdt.post_tag_price}원</div>
	          </div>
          </c:forEach>
        </div>
	
        <div class="col right">
           <div class="quantity">
            <input type="number" id="quan11" step="1" onkeyup="quanCheck()"/>
           </div>
           
          <div class="remove">
            <svg @click="removeItem(index)" version="1.1" class="close" xmlns="//www.w3.org/2000/svg" xmlns:xlink="//www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 60 60" enable-background="new 0 0 60 60" xml:space="preserve"><polygon points="38.936,23.561 36.814,21.439 30.562,27.691 24.311,21.439 22.189,23.561 28.441,29.812 22.189,36.064 24.311,38.186 30.562,31.934 36.814,38.186 38.936,36.064 32.684,29.812"></polygon></svg>
          </div>
        </div>
      </li>
    </ul>
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
          <span class="badge bg-primary rounded-pill">3</span>
        </h4>
        <ul class="list-group mb-3">
          <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
              <h6 class="my-0">금액</h6>
              <small class="text-muted">Brief description</small>
            </div>
            <c:forEach var="orderPagePrdt" items="${orderPagePrdt}">
            <span class="text-muted">${orderPagePrdt.post_tag_price}원</span>
            </c:forEach>
          </li>
          <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
              <h6 class="my-0">수량</h6>
              <small class="text-muted">Brief description</small>
            </div>
            <span class="text-muted quantity">₩8</span>
          </li>
          <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
              <h6 class="my-0">배송비</h6>
              <small class="text-muted">Brief description</small>
            </div>
            <span class="text-muted">₩3,000</span>
          </li>
          <li class="list-group-item d-flex justify-content-between">
            <span>총 결제액</span>
            <strong>₩20</strong>
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
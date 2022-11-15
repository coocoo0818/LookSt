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

html {
  box-sizing: border-box;
}

*,
*:before,
*:after {
  box-sizing: inherit;
}

body {
  font-family: system-ui, -apple-system, BlinkMacSystemFont, "Avenir Next", "Avenir", "Segoe UI", "Lucida Grande", "Helvetica Neue", "Helvetica", "Fira Sans", "Roboto", "Noto", "Droid Sans", "Cantarell", "Oxygen", "Ubuntu", "Franklin Gothic Medium", "Century Gothic", "Liberation Sans", sans-serif;
  color: rgba(0, 0, 0, 0.87);
}

a {
  color: black;
}
a:hover, a:focus {
  color: black;
}

.container {
  margin: 5% 3%;
}
@media (min-width: 48em) {
  .container {
    margin: 2%;
  }
}
@media (min-width: 75em) {
  .container {
    margin: 2em auto;
    max-width: 75em;
  }
}

.responsive-table {
  width: 100%;
  margin-bottom: 1.5em;
  border-spacing: 0;

}
@media (min-width: 48em) {
  .responsive-table {
    font-size: 0.9em;
  }
}
@media (min-width: 62em) {
  .responsive-table {
    font-size: 1em;
  }
}
.responsive-table thead {
  position: absolute;
  clip: rect(1px 1px 1px 1px);
  /* IE6, IE7 */
  padding: 0;
  border: 0;
  height: 1px;
  width: 1px;
  overflow: hidden;
}
@media (min-width: 48em) {
  .responsive-table thead {
    position: relative;
    clip: auto;
    height: auto;
    width: auto;
    overflow: auto;
  }
}
.responsive-table thead th {
  background-color: black;
  border: 1px solid black;
  font-weight: normal;
  text-align: center;
  color: white;
}
.responsive-table thead th:first-of-type {
  text-align: left;
}
.responsive-table tbody,
.responsive-table tr,
.responsive-table th,
.responsive-table td {
  display: block;
  padding: 0;
  text-align: left;
  white-space: normal;
  
        
}
@media (min-width: 48em) {
  .responsive-table tr {
    display: table-row;
  }
}
.responsive-table th,
.responsive-table td {
  padding: 0.5em;
  vertical-align: middle;
}
@media (min-width: 30em) {
  .responsive-table th,
.responsive-table td {
    padding: 0.75em 0.5em;
  }
}
@media (min-width: 48em) {
  .responsive-table th,
.responsive-table td {
    display: table-cell;
    padding: 0.5em;
  }
}
@media (min-width: 62em) {
  .responsive-table th,
.responsive-table td {
    padding: 0.75em 0.5em;
  }
}
@media (min-width: 75em) {
  .responsive-table th,
.responsive-table td {
    padding: 0.75em;
  }
}
.h2 {
  margin-bottom: 1em;
  font-size: 1em;
  font-weight: bold;
  text-align: center;
}
@media (min-width: 48em) {
  .responsive-table caption {
    font-size: 1.5em;
  }
}
.responsive-table tfoot {
  font-size: 0.8em;
  font-style: italic;
}
@media (min-width: 62em) {
  .responsive-table tfoot {
    font-size: 0.9em;
  }
}
@media (min-width: 48em) {
  .responsive-table tbody {
    display: table-row-group;
  }
}
.responsive-table tbody tr {
  margin-bottom: 1em;
}
@media (min-width: 48em) {
  .responsive-table tbody tr {
    display: table-row;
    border-width: 1px;
  }
}
.responsive-table tbody tr:last-of-type {
  margin-bottom: 0;
}
@media (min-width: 48em) {
  .responsive-table tbody tr:nth-of-type(even) {
    background-color: white;
  }
}
.responsive-table tbody th[scope=row] {
  background-color: black;
  color: white;
}
@media (min-width: 30em) {
  .responsive-table tbody th[scope=row] {
    border-left: 1px solid black;
    border-bottom: 1px solid black;
  }
}
@media (min-width: 48em) {
  .responsive-table tbody th[scope=row] {
    background-color: white;
    color: #000001;
    text-align: left;
  }
}
.responsive-table tbody td {
  text-align: right;
}
@media (min-width: 48em) {
  .responsive-table tbody td {
   
    border-bottom: 1px solid black;
    text-align: center;
  }
}
@media (min-width: 48em) {
  .responsive-table tbody td:last-of-type {
    border-right: 1px solid black
  }
}
.responsive-table tbody td[data-type=currency] {
  text-align: right;
}
.responsive-table tbody td[data-title]:before {
  content: attr(data-title);
  float: left;
  font-size: 0.8em;
  color: rgba(0, 0, 0, 0.54);
}
@media (min-width: 30em) {
  .responsive-table tbody td[data-title]:before {
    font-size: 0.9em;
  }
}
@media (min-width: 48em) {
  .responsive-table tbody td[data-title]:before {
    content: none;
  }
}
.card-img-top {
      max-height: 100px;
      max-width: 100px;
   }

.pagination {
 
display: flex;

padding-left: 0;
list-style: none;
justify-content: center;
}

.page-link {
	position: relative;
	display: block;
	color: black;
	text-decoration: none;
	background-color: #fff;
	border: 1px solid #dee2e6;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}
@media (prefers-reduced-motion: reduce) {
.page-link {
    transition: none;
}
}
.page-link:hover {
	z-index: 2;
	color: #0a58ca;
	background-color: #e9ecef;
	border-color: #dee2e6;
}
.page-link:focus {
	z-index: 3;
	color: #0a58ca;
	background-color: #e9ecef;
	outline: 0;
	box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.25);
}

.page-item:not(:first-child) .page-link {
	margin-left: -1px;
}
.page-item.active .page-link {
	z-index: 3;
	color: #fff;
	background-color: #0d6efd;
	border-color: #0d6efd;
}
.page-item.disabled .page-link {
	color: #6c757d;
	pointer-events: none;
	background-color: #fff;
	border-color: #dee2e6;
}

.page-link {
	padding: 0.375rem 0.75rem;
}

.page-item:first-child .page-link {
	border-top-left-radius: 0.25rem;
	border-bottom-left-radius: 0.25rem;
}
.page-item:last-child .page-link {
	border-top-right-radius: 0.25rem;
	border-bottom-right-radius: 0.25rem;
}

.pagination-lg .page-link {
	padding: 0.75rem 1.5rem;
	font-size: 1.25rem;
}
.pagination-lg .page-item:first-child .page-link {
	border-top-left-radius: 0.3rem;
	border-bottom-left-radius: 0.3rem;
}
.pagination-lg .page-item:last-child .page-link {
	border-top-right-radius: 0.3rem;
	border-bottom-right-radius: 0.3rem;
}

.pagination-sm .page-link {
	padding: 0.25rem 0.5rem;
	font-size: 0.875rem;
}
.pagination-sm .page-item:first-child .page-link {
	border-top-left-radius: 0.2rem;
	border-bottom-left-radius: 0.2rem;
}
.pagination-sm .page-item:last-child .page-link {
	border-top-right-radius: 0.2rem;
	border-bottom-right-radius: 0.2rem;
}
.hint-text {
    float: left;
    margin-top: 10px;
    font-size: 13px;
}   

</style>

</head>

<body>
<%@ include file="/WEB-INF/views/fix/header.jsp" %>
<div class="container">
  <table class="responsive-table">
  <center>
    <h2>주문내역</h2>
    </center>
    <thead>
      <tr>
        <th scope="row">상품번호</th>
        <th scope="col">상품이미지</th>
        <th scope="col">상품명</th>
        <th scope="col">주문날짜</th>
        <th scope="col">주문개수</th>
        <th scope="col">주문금액</th>
        <th scope="col">주문상태</th>
        

      </tr>
    </thead>

    <tbody>
      <tr>
        <th scope="row">1111</th>
        <td data-type="Released"><img class="card-img-top" src="../../바탕 화면/아메카지2.jpeg"  alt="..." /></td>
        </td>
        <td data-title="상품명" data-type="Released">아메카지2</td>
        <td data-title="주문날짜" data-type="Released">2022/11/11</td>
        <td data-title="수량" data-type="Released">1 개</td>
        <td data-title="주문금액" data-type="currency">120,000원</td>
        <td data-title="주문관리" data-type="Released">배송준비중</td>
      
      </tr>
      <tr>
        <th scope="row">1111</th>
        <td data-type="Released"><img class="card-img-top" src="../../바탕 화면/아메카지2.jpeg"  alt="..." /></td>
        </td>
        <td data-title="상품명" data-type="Released">아메카지2</td>
        <td data-title="주문날짜" data-type="Released">2022/11/11</td>
        <td data-title="수량" data-type="Released">1 개</td>
        <td data-title="주문금액" data-type="currency">120,000원</td>
        <td data-title="주문관리" data-type="Released">배송준비중</td>

      </tr>
      <tr>
        <th scope="row">1111</th>
        <td data-type="Released"><img class="card-img-top" src="../../바탕 화면/아메카지2.jpeg"  alt="..." /></td>
        </td>
        <td data-title="상품명" data-type="Released">아메카지2</td>
        <td data-title="주문날짜" data-type="Released">2022/11/11</td>
        <td data-title="수량" data-type="Released">1 개</td>
        <td data-title="주문금액" data-type="currency">120,000원</td>
        <td data-title="주문관리" data-type="Released">배송준비중</td>

      </tr>
       <tr>
        <th scope="row">1111</th>
        <td data-type="Released"><img class="card-img-top" src="../../바탕 화면/아메카지2.jpeg"  alt="..." /></td>
        </td>
        <td data-title="상품명" data-type="Released">아메카지2</td>
        <td data-title="주문날짜" data-type="Released">2022/11/11</td>
        <td data-title="수량" data-type="Released">1 개</td>
        <td data-title="주문금액" data-type="currency">120,000원</td>
        <td data-title="주문관리" data-type="Released">배송준비중</td>
 
      </tr>
      <tr>
        <th scope="row">1111</th>
        <td data-type="Released"><img class="card-img-top" src="../../바탕 화면/아메카지2.jpeg"  alt="..." /></td>
        </td>
        <td data-title="상품명" data-type="Released">아메카지2</td>
        <td data-title="주문날짜" data-type="Released">2022/11/11</td>
        <td data-title="수량" data-type="Released">1 개</td>
        <td data-title="주문금액" data-type="currency">120,000원</td>
        <td data-title="주문관리" data-type="Released">배송준비중</td>

      </tr>
      <tr>
        <th scope="row">1111</th>
        <td data-type="Released"><img class="card-img-top" src="../../바탕 화면/아메카지2.jpeg"  alt="..." /></td>
        </td>
        <td data-title="상품명" data-type="Released">아메카지2</td>
        <td data-title="주문날짜" data-type="Released">2022/11/11</td>
        <td data-title="수량" data-type="Released">1 개</td>
        <td data-title="주문금액" data-type="currency">120,000원</td>
        <td data-title="주문관리" data-type="Released">배송준비중</td>

      </tr>
      <tr>
        <th scope="row">1111</th>
        <td data-type="Released"><img class="card-img-top" src="../../바탕 화면/아메카지2.jpeg"  alt="..." /></td>
        </td>
        <td data-title="상품명" data-type="Released">아메카지2</td>
        <td data-title="주문날짜" data-type="Released">2022/11/11</td>
        <td data-title="수량" data-type="Released">1 개</td>
        <td data-title="주문금액" data-type="currency">120,000원</td>
        <td data-title="주문관리" data-type="Released">배송준비중</td>

      </tr>
      <tr>
        <th scope="row">1111</th>
        <td data-type="Released"><img class="card-img-top" src="../../바탕 화면/아메카지2.jpeg"  alt="..." /></td>
        </td>
        <td data-title="상품명" data-type="Released">아메카지2</td>
        <td data-title="주문날짜" data-type="Released">2022/11/11</td>
        <td data-title="수량" data-type="Released">1 개</td>
        <td data-title="주문금액" data-type="currency">120,000원</td>
        <td data-title="주문관리" data-type="Released">배송준비중</td>

      </tr>
      <tr>
        <th scope="row">1111</th>
        <td data-type="Released"><img class="card-img-top" src="../../바탕 화면/아메카지2.jpeg"  alt="..." /></td>
        </td>
        <td data-title="상품명" data-type="Released">아메카지2</td>
        <td data-title="주문날짜" data-type="Released">2022/11/11</td>
        <td data-title="수량" data-type="Released">1 개</td>
        <td data-title="주문금액" data-type="currency">120,000원</td>
        <td data-title="주문관리" data-type="Released">배송준비중</td>

      </tr>
      <tr>
        <th scope="row">1111</th>
        <td data-type="Released"><img class="card-img-top" src="../../바탕 화면/아메카지2.jpeg"  alt="..." /></td>
        </td>
        <td data-title="상품명" data-type="Released">아메카지2</td>
        <td data-title="주문날짜" data-type="Released">2022/11/11</td>
        <td data-title="수량" data-type="Released">1 개</td>
        <td data-title="주문금액" data-type="currency">120,000원</td>
        <td data-title="주문관리" data-type="Released">배송준비중</td>

      </tr>
    </tbody>
  </table>
</div>
<!-- partial -->
  <script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

          
  <nav aria-label="Page navigation example">
    <ul class="pagination justify-content-center">
      <li class="page-item">
        <a class="page-link" href="#">Previous</a>
      </li>
      <li class="page-item"><a class="page-link" href="#">1</a></li>
      <li class="page-item"><a class="page-link" href="#">2</a></li>
      <li class="page-item"><a class="page-link" href="#">3</a></li>
      <li class="page-item"><a class="page-link" href="#">4</a></li>
      <li class="page-item"><a class="page-link" href="#">5</a></li>
      <li class="page-item">
        <a class="page-link" href="#">Next</a>
      </li>
      
     </ul>
  </nav>


<%@ include file="/WEB-INF/views/fix/footer.jsp" %>
</body>
</html>
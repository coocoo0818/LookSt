<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=dege">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert title here</title>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>
	<meta name="viewport" content="width=device-width"><link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
	<link href="${pageContext.request.contextPath }/resources/seller/css/list.css" rel="stylesheet">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
	
	<style type="text/css">
	#orderpagetitle {
		margin-top: 30px;
		margin-bottom: 30px;
		padding: 3px;
	}
	.pagination {
		justify-content: center;
	}
	
	</style>
	
	<script type="text/javascript">
		const myModal = document.getElementById('myModal')
		const myInput = document.getElementById('myInput')
		
		myModal.addEventListener('shown.bs.modal', () => {
		  myInput.focus()
		})

	</script>
	
	

	
</head>
<body>
<%@ include file="/WEB-INF/views/fix/sellerheader.jsp" %>
	
	
<h2 id="orderpagetitle" class="disply-2 text-center">ORDER LIST</h2>	
	
<div class="container">
<div class="row mt-5 py-3">
  <div class="col mt-1">
    
    <select id="inputState" class="form-select form-select-md">
      <option selected>결제대기</option>
      <option selected>결제완료</option>
      <option selected>배송준비중</option>
      <option selected>배송중</option>
      <option selected>배송완료</option>
    </select>
  </div> 

  <form class="d-flex col-md-9 mt-1">
      <input class="form-control form-control me-1" type="text" placeholder="Search" style="float:right;">
      <button class="btn btn-secondary" type="submit"><i class="d-flex fa fa-search"></i></button>
 </form>
</div> 
</div>

	
	
	<!-- partial:index.partial.html -->
<div class="container">
  <table class="responsive-table">
    
    <thead>
      <tr>
        <th scope="col">주문번호</th>
        <th scope="col">구매자</th>
        <th scope="col">상품정보</th>
        <th scope="col">결제금액</th>
        <th scope="col">주문일자</th>
        <th scope="col">주문상태</th>
        <th scope="col">상세</th>
      </tr>
    </thead>
    <tfoot>
      
    </tfoot>
    <tbody>
      <tr>
        <th scope="row">#0001</th>
        <td data-title="Buyer">김이젠</td>
        <td data-title="PrdtInfo">예쁜트렌치코트[1234]</td>
        <td data-title="TotalPay" data-type="currency">68000원</td>
        <td data-title="PayDate" data-type="currency">2022-10-17</td>
        <td data-title="OrderStaus" data-type="currency">배송준비중</td>
        <td data-title="Detail" data-type="currency">VIEW</td>
      </tr>
      <tr>
        <th scope="row">#0002</th>
        <td data-title="Buyer">김이젠2</td>
        <td data-title="PrdtInfo">예쁜트렌치코트[1234]</td>
        <td data-title="TotalPay" data-type="currency">68000원</td>
        <td data-title="PayDate" data-type="currency">2022-10-17</td>
        <td data-title="OrderStaus" data-type="currency">배송준비중</td>
        <td data-title="Detail" data-type="currency">VIEW</td>
      </tr>
      <tr>
        <th scope="row">#0003</th>
        <td data-title="Buyer">김이젠3</td>
        <td data-title="PrdtInfo">예쁜트렌치코트[1234]</td>
        <td data-title="TotalPay" data-type="currency">68000원</td>
        <td data-title="PayDate" data-type="currency">2022-10-17</td>
        <td data-title="OrderStaus" data-type="currency">배송준비중</td>
        <td data-title="Detail" data-type="currency">VIEW</td>
      </tr>
       <tr>
        <th scope="row">#0004</th>
        <td data-title="Buyer">김이젠4</td>
        <td data-title="PrdtInfo">예쁜트렌치코트[1234]</td>
        <td data-title="TotalPay" data-type="currency">68000원</td>
        <td data-title="PayDate" data-type="currency">2022-10-17</td>
        <td data-title="OrderStaus" data-type="currency">배송준비중</td>
        <td data-title="Detail" data-type="currency">VIEW</td>
      </tr>
      <tr>
        <th scope="row">#0005</th>
        <td data-title="Buyer">김이젠5</td>
        <td data-title="PrdtInfo">예쁜트렌치코트[1234]</td>
        <td data-title="TotalPay" data-type="currency">68000원</td>
        <td data-title="PayDate" data-type="currency">2022-10-17</td>
        <td data-title="OrderStaus" data-type="currency">배송준비중</td>
        <td data-title="Detail" data-type="currency">VIEW</td>
      </tr>
      <tr>
        <th scope="row">#0006</th>
        <td data-title="Buyer">김이젠6</td>
        <td data-title="PrdtInfo">예쁜트렌치코트[1234]</td>
        <td data-title="TotalPay" data-type="currency">68000원</td>
        <td data-title="PayDate" data-type="currency">2022-10-17</td>
        <td data-title="OrderStaus" data-type="currency">배송준비중</td>
        <td data-title="Detail" data-type="currency">VIEW</td>
      </tr>
      <tr>
        <th scope="row">#0007</th>
        <td data-title="Buyer">김이젠7</td>
        <td data-title="PrdtInfo">예쁜트렌치코트[1234]</td>
        <td data-title="TotalPay" data-type="currency">68000원</td>
        <td data-title="PayDate" data-type="currency">2022-10-17</td>
        <td data-title="OrderStaus" data-type="currency">배송준비중</td>
        <td data-title="Detail" data-type="currency">VIEW</td>
      </tr>
      <tr>
        <th scope="row">#0008</th>
        <td data-title="Buyer">김이젠8</td>
        <td data-title="PrdtInfo">예쁜트렌치코트[1234]</td>
        <td data-title="TotalPay" data-type="currency">68000원</td>
        <td data-title="PayDate" data-type="currency">2022-10-17</td>
        <td data-title="OrderStaus" data-type="currency">배송준비중</td>
        <td data-title="Detail" data-type="currency">VIEW</td>
      </tr>
    </tbody>
  </table>
</div>
<!-- partial -->
  <script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<%@ include file="/WEB-INF/views/fix/footer.jsp" %>
</body>
</html>
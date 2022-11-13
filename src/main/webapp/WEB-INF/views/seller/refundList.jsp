<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=dege">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>REFUND LIST</title>
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
	
	
<h2 id="orderpagetitle" class="disply-2 text-center py-4">REFUND LIST</h2>	
	
<div class="container">
<div class="row py-3">
  <div class="col mt-1">
    
    <select id="inputState" class="form-select form-select-md">
      <option selected>전체</option>
      <option value="1">취소접수</option>
	  <option value="2">반품처리중</option>
	  <option value="3">환불처리중</option>
	  <option value="4">반품완료</option>
	  <option value="5">환불완료</option>
    </select>
  </div> 

  <form class="d-flex col-md-9 mt-1">
      <input class="form-control form-control me-1" type="text" placeholder="Search" style="float:right;">
      <button class="btn btn-secondary" type="submit"><i class="d-flex fa fa-search"></i></button>
 </form>
</div> 
</div>

	
	
	<!-- partial:index.partial.html -->
<div class="container py-1">
  <table class="responsive-table">
    
    <thead>
      <tr>
        <th scope="col">주문번호</th>
        <th scope="col">구매자</th>
        <th scope="col">요청사유</th>
        <th scope="col">결제금액</th>
        <th scope="col">주문일자</th>
        <th scope="col">요청상태</th>
        <th scope="col">상세</th>
      </tr>
    </thead>
    <tfoot>
      
    </tfoot>
    <tbody>
      <tr>
        <th scope="row">#0001</th>
        <td data-title="Buyer">김이젠</td>
        <td data-title="ReqReason">단순변심</td>
        <td data-title="TotalPay" data-type="currency">68000원</td>
        <td data-title="PayDate" data-type="currency">2022-10-17</td>
        <td data-title="ReqStaus" data-type="currency">취소접수</td>
        <td data-title="Detail" data-type="currency"><button type="button" class="btn btn-outline-dark btn-sm" data-bs-toggle="modal" data-bs-target="#staticBackdrop">VIEW</button></td>
      </tr>
      <tr>
        <th scope="row">#0002</th>
        <td data-title="Buyer">김이젠</td>
        <td data-title="ReqReason">단순변심</td>
        <td data-title="TotalPay" data-type="currency">68000원</td>
        <td data-title="PayDate" data-type="currency">2022-10-17</td>
        <td data-title="ReqStaus" data-type="currency">취소접수</td>
        <td data-title="Detail" data-type="currency"><button type="button" class="btn btn-outline-dark btn-sm" data-bs-toggle="modal" data-bs-target="#staticBackdrop">VIEW</button></td>
      </tr>
      <tr>
        <th scope="row">#0003</th>
        <td data-title="Buyer">김이젠</td>
        <td data-title="ReqReason">단순변심</td>
        <td data-title="TotalPay" data-type="currency">68000원</td>
        <td data-title="PayDate" data-type="currency">2022-10-17</td>
        <td data-title="ReqStaus" data-type="currency">취소접수</td>
        <td data-title="Detail" data-type="currency"><button type="button" class="btn btn-outline-dark btn-sm" data-bs-toggle="modal" data-bs-target="#staticBackdrop">VIEW</button></td>
      </tr>
       <tr>
        <th scope="row">#0004</th>
        <td data-title="Buyer">김이젠</td>
        <td data-title="ReqReason">단순변심</td>
        <td data-title="TotalPay" data-type="currency">68000원</td>
        <td data-title="PayDate" data-type="currency">2022-10-17</td>
        <td data-title="ReqStaus" data-type="currency">취소접수</td>
        <td data-title="Detail" data-type="currency"><button type="button" class="btn btn-outline-dark btn-sm" data-bs-toggle="modal" data-bs-target="#staticBackdrop">VIEW</button></td>
      </tr>
      <tr>
        <th scope="row">#0005</th>
        <td data-title="Buyer">김이젠</td>
        <td data-title="ReqReason">단순변심</td>
        <td data-title="TotalPay" data-type="currency">68000원</td>
        <td data-title="PayDate" data-type="currency">2022-10-17</td>
        <td data-title="ReqStaus" data-type="currency">취소접수</td>
        <td data-title="Detail" data-type="currency"><button type="button" class="btn btn-outline-dark btn-sm" data-bs-toggle="modal" data-bs-target="#staticBackdrop">VIEW</button></td>
      </tr>
      <tr>
        <th scope="row">#0006</th>
        <td data-title="Buyer">김이젠</td>
        <td data-title="ReqReason">단순변심</td>
        <td data-title="TotalPay" data-type="currency">68000원</td>
        <td data-title="PayDate" data-type="currency">2022-10-17</td>
        <td data-title="ReqStaus" data-type="currency">취소접수</td>
        <td data-title="Detail" data-type="currency"><button type="button" class="btn btn-outline-dark btn-sm" data-bs-toggle="modal" data-bs-target="#staticBackdrop">VIEW</button></td>
      </tr>
      <tr>
        <th scope="row">#0007</th>
        <td data-title="Buyer">김이젠</td>
        <td data-title="ReqReason">단순변심</td>
        <td data-title="TotalPay" data-type="currency">68000원</td>
        <td data-title="PayDate" data-type="currency">2022-10-17</td>
        <td data-title="ReqStaus" data-type="currency">취소접수</td>
        <td data-title="Detail" data-type="currency"><button type="button" class="btn btn-outline-dark btn-sm" data-bs-toggle="modal" data-bs-target="#staticBackdrop">VIEW</button></td>
      </tr>
      <tr>
        <th scope="row">#0008</th>
        <td data-title="Buyer">김이젠</td>
        <td data-title="ReqReason">단순변심</td>
        <td data-title="TotalPay" data-type="currency">68000원</td>
        <td data-title="PayDate" data-type="currency">2022-10-17</td>
        <td data-title="ReqStaus" data-type="currency">취소접수</td>
        <td data-title="Detail" data-type="currency"><button type="button" class="btn btn-outline-dark btn-sm" data-bs-toggle="modal" data-bs-target="#staticBackdrop">VIEW</button></td>
      </tr>
    </tbody>
  </table>
</div>
<!-- partial -->




<div class="container">
	<div class="row">
		<div>
          <button type="button" class="btn btn-outline-dark" style="float:left;">수정</button>
          <button type="button" class="btn btn-outline-dark ms-1">저장</button>
        </div>
    </div>
</div>

<div class="row my-5"></div>

<!-- pagination -->
<nav aria-label="Page navigation example">
		  <ul class="pagination">
		    <li class="page-item">
		      <a class="page-link" href="#" aria-label="Previous">
       			 <span aria-hidden="true">&laquo;</span>
      		  </a>
    		</li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item">
      		  <a class="page-link" href="#" aria-label="Next">
        		<span aria-hidden="true">&raquo;</span>
      		  </a>
   			</li>
 		  </ul>
</nav>


<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">Detail Information</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
  		 <div class ="detail-info">
              <span>수령인 :</span>
              <span text = "${order.name}">박이름</span><br/>
              <span>수령주소 :</span><!--수정필요-->
              <span text =  "${order.address}">서울시 00구 00동 00-00 00호</span><br/>
              <span>전화번호 :</span><!--수정필요-->
              <span text =  "${order.phonenumber}">010-1234-1234</span><br/>
              <span>주문번호 :</span>
              <span text =  "${order.number}">178789</span><br/>
              <span>상품번호 :</span>
              <span text =  "${product.itemIdx}">1659826</span><br/>
              <span>상품명 :</span>
              <span text = "${order.itemName}">예쁜 트렌치코트</span><br/>
              <span>상품가격 :</span>
              <span text = "${order.orderPrice}">34000원</span><br/>
              <span>구매수량 :</span><!--수정필요-->
              <span text =  "${order.number}">2</span><br/>
              <span>결제일시 :</span>
        	  <span text = "${order.orderedAt}">2022-10-17</span><br/>
     		  <span>결제수단 :</span><!--수정필요-->
              <span text = "${order.payment}">카드결제</span><br/>
   			  <span>환불금액 :</span><!--수정필요-->
    		  <span text =  "${order.orderPrice}">68000원</span><br/>
              <span>주문상태 :</span><!--수정필요-->
              <span text =  "${order.status}">결제완료</span><br/>
              <span>요청상태 :</span><!--수정필요-->
              <span text =  "${order.reqstatus}">취소접수</span><br/>
              <span>요청사유 :</span><!--수정필요-->
              <span text =  "${order.reqreason}">단순변심</span><br/>
         </div>    
      </div>
   		<div class="modal-footer">
        	<button type="button" class="btn btn-primary" data-bs-dismiss="modal">Close</button>
  		</div>
     </div>
   </div>
</div>	
	
	

<%@ include file="/WEB-INF/views/fix/footer.jsp" %>
</body>
</html>
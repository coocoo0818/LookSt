<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
<title>Insert title here</title>

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
<%@ include file="/WEB-INF/views/fix/adminheader.jsp" %>

<h2 id="orderpagetitle" class="disply-2 text-center">REFUND LIST</h2>

<div class="container">
<div class="row">
  <div class="col">
    
    <select id="inputState" class="form-select">
      <option selected>취소접수</option>
      <option selected>반품처리중</option>
      <option selected>환불처리중</option>
      <option selected>반품완료</option>
      <option selected>환불완료</option>
    </select>
  </div> 

  <form class="d-flex col-6">
      <input class="form-control me-sm-2" type="text" placeholder="Search" style="float:right;">
      <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
 </form>
</div> 
</div>
<div class="container">

</div> 
<div class="container">
	<div class="row">
		<div>
          <button type="button" class="btn btn-outline-dark btn-sm text-right" href="customer-order.html" style="float:right;">수정</button>
        </div>
    </div>
</div>

<div class="container">

	<div class="col-lg-8-md-col-xl-9">

            <table class="table table-borderless table-hover table-responsive-md">
              <thead class="bg-light">
                <tr>
                  <th class="py-3 text-uppercase text-sm text-center">주문번호</th>
                  <th class="py-3 text-uppercase text-sm text-center">구매자</th>
                  <th class="py-3 text-uppercase text-sm text-center">요청사유</th>
                  <th class="py-3 text-uppercase text-sm text-center">결제금액</th>
                  <th class="py-3 text-uppercase text-sm text-center">주문일자</th>
                  <th class="py-3 text-uppercase text-sm text-center">주문상태</th>
                  <th class="py-3 text-uppercase text-sm text-center">상세</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <th class="py-2 align-middle text-center"># 1735</th>
                  <td class="py-2 align-middle text-center">김이젠</td>
                  <td class="py-2 align-middle text-center">단순변심</td>
                  <td class="py-2 align-middle text-center">68000원</td>
                  <td class="py-2 align-middle text-center">2022-10-17</td>
                  <td class="py-2 align-middle text-center"><span class="badge text-bg-primary text-uppercase">Being prepared</span></td>
                  <td class="py-2 align-middle text-center"><button type="button" class="btn btn-outline-dark btn-sm" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
  					VIEW</button></td>
                </tr>
                <tr>
                  <th class="py-2 align-middle text-center"># 1735</th>
                  <td class="py-2 align-middle text-center">김이젠</td>
                  <td class="py-2 align-middle text-center">단순변심</td>
                  <td class="py-2 align-middle text-center">68000원</td>
                  <td class="py-2 align-middle text-center">2022-10-17</td>
                  <td class="py-2 align-middle text-center"><span class="badge text-bg-primary text-uppercase">Being prepared</span></td>
                  <td class="py-2 align-middle text-center"><button type="button" class="btn btn-outline-dark btn-sm" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
  					VIEW</button></td>
                </tr>
                <tr>
                  <th class="py-2 align-middle text-center"># 1735</th>
                  <td class="py-2 align-middle text-center">김이젠</td>
                  <td class="py-2 align-middle text-center">단순변심</td>
                  <td class="py-2 align-middle text-center">68000원</td>
                  <td class="py-2 align-middle text-center">2022-10-17</td>
                  <td class="py-2 align-middle text-center"><span class="badge text-bg-primary text-uppercase">Being prepared</span></td>
                  <td class="py-2 align-middle text-center"><button type="button" class="btn btn-outline-dark btn-sm" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
  					VIEW</button></td>
                </tr>
               <tr>
                  <th class="py-2 align-middle text-center"># 1735</th>
                  <td class="py-2 align-middle text-center">김이젠</td>
                  <td class="py-2 align-middle text-center">단순변심</td>
                  <td class="py-2 align-middle text-center">68000원</td>
                  <td class="py-2 align-middle text-center">2022-10-17</td>
                  <td class="py-2 align-middle text-center"><span class="badge text-bg-primary text-uppercase">Being prepared</span></td>
                  <td class="py-2 align-middle text-center"><button type="button" class="btn btn-outline-dark btn-sm" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
  					VIEW</button></td>
                </tr>
                <tr>
                  <th class="py-2 align-middle text-center"># 1735</th>
                  <td class="py-2 align-middle text-center">김이젠</td>
                  <td class="py-2 align-middle text-center">단순변심</td>
                  <td class="py-2 align-middle text-center">68000원</td>
                  <td class="py-2 align-middle text-center">2022-10-17</td>
                  <td class="py-2 align-middle text-center"><span class="badge text-bg-primary text-uppercase">Being prepared</span></td>
                  <td class="py-2 align-middle text-center"><button type="button" class="btn btn-outline-dark btn-sm" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
  					VIEW</button></td>
                </tr>
              </tbody>
            </table>
       </div>
            
</div>




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
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">Detail Information</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        ...
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
<title>productdetail</title>
 
 

</head>
<body>
<%@ include file="/WEB-INF/views/fix/header.jsp" %>
  <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-top">
                    <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="../../바탕 화면/아메카지2.jpeg" alt="..." /></div>
                    <div class="col-md-6">
                        <div class="small mb-1">상의</div>
                        <h1 class="display-5 fw-bolder">캐시미어 100 코트</h1>
                        <div class="fs-5 mb-5">
                            
                            <span>849,000원</span>
                        </div>
                        <p class="lead">ㄴㅇㄹㅇㅁㄴㄻㄴㅇㄻㄴㅇㄹㄴㅇㄹㄴㅇㄹㄴㅇㄹㄴㅇㄹㅁㄴㅇㄴㅀㅁㄹㅇㅎㄷㄱㅁ합줘ㅐㅑㅍ촘햐ㅐㅁㅇ후ㅏㅣㅁㄷ고해ㅕㅑㅇㄹ모ㅑ피ㅏ</p>
                        <div class="fs-5 mb-5">
                        </div>
                        <p-1>사이즈</p-1>
                        
                        <div class="dropdown">
                            <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                            
                              사이즈를 선택하세요.
                            
                            <ul class="dropdown-menu dropdown-menu-white">
                              <li><a class="dropdown-item active" href="#">S</a></li>
                              <li><a class="dropdown-item" href="#">M</a></li>
                              <li><a class="dropdown-item" href="#">L</a></li>
                              <li><a class="dropdown-item" href="#">XL</a></li>
                              </button>
                            </ul>
                          </div>
                          
                          <p></p>
                          수량
                        <div class="d-flex">
                            <input class="form-control text-center me-3" id="inputQuantity" type="num" value="1" style="max-width: 3rem" />
                            <button class="btn btn-outline-dark flex-shrink-0" type="button">
                                <i class="bi-cart-fill me-1"></i>
                                구매하기
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Related items section-->
        <section class="py-5 bg-light">
            <div class="container px-4 px-lg-5 mt-5">
                <h2 class="fw-bolder mb-4">추천 코디</h2>
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="../../바탕 화면/아메카지2.jpeg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Fancy Prod</h5>
                                    <!-- Product price-->
                                    139,000원
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">구매하기</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Sale badge-->
                            
                            <!-- Product image-->
                            <img class="card-img-top" src="../../바탕 화면/아메카지2.jpeg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Special Item</h5>
                                    199,000원
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        
                                    </div>
                                    <!-- Product price-->
                                    
                                   
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">구매하기</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Sale badge-->
                            <!--<div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Hot</div>-->
                            <!-- Product image-->
                            <img class="card-img-top" src="../../바탕 화면/아메카지2.jpeg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Sale Item</h5>
                                    <!-- Product price-->
                                    
                                    99,000원
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">구매하기</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="../../바탕 화면/아메카지2.jpeg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Popular Item</h5>
                                    79,000원
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price-->
                               
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">구매하기</a></div>
                            </section>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <DIV style ="text-align:center";>
            <div class="container px-4 px-lg-5 mt-5">
                <h2 class="fw-bolder mb-4">상품 상세정보</h2>
            </div>
           
            
            <img src="../../바탕 화면/아메카지2.jpeg" width=850, height=1000 alt="..." />
            <p>
            <img src="../../바탕 화면/아메카지2.jpeg" width=850, height=1000 alt="..." />
        </p>
            </DIV>
<%@ include file="/WEB-INF/views/fix/footer.jsp" %>
</body>
</html>
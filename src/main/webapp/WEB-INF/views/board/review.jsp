<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style type="text/css">
.re_h2 {
	font-family: 'Open Sans', sans-serif;
	text-align: center;
	font-size: 22px;
	font-weight: 700;
	color: #1c1c1c;
	letter-spacing: 0.5px;
	margin-top: 60px;
	margin-bottom: 50px;
}

.bbs-table-list thead th {
	height: 25px;
	color: #9d9d9d;
	/* font-size: 12px; */
	border-bottom: 1px solid #e5e5e5;
}

.bbs-table-list thead th, .bbs-table-list tbody td {
	padding: 6px 0;
}

table {
	font-size: 12px;
	line-height: 1.25;
	color: #777;
	font-family: 'Nanum Gothic', verdana, Dotum, AppleGothic, Helvetica,
		sans-serif;
}

.bbs-table-list {
	text-align: -webkit-center;
	display: grid;
	border-top: 1px solid #333;
}

fieldset {
	border: none;
	text-align: end;
}

.esosub_s {
	font-style: 10px;
	font-size: 12px;
	line-height: 1.25;
	color: #777;
	font-family: 'Nanum Gothic', verdana, Dotum, AppleGothic, Helvetica,
		sans-serif;
	border-collapse: collapse;
	border-spacing: 0;
	word-wrap: break-word;
	word-break: keep-all;
	text-align: center;
}

.esosub_s_l {
	font-family: 'Open Sans', sans-serif;
	text-align: center;
	font-weight: 300;
	color: #1c1c1c;
	letter-spacing: 0.5px;
}

.page {
	display: flex;
	font-size: 1rem;
	color: #aaa;
	justify-content: center; -
	-swiper-theme-color: #007aff; -
	-swiper-navigation-size: 44px;
	font-family: 'Noto Sans KR', serif;
	line-height: 1rem;
	letter-spacing: 0.1px;
}

.page p {
	margin: 0 12px;
	padding: 0 8px;
	line-height: 2rem;
	cursor: pointer;
}

.checkpage {
	font-size: 26px;
	font-weight: 700;
	color: #222;
	border-bottom: 4px solid #e6002d;
}

.bbs-table-list tbody td {
	padding: 6px 0;
}

.bbs-table-list tbody td {
	/* height: 25px; */
	border-bottom: 1px solid #e5e5e5;
}

.tb-center {
	text-align: center;
}

.tb-left #new {
	width: 55px;
}

/* 여기부터! */
.key-wrap {
	display: inline-block;
}

.white_e_s {
	background-color: #ffffff;
	border: 1px solid #e1e1e1;
	display: inline-block;
	cursor: pointer;
	color: #666666;
	font-family: 'Open Sans', verdana, Dotum, AppleGothic, Helvetica,
		sans-serif;
	font-size: 10px;
	letter-spacing: 0.5px;
	font-weight: 600;
	padding: 3px 12px;
	text-decoration: none;
	vertical-align: middle;
}

.MS_input_txt {
	margin-right: 5px;
	line-height: 20px;
	border: 1px solid #e7e7e7;
	height: 23px;
	vertical-align: middle;
}

[type=checkbox], [type=radio] {
	vertical-align: middle;
}
/* 여기까지 끝! */
.bbs-tit {
	font-size: 9px;
}

section {
	text-align: right;
}

.black_e_s {
	background-color: #333333;
	border: 1px solid #1c1c1c;
	display: inline-block;
	cursor: pointer;
	color: #ffffff;
	font-family: 'Open Sans', verdana, Dotum, AppleGothic, Helvetica,
		sans-serif;
	font-size: 1rem;
	letter-spacing: 0.5px;
	font-weight: 600;
	padding: 10px 20px;
	text-decoration: none;
	margin: 50px 0 30px;
}

table {
	font-size: 16px;
	line-height: 1.25;
	color: #777;
	font-family: 'Nanum Gothic', verdana, Dotum, AppleGothic, Helvetica,
		sans-serif;
}

.trclass {
	text-align: center;
}

.tb-left { text-decoration: none;}
a { text-decoration: none !important; }
</style>
<title>lookst</title>
</head>
<body>
	<script type="text/javascript">
		let msg = "${msg}"
		if (msg == "DEL_OK")
			alert("성공적으로 삭제되었습니다.")
		if (msg == "DEL_ERR")
			alert("삭제되었거나 없는 게시물입니다.")
		if (msg == "WRT_OK")
			alert("성공적으로 등록되었습니다.")
		if (msg == "MOD_OK")
			alert("성공적으로 수정되었습니다.")
	</script>
	<%@ include file="/WEB-INF/views/fix/header.jsp"%>
	<div>
	<div class="bbs-tit mx-5">
		<div class="row justify-content-md-center">
			<h2 class="col-auto my-5">REVIEW</h2>
		</div>
 <form action="review.html" name="form1" class="re_form">
      <fieldset style="margin-right: 5.5%;">
	<nav class="navbar navbar-expand-md navbar-dark "
		style="float: right;">
		<form action="<c:url value="/board/review" />" class="search-form"
			method="get">
			<select class="search-option" name="option" style="margin-right:2%">
				<option value="A"
					${prR.sc.option=='A' || prR.sc.option=='' ? "selected" : "" }>제목
					+ 내용</option>
				<option value="T" ${prR.sc.option=='T' ? "selected" : "" }>제목</option>
				<option value="W" ${prR.sc.option=='W' ? "selected" : "" }>작성자</option>
			</select> <input type="text" name="keyword" class="search-input"
				value="${param.keyword }" placeholder="검색어를 입력해 주세요."> <input
				type="submit" class="search-button" value="검색">
		</form>
	</nav>
      </fieldset>
    </form>
  <div class="bbs-table-list" style="margin-left: 5%; margin-right: 5%;">
    <table summary="No, content,Name,Data,Hits">
      <!-- 일반 게시글 -->
      <thead>
        <tr>
          <th scope="col">
            <div class="esosub_s">NO</div>
          </th>
          <th scope="col">
            <div class="esosub_s"></div>
          </th>
          <!-- .상품정보가 있을 경우에만 나타남 -->
          <th scope="col">
            <div class="esosub_s"></div>
          </th>
          <th scope="col">
            <div class="esosub_s">SUBJECT</div>
          </th>
          <th scope="col">
            <div class="esosub_s">NAME</div>
          </th>
          <th scope="col">
            <div class="esosub_s">DATE</div>
          </th>
          <th scope="col">
            <div class="esosub_s">HIT</div>
          </th>
        </tr>
      </thead>
      <tbody>
        <!-- .공지사항 리스트 시작 -->
        <tr>
          <td>
            <div class="tb-center"><img src="https://www.amai.co.kr/images/d3/modern_simple/common/icon_box_arrow.gif">
            </div>
          </td>
          <td>
            <div class="tb-left"><img src="https://www.amai.co.kr/board/images/neo_notice.gif"> </div>
          </td>
          <!-- .상품정보가 있을 경우에만 나타남 -->
          <td colspan="2">
            <div class="tb-left">
              <a href="reviewNotice.html">
                <font color="#FF600F"><b>리뷰 게시판 특성에 맞지않거나 악의성 비방글, 판매글, 타 사이트 홍보글은 삭제될 수 있습니다.</b></font>
              </a>
            </div>
          </td>
          <td>
            <div class="tb-center">
              운영진 </div>
          </td>
          <td>
            <div class="tb-center" style="font-size: 10px">2022-11-20</div>
          </td>
          <td>
            <div class="tb-center" style="font-size: 10px">1004</div>
          </td>
        </tr>
        <!--. 공지사항 리스트 끝! -->
        <!--. 게시글 리스트 시작(한페이지당 게시글 수) -->
        <c:forEach var="boardDtoR" items="${list4 }">  
        <tr>
          <td>
            <div class="tb-center" style="font-size: 10px">${boardDtoR.board_no}</div>
          </td>
          <td>
            <div class="tb-left"><img src="https://www.amai.co.kr/board/images/neo_default.gif"></div>
          </td>
          <!-- .product image 관련 -->
          <td>
            <div class="tb-left">
            </div>
          </td>
          <td>
            <div class="tb-left">
              <a href="<c:url value="/board/read/review${prR.sc.queryString }&board_no=${boardDtoR.board_no }" />">
								${boardDtoR.board_title } </a>
              <!--. 상품정보가 있을때 조회수가 10이상이면 hit아이콘보여주기 -->
            </div>
          </td>
          <td>
            <div class="tb-center">
              ${boardDtoR.member_id }
            </div>
          </td>
          <td>
            <div class="tb-center" style="font-size: 10px"><fmt:formatDate	value="${boardDtoR.board_date }" pattern="yyyy-MM-dd" type="date" /></div>
          </td>
          <td>
            <div class="tb-center" style="font-size: 10px">${boardDtoR.board_views }</div>
          </td>
        </tr>
        </c:forEach>
        <!--. 게시글 리스트 끝 -->
      </tbody>
    </table>
    <nav class=" mt-5 mb-5" aria-label="Page navigation example">
				  <ul class="pagination justify-content-center">
				    <li class="page-item disabled">
							<c:if test="${totalCntR == null || totalCntR == 0}">
								<div>게시물이 없습니다.</div>
							</c:if>
							<c:if test="${totalCntR != null || totalCntR != 0}">
								<c:if test="${prR.showPrev }">
									<li class="page-item"><a class="page-link" href="<c:url value="/board/review${prR.sc.getQueryString(pr.beginPage-1) }" />"> &lt; </a></li>
								</c:if>
								<c:forEach var="i" begin="${prR.beginPage }" end="${prR.endPage }">
									<li class="page-item"><a class="page-link" href="<c:url value="/board/review${prR.sc.getQueryString(i) }" />">${i }</a>
								</c:forEach>
								<c:if test="${prR.showNext }">
									<li class="page-item"><a class="page-link" href="<c:url value="/board/review${prR.sc.getQueryString(pr.endPage+1) }" />">
										&gt; </a>
								</c:if>
							</c:if>
						</li>
					</ul>
				</nav>
  			</div>
		<section>
			<button type="button" class="btn btn-primary mt-5 mb-5" style="margin-top: 1.5%; margin-right: 5%;"onclick="location.href='<c:url value="/board/review/write" />' "><i class="fa fa-pen"></i>submit</button>
		</section>  		
</div>
<%@ include file="/WEB-INF/views/fix/footer.jsp"%>
</body>
</html>
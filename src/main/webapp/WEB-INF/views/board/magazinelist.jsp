<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lookst</title>

    <style type="text/css">
        img {
            width: 100px;
        }

        li {
            list-style: none;
        }

        h1 {
            font-size: 35px;
            line-height: 2.2rem;
            color: #222;
            font-weight: 900;
            margin-bottom: 20px;
            text-align: center;
        }

        h2 {
            font-size: 23px;
            font-weight: 500;
            line-height: 1.5rem;
            color: #000;
            text-align: center;
            word-break: keep-all;
        }

        h3 {
            font-size: 20px;
            line-height: 1.5rem;
            font-weight: 500;
            margin-bottom: 60px;
            text-align: center;
        }

        /* 리스트 안의 h3  */
        .list section h3 {
            /* font-family: 'Noto Serif KR', serif; */
            margin-bottom: 12px;
            text-align: left;
            word-break: keep-all;
        }

        .bd-list > h3 {
            margin-bottom: 80px;
        }

        article {
            width: 90%;
            max-width: 1000px;
            border: 1px solid #eee;
            border-radius: 12px;
            padding: 60px 5%;
            margin: 0 auto;
        }

        input[type="text"] {
            width: 100%;
            height: 50px;
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 16px;
            margin-bottom: 24px;
            padding-left: 12px;
            border-bottom: 1px solid #ddd;
            outline: none;
        }

        textarea {
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 1rem;
            line-height: 1.2rem;
            width: 100%;
            height: 300px;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin-bottom: 20px;
            padding: 12px;
            resize: none;
        }

        textarea:focus {
            outline: 1px solid black;
        }

        /* 리스트 섹션 분류 */
        .list section {
            margin-bottom: 40px;
            border-bottom: 1px solid #ddd;
            padding-bottom: 20px;
        }

        .list section div:nth-child(1) {
            overflow: hidden;
            width: 100%;
            height: 200px;
            margin-bottom: 15px;
        }

        .list section:hover div:nth-child(1) img {
            transform: scale(1.2);
        }

        .list section img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            transition: .3s;
        }

        .list section h3 {
            margin-bottom: 12px;
            text-align: left;
            word-break: keep-all;
        }

        .list section p {
            font-weight: 200;
            line-height: 1.2rem;
            margin-bottom: 20px;
        }

        /* 이미지 */
        .list section img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            transition: .3s;
        }

        /* 밑단 상속 */
        .bd-list > div:last-child a {
            display: inline-block;
            width: 100px;
            padding: 10px 0;
            /* border: 1px solid #ddd; */
            border-radius: 20px;
            transition: .3s;
        }

        .bd-list > div:last-child {
            text-align: center;
        }

        a:link {
            text-decoration: none;
        }

        /* 더보기 */
        button {
            display: inline-block;
            height: 50px;
            font-size: 1rem;
            font-weight: bold;
            background: none;
            border-radius: 5px;
            border: 1px solid #aaa;
            transition: 0.4s;
            cursor: pointer;
        }

        .more button {
            border-radius: 50px;
            padding: 5px 30px;
            margin-top: 30px;
        }

        button:hover {
            background: #222;
            color: #fff;
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

        .this {
            width: 90%;
            max-width: 1139px;
            margin: 0 auto;
            text-align: right;
        }


    </style>
    <script src="https://code.jquery.com/jquery-3.6.1.js"
            integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/fix/header.jsp" %>

<div class="d-grid gap-2 col-2 mx-auto mt-5 mb-5">
    <%-- <input type="submit" class="btn btn-outline-secondary" value="SUBMIT" onclick="location.href='<c:url value="/board/magazine/writer" />' "> --%>
</div>
<article class="bd-list list mb-5">
    <h3>Magazine List</h3>
    <div id="section">
        <c:forEach var="boardDtoM" items="${boardImgList }">
            <section>
                <div>
                    <img src="${boardDtoM.board_img_img }">
                </div>
                <div>
                    <h3 class="mt-5"><a
                            href="<c:url value='/board/read/magazine?board_no=${boardDtoM.board_no }' />"> ${boardDtoM.board_title } </a>
                    </h3>
                    <h5> 작성자 : ${boardDtoM.member_id } / 작성일 : <fmt:formatDate value="${boardDtoM.board_date }"
                                                                               pattern="yyyy-MM-dd" type="date"/></h5>
                </div>
            </section>
        </c:forEach>
    </div>
    <div class="more">
        <button type="button" name="more" id="more">더 보기 +</button>
    </div>
</article>
<script>
    var lastIndex= ${lastIndex};
    $("#more").click(function () {
		$.ajax({
			type : 'GET'													// http 요청 방식 (default: 'GET')
			, url : '/lookst/board/magazine/scroll?lastIndex='+lastIndex	// 요청이 전송될 URL 주소
			, headers : { "content-type" : "application/json" }				// 요청 컨텐트 타입
			, success : function(result) {									// 정상적으로 응답을 받았을 경우에 success 콜백이 호출 되게 함.
				var template="";
                result.data.forEach(function(ele) { 						//json 리스트 데이터를 받아와서 template에 맞춰서 렌더링 해줌.
                    template += '   <section>';
                    template+=' <div> <img src="'+ele.board_img_img+'"> </div>';
                    template+= '<h3 class="mt-5"><a href="/lookst/board/read/magazine?board_no='+ele.board_no+'"> ';
                    template+=ele.board_title +'</h3>';
                    let date = new Date(ele.board_date).toLocaleDateString().replace(/\./g, '').replace(/\s/g, '-');
                    //날짜와 시간을 얻기 위해서는 생성자로 Date 객체를 호출한다. 그러면 새로운 Date 객체가 반환이 되고,
                    //toLocaleDateString() 메서드를 통하여 생성된 Date 객체에서 날짜 부분을 현재 지역 표기법으로 변환하여 가져온다.
                    //.replace 함수를 통해 텍스트 문자열의 일부를 다른 텍스트 문자열로 바꾼다.
                    template+=  '<h5> 작성자 : '+ele.member_id+' / 작성일 : '+date+'</h5> </div>';
                    template += '</section>'
                })
                $("#section").append(template);
                    lastIndex=result.lastIndex;
			}
			, error : function() { alert("error") }
		})
    })
</script>
<%@ include file="/WEB-INF/views/fix/footer.jsp" %>
</body>
</html>
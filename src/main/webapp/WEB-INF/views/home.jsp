<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
<link href="${pageContext.request.contextPath }/resources/fix/css/index.css" rel="stylesheet">
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous"> -->
</head>
<body>
	<%@ include file="/WEB-INF/views/fix/header.jsp"%>
	<a href="<c:url value="/admin/member_management"/>">admin</a>
	<a href="<c:url value="/sns/test"/>">sns test</a>
	<a href="<c:url value="/seller/test"/>">seller</a>

<%@ include file="/WEB-INF/views/fix/mainbanner.jsp"%>
<%@ include file="/WEB-INF/views/fix/categorygallery.jsp"%>
<%@ include file="/WEB-INF/views/fix/home_products.jsp"%>
<%@ include file="/WEB-INF/views/fix/scrolltrigger.jsp"%>
<%@ include file="/WEB-INF/views/fix/snsbanner.jsp"%>

	<%@ include file="/WEB-INF/views/fix/footer.jsp"%>
</body>
</html>

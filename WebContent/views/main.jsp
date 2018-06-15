<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
	<jsp:include page="/views/menu.jsp"/>
	 <div class="header">
	 	<c:if test="${sessionScope.id != null}"><h3>${sessionScope.name}님 환영합니다!</h3></c:if>	
	 </div>
	<div class="main">
		<img src="${pageContext.request.contextPath}/photo/hero.jpg" alt="" />
		<img src="${pageContext.request.contextPath}/photo/images.jpg" alt="" />
		<span>물론 클릭은 안됩니다.</span>
	</div>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>
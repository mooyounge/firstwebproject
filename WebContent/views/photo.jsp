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
	<div class="form text-center">
		 <form action="${pageContext.request.contextPath}/photo/insert" enctype="multipart/form-data" method="post" class="text-center">
		<div class="main ">	
			<input type="hidden" name="id" value="${sessionScope.id }" />
		 	<div class="form-group form-inline">
		 		<input type="text" name="content" id="content" class="form-control" placeholder="Message"/>
		 	</div>
		 	<div class="form-group form-inline">
		 		<input type="file" name="photo" id="photo" class="form-control" />
		 	</div>
		</div>
		<button type="submit" class="btn btn-default">등록</button>
	</form>	
	</div>
	<div class="main container-fluid ">
		<c:forEach var="pvo" items="${pvoList}">
		<div class="photo col-md-4">
			<img src="${pageContext.request.contextPath}/photo/${pvo.filename }" alt="" class="img-responsive" style="width: 300px; height: 300px;"/>
			<label for="">${pvo.content }</label>
			<label for="">/${pvo.u_id }</label>
		</div>
		</c:forEach>
	</div>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>
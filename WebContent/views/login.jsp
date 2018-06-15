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
<script>
	function check(form){
		//유효성검사
		if(form.id.value == ""){
			alert("아이디를 입력해주세요.");
			form.id.focus();
			return;
		}
		if(form.password.value == ""){
			alert("패스워드를 입력해주세요");
			form.password.focus();
			return;
		}
		form.submit();
	}
</script>
</head>
<body>
	<jsp:include page="/views/menu.jsp"/>
	<form action="${pageContext.request.contextPath}/login" class="text-center" method="post">
		<div class="main ">	
		 	<div class="form-group form-inline">
		 		<label for="id">아이디</label>
		 		<input type="text" name="id" id="id" class="form-control" />
		 	</div>
		 	<div class="form-group form-inline">
		 		<label for="password">패스워드</label>
		 		<input type="password" name="password" id="password" class="form-control" />
		 	</div>
		</div>
		<button type="button" onclick="check(this.form)"  class="btn btn-default">로그인</button>
		<button type="button" onclick="location.href='${pageContext.request.contextPath}/main'" class="btn btn-default">취소</button>
	</form>
	
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>
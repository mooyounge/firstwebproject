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
	var dualCheck = false;
	
	function checkPwd(){
		var password = $("#password").val();
		var password_check = $("#password_check").val();
		if(password_check == ""){
			$("#alert").html("");
		}else if(password == password_check){
			$("#alert").html("success");
		}else{
			$("#alert").html("please check the password");
		}
	}
	
	function checkId(){
		var id = $("#id").val();
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/Idcheck",
			data:{id:id},
			success:function(data){
				if(data == 'y'){
					alert("중복된 아이디 입니다.");
				}else if(data == 'n'){
					alert("사용가능한 아이디 입니다.");
					dualCheck = true;
				}else{
					alert("잠시후 다시시도해 주세요.");
				}
			}
		});
	}
	
	function check(form){
		//console.log(form);
		//console.log(form.id);
		//console.log(form.name.value);
		
		if(form.id.value==""){
			alert("아이디를 입력해 주세요.");
			form.id.focus();
			return;
		}
		
		if(form.password.value==""){
			alert("패스워드를 입력해 주세요.");
			form.password.focus();
			return;
		}
		
		if($("#alert").html() !="success"){
			alert("두 비밀번호가 일치하지 않습니다.");
			return;
		}
		
		if(form.name.value==""){
			alert("이름을 입력해 주세요.");
			form.name.focus();
			return;
		}
		if(dualCheck == false){
			alert("중복확인을 해주세요");
			return;
		}
		
		form.submit();
		
	}

</script>
</head>
<body>
	<jsp:include page="/views/menu.jsp"/>
	<form action="${pageContext.request.contextPath}/insert" method="post" class="text-center">
		<div class="main ">	
		 	<div class="form-group form-inline">
		 		<label for="id">아이디</label>
		 		<input type="text" name="id" id="id" class="form-control" onkeyup="dualCheck = false" />
		 		<button class="btn btn-default" onclick="checkId()" type="button">중복확인</button>
		 	</div>
		 	<div class="form-group form-inline">
		 		<label for="password">패스워드</label>
		 		<input type="password" name="password" id="password" class="form-control" onkeyup="checkPwd()" />
		 		<span id="alert"></span>
		 	</div>
		 	<div class="form-group form-inline">
		 		<label for="password_check">패스워드 확인</label>
		 		<input type="password" name="password_check" id="password_check" class="form-control" onkeyup="checkPwd()" />
		 	</div>
		 	<div class="form-group form-inline">
		 		<label for="name">이름</label>
		 		<input type="text" name="name" id="name" class="form-control" />
		 	</div>
		</div>
		<button type="submit" class="btn btn-default">회원가입</button>
		<button type="button" onclick="location.href='${pageContext.request.contextPath}/main'" class="btn btn-default">취소</button>
	</form>
	
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>
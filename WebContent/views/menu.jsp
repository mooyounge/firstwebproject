<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>
<div class="header">
	<h2>Reddit</h2>
</div>
<div class="container">
	<ul class="nav navbar-nav">
		<li class="menu-item">
			<a href="${pageContext.request.contextPath}/main">홈으로</a>
		</li>

	
	<!-- 로그인 전 -->
	<c:if test="${sessionScope.id == null }">
		<li class="menu-item">
			<a href="${pageContext.request.contextPath}/login">로그인</a>
		</li>
		<li class="menu-item">
			<a href="${pageContext.request.contextPath}/insert">회원가입</a>
		</li>
	</c:if>
	
	<!-- 로그인 후 -->
	<c:if test="${sessionScope.id != null }">
		<li><a href="${pageContext.request.contextPath}/logout">
				로그아웃</a></li>
		<li class="menu-item">
			<a href="${pageContext.request.contextPath}/board">방명록</a>
		</li>
		<li class="menu-item">
			<a href="${pageContext.request.contextPath}/photo">사진첩</a>
		</li>
	</c:if>
	</ul>
</div>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8">
	<script type="text/javascript">
		function memmodi(){
			$("#modiform").submit();
		}
	</script>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
		<a class="navbar-brand" href="/prac">홈</a>
		<ul class="navbar-nav">
			<li class="nav-item">
				<a class="nav-link" href="/prac/board">게시판</a>
			<li>
		</ul>
		<ul class="navbar-nav ml-auto">
			<c:if test="${empty id}">
				<li class="nav-item">
					<a class="nav-link" href="/prac/login">로그인</a>
				</li>
			</c:if>
			<c:if test="${not empty id}">
				<li class="navbar-text" style="color:white">${name}님 환영합니다.</li>
				<li class="nav-item">
					<a class="nav-link" href="javascript:memmodi()">회원정보 수정</a>
					<form id="modiform" action="/prac/member/modify" method="post">
						<input type="hidden" name="id" value="${id}">
					</form>
				<li>
				<li class="nav-item">
					<a class="nav-link" href="/prac/logout">로그아웃</a>
				</li>
			</c:if>
		</ul>
	</nav>
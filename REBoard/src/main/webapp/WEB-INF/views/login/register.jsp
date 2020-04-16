<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>register</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/register.js"></script>
</head>
<body>
	<div id="top">
		<jsp:include page="../../views/main/top.jsp"/>
	</div>
	<div>
		<div class="jumbotron">
			<fieldset>
				<form id="regiform" action="/prac/member/insert" method="POST">
					<div>
						<h3>회원 가입</h3>
					</div>
					<c:if test="${regiscs eq false}">
						<div>
							<font color=red>회원가입 오류</font>
						</div>
					</c:if>
					<div class="form-group">
						<input type="text" id="regiid" name="id" placeholder="아이디" tabindex="1" maxlength="20" class="form-control">
						<span id="regiidcheck"></span>
					</div>
					<div class="form-group">
						<input type="password" id="regipw" name="pw" placeholder="비밀번호" tabindex="2" maxlength="20" class="form-control">
						<span id="regipwcheck"></span>
					</div>
					<div class="form-group">
						<input type="password" id="regipwr" placeholder="비밀번호 확인" tabindex="3" maxlength="20" class="form-control">
						<span id="regipwrcheck"></span>
					</div>
					<div class="form-group">
						<input type="text" id="reginame" name="name" placeholder="이름" tabindex="4" maxlength="20" class="form-control">
					</div>
					<button type="button" id="backbtn" class="btn btn-dark">돌아가기</button>
					<input type="submit" class="btn btn-dark float-right" value="가입하기">
				</form>
			</fieldset>
		</div>
	</div>
</body>
</html>
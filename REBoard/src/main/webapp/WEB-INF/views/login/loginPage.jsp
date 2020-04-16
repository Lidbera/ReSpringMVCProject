<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>login</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#regibtn").click(function() {
				location.href="/prac/login/register";
			})
		})
	</script>
</head>
<body>
	<div id="top">
		<jsp:include page="../../views/main/top.jsp"></jsp:include>
	</div>
	<div>		
		<div id="content" class="jumbotron">
			<c:if test="${not empty id}">
				<font color="red">잘못된 접근입니다.</font>
			</c:if>
			<c:if test="${regiscs eq true}">
				<div>
					<font color=blue>회원가입 성공</font>
				</div>
			</c:if>
			<c:if test="${empty id}">
				<fieldset>
					<form id="logiform" action="/prac/member/login" method="POST">
						<div>
							<h3>로그인</h3>
						</div>
						<c:if test="${logfail eq true}">
							<div id="logicheck">
								<font color=red>로그인에 실패했습니다.</font>
							</div>
							<c:set var="logfail" value="false" scope="session" />
						</c:if>
						<div class="form-group">
							<input type="text" id="logiid" name="id" placeholder="아이디" tabindex="1" maxlength="20" class="form-control">
						</div>
						<div class="form-group">
							<input type="password" id="logipw" name="pw" placeholder="비밀번호" tabindex="2" maxlength="20" class="form-control">
						</div>
						<button type="button" id="regibtn" class="btn btn-dark">회원가입</button>
						<input type="submit" class="btn btn-dark float-right" value="로그인">
					</form>
				</fieldset>
			</c:if>
		</div>
	</div>
</body>
</html>
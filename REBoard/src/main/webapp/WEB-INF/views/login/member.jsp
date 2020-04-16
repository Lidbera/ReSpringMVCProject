<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>member</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(function() {
			function errDisplay(val){
				val.stop();
				val.animate({opacity: '0'}, 'fast');
				val.animate({opacity: '1'}, 'fast');
			}
			function pwcheck() {
				if(pwcheck_1() && pwcheck_2()){
					return true;
				}
				return false;
			}
			function pwcheck_1(){
				var pw = $("#modipw").val();
				var _pwcheck = $("#modipwcheck");
				if(pw.length < 8){
					_pwcheck.html("<font color=red>비밀번호는 8자 이상이어야 합니다.</font>");
					errDisplay(_pwcheck);
					console.log("1 false");
					return false;
				}else{
					_pwcheck.html("");
					console.log("1 true");
					return true;
				}
			}
			function pwcheck_2(){
				var pw = $("#modipw").val();
				var pwr = $("#modipwr").val();
				var pwcheck = $("#modipwrcheck");
				
				if(pw.length < 1 || pwr.length < 1){
					return;
				}
				if(pw == pwr){
					pwcheck.html("<font color=green>비밀번호가 일치합니다.</font>");
					console.log("2 true");
					return true;
				}else{
					pwcheck.html("<font color=red>비밀번호가 일치하지 않습니다.</font>");
					errDisplay(pwcheck);
					console.log("2 false");
					return false;
				}
			}
			$("#modipw").focusout(function() {
				pwcheck();
			})
			function namecheck() {
				var name = $("#modiname").val();
				var namecheck = $("#modinamecheck");
				if(name.length > 0){
					namecheck.html("");
					return true;
				}else{
					namecheck.html("<font color=red>이름은 공백으로 할 수 없습니다.</font>");
					errDisplay(namecheck);
					return false;
				}
			}
			$("#modipwr").focusout(function() {
				pwcheck();
			})
			$("#backbtn").click(function() {
				window.history.back();
			})
			
			$("#memform").submit(function(){
				if(pwcheck() && namecheck()){
					console.log("all checked");
					return true;
				}
				else return false;
			});
		})
	</script>
</head>
<body>
	<div id="top">
		<jsp:include page="../../views/main/top.jsp"/>
	</div>
	
	<div id="content" class="jumbotron">
		<c:if test="${empty id}">
			<font color="red">잘못된 접근입니다.</font>
		</c:if>
		<c:if test="${!empty id}">
			<fieldset>
				<form id="memform" action="/prac/member/update" method="post">
					<div>
						<h3>회원 정보 수정</h3>
					</div>
					<div id="memcheck" class="form-group">
							<c:if test="${memcheck eq true}">
								<font color=green>수정이 완료되었습니다.</font>
							</c:if>
							<c:if test="${memcheck eq false}">
								<font color=red>수정에 실패했습니다.</font>
							</c:if>
						</div>
					<div class="form-group">
						<input type="text" id="modiid" name="id" readonly="readonly" value="${id}" class="form-control">
					</div>
					<div class="form-group">
						<input type="password" id="modipw" name="pw" placeholder="비밀번호" tabindex="1" maxlength="20" class="form-control">
						<span id="modipwcheck"></span>
					</div>
					<div class="form-group">
						<input type="password" id="modipwr" placeholder="비밀번호 확인" tabindex="2" maxlength="20" class="form-control">
						<span id="modipwrcheck"></span>
					</div>
					<div class="form-group">
						<input type="text" id="modiname" name="name" placeholder="이름" value="${name}" tabindex="3" maxlength="20" class="form-control">
					</div>
					<button type="button" id="backbtn" class="btn btn-dark">돌아가기</button>
					<input type="submit" class="btn btn-dark float-right" value="수정하기">
				</form>
			</fieldset>
		</c:if>
	</div>
</body>
</html>
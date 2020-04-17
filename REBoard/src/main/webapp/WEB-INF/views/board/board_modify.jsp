<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>board</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#title").val("${board.title}");
			$("#con").val("${board.content}");
			
			$("#bmodiform").submit(function(){
				var title_mod = $("#title").val();
				var content_mod = $("#con").val();
				if(title.length < 1 || content.length < 1){
					alert("제목 혹은 내용이 없습니다.");
					return false;
				}
				return true;
			});
			
			$("#con").keydown(function() {
				var cont = $("#con").val();
				console.log(cont);
			})
			$("#backbtn").click(function() {
				window.history.back();
			})
		})
	</script>
</head>
<body>
	<div>
		<div id="top">
			<jsp:include page="../../views/main/top.jsp"></jsp:include>
		</div>
		
		<c:if test="${board.writer_name eq name}">
			<div id="content" class="jumbotron">
				<form id="bmodiform" action="/prac/board/update" method="post">
					<input type="hidden" name="index" value="${board.index}">
					<input type="hidden" name="writer_id" value="${id}">
					<input type="hidden" name="writer_name" value="${name}">
					<table class="table table-white">
						<tr>
							<th>제목</th>
							<td>
								<input id="title" name="title" placeholder="제목을 입력해주세요." tabindex="1" class="form-control">
							</td>
						</tr>
						<tr>
							<th>내용</th>
							<td>
								<textarea id="con" name="content" tabindex="2" rows="10" cols="10" placeholder="내용을 입력해주세요." class="form-control"></textarea>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<div id="wricheck">
								</div>
								<input type="button" id="backbtn" value="뒤로" class="btn btn-dark">
								<input type="submit" id="writebtn" value="등록" class="btn btn-dark float-right">
							</td>
						</tr>
					</table>
				</form>
			</div>
		</c:if>
		<c:if test="${board.writer_name ne name}">
			<font color=red>잘못된 접근입니다.</font>
		</c:if>
	</div>
</body>
</html>
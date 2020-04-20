<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="jumbotron">
	<div class="float-right">${vo.writer_name}</div>
	<h2 id="board_title">${vo.title}</h2>
	<hr color="gray">
	<div id="board_content">${vo.content}</div>
	<c:if test="${vo.filename ne '/upload/null'}">
		<br><img src="${pageContext.request.contextPath}${vo.filename}"
			width="300" height="300"><br>
	</c:if>
	
	<c:if test="${id eq vo.writer_id}">
		<div id="post_modbtn">
			<button type='button' onclick='modboard("${vo.title}", "${vo.content}")' class="btn btn-dark float-right">수정</button>
		</div>
		<div id="post_rembtn">
			<button type='button' onclick='remboard()' class="btn btn-dark float-right">삭제</button>
		</div>
	</c:if>
</div>
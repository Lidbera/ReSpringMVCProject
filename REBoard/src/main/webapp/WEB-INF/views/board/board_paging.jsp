  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<ul class="pagination">
	<li class="page-item"><a class=
		<c:if test="${num le 1}">"btn disabled"</c:if>
		<c:if test="${num gt 1}">"page-link"</c:if>
	href="#" onclick="page(${num - 1})">Previous</a></li>
	<c:forEach var="i" begin="1" end="${count}">
		<li class=
			<c:if test="${num eq i}">"page-item active"</c:if>
			<c:if test="${num ne i}">"page-item"</c:if>
		><a class="page-link" href="#" onclick="page(${i})">${i}</a></li>
	</c:forEach>
	<li class="page-item"><a class=
		<c:if test="${num lt count}">"page-link"</c:if>
		<c:if test="${num ge count}">"btn disabled"</c:if>
	href="#" onclick="page(${num + 1})">Next</a></li>
</ul>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach var="vo" items="${list}">
	<tr>
		<td width="100">${vo.index}</td>
		<td><a href="/prac/board/${vo.index}">${vo.title}</a></td>
		<td width="150">${vo.writer_name}</td>
	</tr>
</c:forEach>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table class="table table-white">
	<c:forEach var="vo" items="${list}">
 		<tr>
	 		<th width="150">${vo.writer}</th>
	 		<td id="reply${vo.num}_con">${vo.content}</td>
	 		<c:if test="${name eq vo.writer}">
	 			<td width="100"><button id="reply${vo.num}_mod" onclick="modreply(${vo.num})" class="btn btn-dark">수정</button></td>
	 			<td width="100"><button id="reply${vo.num}_rem" onclick="delreply(${vo.num})" class="btn btn-dark">삭제</button></td>
	 		</c:if>
	 	</tr>
	</c:forEach>
</table>
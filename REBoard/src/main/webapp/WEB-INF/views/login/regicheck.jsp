<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<c:if test="${regiidcheck eq true}">
		<font color=green>사용할 수 있는 아이디입니다.</font>
	</c:if>
	<c:if test="${regiidcheck eq false}">
		<font color=red>이미 존재하는 아이디입니다.</font>
	</c:if>
</html>
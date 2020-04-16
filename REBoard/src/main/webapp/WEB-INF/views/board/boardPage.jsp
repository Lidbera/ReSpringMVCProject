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
			$("#writebtn").click(function() {
				location.href="board/write";
			})
		})
	</script>
</head>
<body>
	<div>
		<div id="top">
			<jsp:include page="../../views/main/top.jsp"></jsp:include>
		</div>
		<br>
		<div id="content">
			<jsp:include page="boardPage_list.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>
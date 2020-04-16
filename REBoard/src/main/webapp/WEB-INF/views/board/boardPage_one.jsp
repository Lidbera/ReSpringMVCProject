<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>board</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript">
		function getParameterByName(name) {
		    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
		    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
		        results = regex.exec(location.search);
		    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
		}
		var index = ${index};
		$(function() {
			$.ajax({
				url:"select",
				type: 'POST',
				data: {index:index},
				success:function(res) {
					$("#post").html(res);
				},
			})
			.fail(function() {
				$("#post").html("<font color=red>존재하지 않는 게시물입니다.</font>");
				$("#replybtn").hide();
			})
			.done(function() {
				$.ajax({
					url:"reply_list",
					data: {boardindex:index},
					success:function(res) {
						$("#comment").html(res);
					}
				})
			})
			$("#backbtn").click(function() {
				location.href="board";
			})
			$("#replybtn").click(function() {
				var content = $("#con");
				var val = content.val();
				
				if(val.length < 1){
					alert("내용이 없습니다.");
					return;
				}
				var writer = "${name}";
				$.ajax({
					url:"reply_write",
					data: {
							boardindex:index,
							writer:writer,
							content:val
						},
					success:function(res) {
						$("#comment").html(res);
						content.val("");
					}
				})
			})
			$("#writebtn").click(function() {
				location.href="board_write.jsp";
			})
		})
		function modboard(title, content) {
			location.href="/prac/board/modify/" + index;
		}
		function delreply(num) {
			if(!confirm("정말 삭제하시겠습니까?")){
				return;
			}
			var writer = "${name}";
			$.ajax({
				url:"reply_delete",
				data: {
					boardindex:index,
					num:num,
					writer:writer
					},
				success:function(res) {
					$("#comment").html(res);
				}
			})
		}
		function modreply(num) {
			var con = $("#reply" + num + "_con").html();
			con = con.replace(/\n/g, "");
			$("#reply" + num + "_con").html("<textarea id='rcon' style='resize: none; overflow: hidden; overflow-wrap: break-word;' class='form-control'>" + con + "</textarea>");
			$("#reply" + num + "_mod").html("등록");
			$("#reply" + num + "_mod").attr("onclick", "modreply_ok(" + num + ")");
			$("#reply" + num + "_rem").html("취소");
			$("#reply" + num + "_rem").attr("onclick", "canreply('" + num + "','" + con + "')");
		}
		function canreply(num, con) {
			$("#reply" + num + "_con").html(con);
			$("#reply" + num + "_mod").html("수정");
			$("#reply" + num + "_mod").attr("onclick", "modreply(" + num + ")");
			$("#reply" + num + "_rem").html("삭제");
			$("#reply" + num + "_rem").attr("onclick", "delreply(" + num + ")");
		}
		function modreply_ok(num){
			var content = $("#rcon").val();
			$.ajax({
				url:"reply_modify",
				data: {
					boardindex:index,
					num:num,
					content:content
					},
				success:function(res) {
					$("#reply" + num + "_con").html(res);
					$("#reply" + num + "_mod").html("수정");
					$("#reply" + num + "_mod").attr("onclick", "modreply(" + num + ")");
					$("#reply" + num + "_rem").html("삭제");
					$("#reply" + num + "_rem").attr("onclick", "delreply(" + num + ")");
				}
			})
		}
	</script>
</head>
<body>
	<div>
		<div id="top">
			<jsp:include page="../../views/main/top.jsp"></jsp:include>
		</div>
		<br>
		<div id="content" class="container">
			<div id="post">
			</div>
			<div id="comment">
			</div>
			<c:if test="${!empty id}">
				<div>
					<textarea id="con" style="resize: none; overflow: hidden; overflow-wrap: break-word;" class="form-control"></textarea>
				</div>
				<div>
					<input type="submit" id="replybtn" class="btn btn-dark float-right" value="등록">
				</div>
			</c:if>
		</div>
		<br><br><br>
		<div>
			<jsp:include page="boardPage_list.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>
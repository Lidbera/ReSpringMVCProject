<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>board</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#writebtn").click(function() {
				var title = $("#title").val();
				var content = $("#con").val();
				if(title.length < 1 || content.length < 1){
					alert("제목 혹은 내용이 없습니다.");
					return;
				}
				var id = "${id}";
				var name = "${name}";
				$.ajax({
					url: "board/write",
					data: {
						writer_id:id,
						writer_name:name,
						title:title,
						content:content
						},
					success:function(res){
						var wricheck = $("#wricheck");
						if(wricheck.length == 1){
							location.href="board.jsp";
						}else{
							wricheck.html(res);
						}
					}
				})
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
		
		<div id="content" class="jumbotron">
			<table class="table table-white">
				<tr>
					<th>제목</th>
					<td>
						<input id="title" placeholder="제목을 입력해주세요." tabindex="1" class="form-control">
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea id="con" tabindex="2" rows="10" cols="10" placeholder="내용을 입력해주세요." class="form-control"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<div id="wricheck">
						</div>
						<input type="button" id="backbtn" value="뒤로" class="btn btn-dark">
						<input type="button" id="writebtn" value="등록" class="btn btn-dark float-right">
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>
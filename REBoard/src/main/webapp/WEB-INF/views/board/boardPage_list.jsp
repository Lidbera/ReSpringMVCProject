<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	.pagination {
		justify-content: center;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	var num = "${num}";
	if(num == ""){
		num = 1;
	}
	$.ajax({
		url:"/prac/board/boardList",
		data: {tnum:num},
		success:function(res) {
			$("#posts").html(res);
		}
	})
	$.ajax({
		url:"/prac/board/paging",
		data: {num:num},
		success:function(res) {
			$("#paging").html(res);
		}
	})
	function page(index) {
		$.ajax({
			url:"/prac/board/paging",
			data: {num:index},
			success:function(res) {
				$("#paging").html(res);
			}
		})
		$.ajax({
			url:"/prac/board/boardList",
			data: {tnum:index},
			success:function(res) {
				$("#posts").html(res);
			}
		})
	}
</script>
<div class="container">
	<c:if test="${not empty id}">
		<button type="button" id="writebtn" class="btn btn-outline-dark float-right">글쓰기</button>
		<br><br>
	</c:if>
	<div class="form-group">
		<table summary="게시글 목록" class="table table-dark" style="text-align:center">
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">제목</th>
					<th scope="col">글쓴이</th>
				</tr>
			</thead>
			<tbody id="posts">
			</tbody>
		</table>
	</div>
	<div id="paging">
	</div>
</div>
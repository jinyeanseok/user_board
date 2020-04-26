<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
  <style type="text/css">
			li {list-style: none; float: left; padding: 6px;}
	</style>
<script>
	var result = '${result}';
	if(result === 'registerOK'){
		alert('등록이 완료되었습니다.');
	}
	
	if (result === 'removeOK') {
		confirm("삭제 하시겠습니까?");
		alert("삭제 되었습니다.");
	}
	
	
</script>
</head>

<body>
	<h1 align="center">게시판</h1>
	<hr/>
	<a href="/board/register"><button>글 등록</button></a>
	<hr/>
	<table class="table table-bordered">
	
	<tr>
		<th style="width: 10px">글 번호</th>
		<th>제목</th>
		<th>작성일자</th>
		<th style="width: 40px">조회수</th>
	</tr>
	

	<c:forEach items="${list}" var="boardVO">
		<tr>
			<td>${boardVO.board_number}</td>
			<td><a href="/board/read?board_number=${boardVO.board_number}">${ boardVO.title }</a></td>
			<td><fmt:formatDate pattern="YYYY-MM-dd HH:mm:ss" value="${ boardVO.create_date}"/></td>
			<td>${boardVO.view_count }</td>
		</tr>
	</c:forEach>
	
</table>

</body>
</html>


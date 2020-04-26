<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
  <style type="text/css">
			li {list-style: none; float: left; padding: 6px;}
	</style>
</head>
<body>
	<h1>게시판</h1>
	<hr/>
	<a href="/board/listPage"><button>목록</button></a>
	<hr/>
	

	<c:if test="${msg == null}">
		<form method="post">
		<div>
			<label for="title">제목</label>
			<input type="text" id="title" name="title" placeholder="제목" />
		</div>
		
		<div>
			<label for="contents">내용</label>
			<textarea id="contents" name="contents" placeholder="내용"></textarea>
		</div>
				
		<div>
			<label for="name">작성자</label>
			<input type="text" id="name" name="name" value="${user.name}" readonly="readonly">
		</div>		
		<div>
			<button type="submit">등록</button>
		</div>
		<div>
		</div>
	</form>
	</c:if>
	
	<c:if test="${msg == false}">
		<script>
			alert("로그인이 필요합니다.");
		</script>
		
		<div><a href="/">처음으로</a></div>
	</c:if>
	
	

</body>
</html>
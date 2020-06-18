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
			
			 a:link { color: black; text-decoration: none;}
			 a:visited { color: black; text-decoration: none;}
			 a:hover { color: blue; text-decoration: underline;}
			 
	</style>
	
	
	
</head>
<body>
	<h1 align="center"><a href="/">게시판</a></h1>
	<hr/>
	
	<div class="container">
	
		<c:if test="${user.identification == boardVO.identification }">
			<form action="/board/remove?board_number=${boardVO.board_number}" method="post">
					<a><button class="btn btn-danger">게시글 삭제</button></a>
			</form>
		</c:if>
	</div>
	
	<br />
	
	<form method="post">
	<div>
		<div class="form-group">
			<div class="container">
				<label for="title">제목</label>
				<input type="text" class="form-control" id="title" name="title" placeholder="제목" value="${boardVO.title }" required/>
			</div>
		</div>
			
		<div class="form-group">
			<div class="container">
				<label for="contents">내용</label>
				<textarea id="contents" class="form-control" rows="10" name="contents" placeholder="내용" required>${boardVO.contents}</textarea>
			</div>
		</div>
		
		<div class="form-group">	
			<div class="container">
				<button type="submit" class="btn btn-success">저장</button>
			</div>
		</div>
	</div>	
	</form>
			
</body>
</html>
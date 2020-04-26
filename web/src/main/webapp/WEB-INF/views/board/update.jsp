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
	
	<div>
	
	<a href="/board/listPage"><button>목록</button></a>
	
	<form action="/board/remove?board_number=${boardVO.board_number}" method="post">
			<a><button>게시글 삭제</button></a>
	</form>
	
	</div>
	<hr/>
	

	
	<form method="post">
	<div>
		<div>
			<label for="title">제목</label>
			<input type="text" id="title" name="title" placeholder="제목" value="${boardVO.title }" />
		</div>
		
		<div>
			<label for="contents">내용</label>
			<textarea id="contents" name="contents" placeholder="내용" >${boardVO.contents}</textarea>
		</div>
		
		<div>
			<button type="submit">저장</button>
		</div>
	</div>	
	</form>
			
</body>
</html>
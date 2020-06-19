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
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
	  <style type="text/css">
				li {list-style: none; float: left; padding: 6px;}
				
				a:link { color: black; text-decoration: none;}
				a:visited { color: black; text-decoration: none;}
				a:hover { color: blue; text-decoration: underline;}
				
				h1 { padding: 40px}
				 
	  </style>
</head>
<body>
	<h1 align="center"><a href="/">게시판</a></h1><hr />
	
	<!-- <c:if test="${msg == null}">
	<a href="/board/listPage"><button>목록</button></a>
	</c:if> -->

		<div class="container">
			<form method="post" enctype="multipart/form-data">
				<div class="form-group">
					<div class="container">
						<label for="title">제목</label>
						<input type="text" class="form-control" id="title" name="title" placeholder="제목" required/>
					</div>
				</div>
				
				<div class="form-group">
					<div class="container">
						<label for="contents">내용</label>
						<textarea id="contents" class="form-control" rows="10" name="contents" placeholder="내용" required></textarea>
					</div>
				</div>
						
				<div class="form-group">
					<div class="container">
						<label for="name">작성자</label>
						<input type="text" class="form-control" id="name" name="name" value="${user.name}" readonly="readonly" required>
					</div>
				</div>		
				
				<div class="form-group">
					<div class="container">
						<label for="identification">아이디</label>
						<input type="text" class="form-control" id="identification" name="identification" value="${user.identification}" readonly="readonly" required>
					</div>
				</div>	
				
				<div class="form-group">
					<div class="container">
						<input type="file" name="file">
					</div>
				</div>
				
				<div class="form-group">
					<div class="container">
					<button type="submit" class="btn btn-primary">등록</button>
					</div>
				</div>
			</form>
		</div>

	
	<c:if test="${msg == false}">
		<script>
			alert("로그인이 필요합니다.");
		</script>
		
		<div><a href="/">처음으로</a></div>
	</c:if>
	
	

</body>
</html>
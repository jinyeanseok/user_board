<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
  <style type="text/css">
			li {list-style: none; float: left; padding: 6px;}
	</style>
</head>
<body>
	<h1 align="center"><a href="/">회원수정</a></h1>
	<hr/>

	<form method="post">
		<div>
			<label for="name">이름</label>
			<input type="text" id="name" name="name" value="${user.name}" } />
		</div>
		
		<div>
			<label for="password">새 비밀번호</label>
			<input type="password" id="password" name="password" required />
		</div>
				
		<div>
			<button type="submit" id="submit">회원정보 수정</button>
		</div>
	
	
	</form>
		<div>
			<button><a href="/">처음으로</a></button>
		</div>
</body>
</html>
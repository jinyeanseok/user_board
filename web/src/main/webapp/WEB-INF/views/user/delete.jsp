<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보삭제</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
  <style type="text/css">
			li {list-style: none; float: left; padding: 6px;}
	</style>
</head>
<body>
	<h1>회원삭제</h1>
	<hr/>

	<form method="post">
		<div>
			<label for="identification">아이디</label>
			<input type="text" id="identification" name="identification" value="${user.identification}" } />
		</div>
		
		<div>
			<label for="password">비밀번호</label>
			<input type="password" id="password" name="password" required/>
		</div>
				
		<div>
			<button type="submit">회원탈퇴</button>
		</div>
		
	</form>
		<div>
			<button><a href="/">처음으로</a></button>
		</div>

	
	<c:if test="${msg == 'deleteFalse' }">
	<script>
		alert("회원탈퇴에 실패했습니다.");
	</script>
</c:if>

</body>
</html>
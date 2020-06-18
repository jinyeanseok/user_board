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
			
			.container { 
			  position: absolute;
			  width: 400px; 
			  height: 450px; 
			  background-color: gray; 
			  margin-left: -200px; 
			  margin-top: -200px; 
			  left: 50%; 
			  top: 50%; 
			  border-radius: 30px;
			}
			
			 a:link { color: red; text-decoration: none;}
			 a:visited { color: black; text-decoration: none;}
			 a:hover { color: blue; text-decoration: underline;}
  </style>
</head>
<body>
	<div class="auth-form px-3">
		<article class="container">
			<div class="col-md-6 col-md-offset-3">
				<h1 align="center"><a href="/">회원삭제</a></h1>
			</div>
		
			<div class="col-sm-6 col-md-offset-3">
				<form method="post">
					<div class = "form-group">
						<label for="identification">아이디</label>
						<input type="text" class="form-control" id="identification" name="identification" value="${user.identification}" readonly="readonly"} />
					</div>
					
					<div class = "form-group">
						<label for="password">비밀번호</label>
						<input type="password" class="form-control" id="password" name="password" required/>
					</div>
							
					<div class = "form-group">
						<button type="submit" id="submit" class="btn btn-success btn-block">회원탈퇴</button>
						<button type="button" onclick="location.href='../'" class="btn btn-primary btn-block">처음으로</button>
					</div>
					
				</form>
			</div>
				
		
			
			<c:if test="${msg == false }">
				<script>
					alert("회원탈퇴를 실패했습니다.");
				</script>
			</c:if>
		</article>
	</div>
</body>
</html>
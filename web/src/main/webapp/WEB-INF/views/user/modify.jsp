<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
			
			.container { 
			  position: absolute;
			  width: 400px; 
			  height: 300px; 
			  background-color: gray; 
			  margin-left: -200px; 
			  margin-top: -200px; 
			  left: 50%; 
			  top: 50%; 
			  border-radius: 30px;
			  opacity: 0.8;
			}
			
			 a:link { color: red; text-decoration: none;}
			 a:visited { color: white; text-decoration: none;}
			 a:hover { color: blue; text-decoration: underline;}
				
			 #image {
					background-image:url(https://cdn.pixabay.com/photo/2016/03/09/09/14/books-1245690_960_720.jpg);
					background-repeat : no-repeat;
					background-size : cover;
			 	}

  </style>
</head>
<body id="image">
	<div class="auth-form px-3">
		<article class="container">
			<div class="col-md-6 col-md-offset-3">
				<h1 align="center"><a href="/">회원수정</a></h1>
			</div>
			
			<div class="col-sm-6 col-md-offset-3">
				<form method="post">
					<div class = "form-group">
						<label for="name">이름</label>
						<input type="text"  class="form-control" id="name" name="name" value="${user.name}" } />
					</div>
					
					<div class = "form-group">
						<label for="password">새 비밀번호</label>
						<input type="password"  class="form-control" id="password" name="password" required />
					</div>
							
					<div class = "form-group">
						<button type="submit" id="submit" class="btn btn-success btn-block">회원정보 수정</button>
						<button type="button" onclick="location.href='../'" class="btn btn-primary btn-block">처음으로</button>
					</div>
				</form>
			</div>
			
			</article>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시판</title>
	<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
	
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
				}
				
				 a:link { color: red; text-decoration: none;}
				 a:visited { color: black; text-decoration: none;}
				 a:hover { color: blue; text-decoration: underline;}


	  </style>
	
	<script>
		var result = '${result}';
		if(result === 'modifyOK') {
			alert("수정되었습니다.")
		}
		else if(result === 'registerOK') {
			alert("회원가입에 성공하였습니다.")
		}
	</script>
	
</head>
<body>
	<article class="container">
			<div class="col-md-6 col-md-offset-3">
				<h1 align="center"><a href="/">게시판</a></h1>
			</div>
	<!-- 
	<a href="/board/register">글 작성</a><br />
	<a href="/board/listPage">글목록</a><br />
	 -->
	
	<c:if test="${user == null }">
		<div class="col-sm-6 col-md-offset-3">
			<form role="form" method="post" autocomplete="off" action="/user/login">
				 <div class = "form-group">
				  <label for="identification">아이디</label>
				  <input type="text" class="form-control" id="identification" name="identification" required/>
				 </div>
				 
				 <div class = "form-group">
				  <label for="password">비밀번호</label>
				  <input type="password" class="form-control" id="password" name="password" required/>
				 </div>
				 
				 <div class="form-group text-center">
				 	<button type="submit" class="btn btn-success btn-block">로그인</button>
				 	<a href="/user/register" class="btn btn-primary btn-block">회원가입</a>
				 </div>
			</form>
		</div>
	</c:if>
	
 
	
	<c:if test="${msg == 'registerOK' }">
		<script>
			alert("회원가입을 성공했습니다.")
		</script>
	</c:if>
	
	<c:if test="${msg == 'registerNO' }">
		<script>
			alert("회원가입에 실패하였습니다.")
		</script>
	</c:if>
	
	<c:if test="${msg == 'loginFalse' }">
		<script>
			alert("로그인을 실패했습니다.");
		</script>
	</c:if>
	
	<c:if test="${msg == 'loginTrue' }">
		<script>
			alert("로그인 되었습니다.");
		</script>
	</c:if>
	
	<c:if test="${msg == 'logOutOK' }">
		<script>
			alert("로그아웃 되었습니다.");
		</script>
	</c:if>
	
	<c:if test="${msg == 'updateOK' }">
		<script>
			alert("회원정보가 수정되었습니다.");
		</script>
	</c:if>
	
	
	<c:if test="${user != null }">
		<!-- <div>
			${user.name}(${user.identification})님 반갑습니다.
		</div> -->
		<br/>
		<br/>
		<br/>
		<br/>
		<a href="/board/register" class="btn btn-success btn-block">글 작성</a>
		<a href="/board/listPage" class="btn btn-info btn-block">글목록</a>
		<a href="/user/modify" class="btn btn-primary btn-block">회원정보 수정</a>
		<a href="/user/logout" class="btn btn-warning btn-block">로그아웃</a>
		<a href="/user/delete" class="btn btn-danger btn-block">회원탈퇴</a>
	</c:if>
	
	<c:if test="${msg == 'deleteOK' }">
		<script>
			alert("탈퇴 되었습니다.");
		</script>
	</c:if>





	</article>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
	<title>게시판</title>
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
<h1 align="center">게시판</h1>

<a href="/board/register">글 작성</a><br />
<a href="/board/listPage">글목록</a><br />

<c:if test="${user == null }">
<form role="form" method="post" autocomplete="off" action="/user/login">
	 <div>
	  <label for="identification">아이디</label>
	  <input type="text" id="identification" name="identification" required/>
	 </div>
	 
	 <div>
	  <label for="password">비밀번호</label>
	  <input type="password" id="password" name="password" required/>
	 </div>
	 <div><button type="submit">로그인</button></div>
	 <div><a href="/user/register">회원가입</a></div>
</form>
</c:if>

<c:if test="${msg == 'registerOK' }">
	<script>
		alert("회원가입을 성공했습니다.")
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


<c:if test="${user != null }">
	<div>
		${user.name}님 반갑습니다.
	</div>
	<a href="/user/modify">회원정보 수정</a>
	<a href="/user/logout">로그아웃</a>
	<a href="/user/delete">회원탈퇴</a>
</c:if>

<c:if test="${msg == 'deleteOK' }">
	<script>
		alert("탈퇴 되었습니다.");
	</script>
</c:if>






</body>
</html>

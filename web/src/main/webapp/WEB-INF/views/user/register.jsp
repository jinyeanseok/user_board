<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원</title>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
  <style type="text/css">
			li {list-style: none; float: left; padding: 6px;}
	</style>
	
	<script>
		function fn_idChk() {
			$.ajax({
				url : "/user/idChk",
				type : "post",
				dataType : "json",
				data : {"identification" : $('#identification').val()}, // val 내부에 입력된 값을 가져오라
				success : function(data){
					if(data == 1) {
						alert("중복된 아이디입니다.");
					}else if(data == 0) {
						$('#idChk').attr("value", "Y");
						alert("사용가능한 아이디입니다.");
					}
				}
			})
		}
	</script>
</head>
<body>

	<h1 align="center"><a href="/">회원가입</a></h1>
	<hr/>
	
	<form method="post">
		<div>
			<label for="identification">아이디</label>
			<input type="text" id="identification" name="identification" placeholder="아이디"  required/>
			<button class="idChk" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>
		</div>
		
		<div>
			<label for="name">이름</label>
			<input type="text" id="name" name="name" placeholder="이름" required/>
		</div>
		
		<div>
			<label for="password">비밀번호</label>
			<input type="password" id="password" name="password" placeholder="비밀번호" required/>
		</div>
				
		
		
		<div>
			<button type="submit" id="submit">가입</button>
		</div>
		<div>
			<a href="/"></a>
		</div>
	</form>
	
</body>
</html>
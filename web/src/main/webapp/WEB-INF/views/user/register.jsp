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
			  opacity: 0.8;
			}
			
			 a:link { color: black; text-decoration: none;}
		     a:visited { color: white; text-decoration: none;}
			 a:hover { color: blue; text-decoration: underline;}
			 
			 #image {
					background-image:url(https://images.unsplash.com/photo-1592436259520-52462868641c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80);
					background-repeat : no-repeat;
					background-size : cover;
				}
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
<body id="image">
	<div class="auth-form px-3">
	<article class="container">
			<div class="col-md-6 col-md-offset-3">
				<h1 align="center"><a href="/">회원가입</a></h1>
			</div>
			
	<div class="col-sm-6 col-md-offset-3">
		<form method="post">
			<div class = "form-group">
				<label for="identification">아이디</label>
				<input type="text" class="form-control" id="identification" name="identification" placeholder="아이디"  autocomplete="off" required/>
				<br />
				<button class="idChk, btn btn-primary"  type="button" class="btn btn-primary" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>
			</div>
			
			<div class = "form-group">
				<label for="name">이름</label>
				<input type="text" class="form-control" id="name" name="name" placeholder="이름" autocomplete="off" required/>
			</div>
			
			<div class = "form-group">
				<label for="password">비밀번호</label>
				<input type="password" class="form-control" id="password" name="password" placeholder="비밀번호" required/>
			</div>
					
			<div class="form-group text-center">
				<button type="submit" id="submit" class="btn btn-success btn-block">가입</button>
				<button type="button" onclick="location.href='../'" class="btn btn-primary btn-block">처음으로</button>
			</div>
		</form>	
	</div>
	</article>
</div>
</body>
</html>
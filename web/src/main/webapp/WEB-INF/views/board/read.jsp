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
	
  <script>
    var result = '${result}';
  	if(result === 'saveOK') {
  		alert("수정 되었습니다.");
  	}
  </script>
	
	
</head>
<body>
	<h1>게시판</h1>
	<hr/>
	 <a href="/board/listPage${cri.makeQuery()}"><button>목록</button></a> 
	
	<!-- <a href="/board/listPage"><button>목록</button></a> -->
	
	
	<div>
		<form action="/board/remove?board_number=${boardVO.board_number}" method="post">
			<a><button>게시글 삭제</button></a>
		</form>
	</div>
	
	
		<div>
			<label for="title">제목</label>
			<input type="text" id="title" name="title" placeholder="제목" value="${boardVO.title }" readonly="readonly"/>
		</div>
		
		<div>
			<label for="contents">내용</label>
			<textarea id="contents" name="contents" placeholder="내용" readonly="readonly">${boardVO.contents}</textarea>
		</div>
				
		
		<div>
			<a href="/board/update?board_number=${boardVO.board_number}" ><button>수정</button></a>
			<a href="/board/listPage"><button>취소</button></a>
		</div>

</body>
</html>
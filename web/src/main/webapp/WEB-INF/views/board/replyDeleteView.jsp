<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
				
				 a:link { color: black; text-decoration: none;}
				 a:visited { color: white; text-decoration: none;}
				 a:hover { color: blue; text-decoration: underline;}


		</style>
		
			<script type="text/javascript">
				$(document).ready(function(){
					var formObj = $("form[name='updateForm']");
					
					$(".cancel_btn").on("click", function(){
						location.href = "/board/readView?board_number=${replyDelete.board_number}"
							   + "&page=${cri.page}"
							   + "&perPageNum=${cri.perPageNum}"
							   + "&searchType=${cri.searchType}"
							   + "&keyword=${cri.keyword}";
					})
					
				})
			</script>
	</head>

	<body>
	
		<article class="container">
			<div class="col-md-6 col-md-offset-3">
				<h1 align="center"><a href="/">게시판</a></h1>		
				<br />
			</div>
			
			<br />
			
			<div class="col-sm-6 col-md-offset-3">
				<form name="updateForm" role="form" method="post" action="/board/replyDelete">
					<input type="hidden" name="board_number" value="${replyDelete.board_number}" readonly="readonly"/>
					<input type="hidden" id="reply_number" name="reply_number" value="${replyDelete.reply_number}" />
					<input type="hidden" id="page" name="page" value="${cri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${cri.perPageNum}"> 
					<input type="hidden" id="searchType" name="searchType" value="${cri.searchType}"> 
					<input type="hidden" id="keyword" name="keyword" value="${cri.keyword}"> 
						
					<div class = "form-group">
						<label class="delete">삭제 하시겠습니까?</label>
					</div>
					
					<div>
						<button type="submit" class="delete_btn btn btn-danger btn-block">예</button>
						<button type="button" class="cancel_btn btn btn-info btn-block">아니오</button>
					</div>
				</form>
			</div>
			
		</article>
	</body>
</html>
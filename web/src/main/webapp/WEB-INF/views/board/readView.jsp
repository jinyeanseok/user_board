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
  	

	$(function(){
		createReply();
		updateReply();
	})
	
	function createReply(){
		$(".replyWriteBtn").on("click", function(){
		  	  var formObj = $("form[name='replyForm']");
		  	  formObj.attr("action", "/board/replyRegister");
		  	  formObj.submit();
		  	});
	}
	
	function updateReply(){
		$(".replyUpdateBtn").on("click", function(){
			location.href = "/board/replyUpdateView?board_number=${boardVO.board_number}"
							+ "&page=${cri.page}"
							+ "&perPageNum=${cri.perPageNum}"
							+ "&searchType=${cri.searchType}"
							+ "&keyword=${cri.keyword}"
							+ "&reply_number="+$(this).attr("data-rno");
		});
	}
	//댓글 수정 View
	
			
//댓글 삭제 View
	$(".replyDeleteBtn").on("click", function(){
		location.href = "/board/replyDeleteView?board_number=${boardVO.board_number}"
			+ "&page=${cri.page}"
			+ "&perPageNum=${cri.perPageNum}"
			+ "&searchType=${cri.searchType}"
			+ "&keyword=${cri.keyword}"
			+ "&reply_number="+$(this).attr("data-rno");
	});
  	
  	
  </script>
	
	
</head>
<body>
	<h1>게시판</h1>
	<hr/>
	 <a href="/board/listPage${cri.makeQuery()}"><button>목록</button></a> 
	
	<!-- <a href="/board/listPage"><button>목록</button></a> -->
	
	
	<div>
		<c:if test="${user.identification == boardVO.identification }">
		<form action="/board/remove?board_number=${boardVO.board_number}" method="post">
			<a><button>게시글 삭제</button></a>
		</form>
		</c:if>
	</div>
	<!-- 
	<div>
		<form action="/board/remove?board_number=${boardVO.board_number}" method="post">
			<a><button>게시글 삭제</button></a>
		</form>
	</div>
	 -->
	
	
		<div>
			<label for="title">제목</label>
			<input type="text" id="title" name="title" placeholder="제목" value="${boardVO.title }" readonly="readonly"/>
		</div>
		
		<div>
			<label for="contents">내용</label>
			<textarea id="contents" name="contents" placeholder="내용" readonly="readonly">${boardVO.contents}</textarea>
		</div>
				
		
		<div>
			<c:if test="${user.identification == boardVO.identification }">
			<a href="/board/update?board_number=${boardVO.board_number}" ><button>수정</button></a>
			<a href="/board/listPage"><button>취소</button></a>
			</c:if>
		</div>
		<br />
		<br />
		
	<div>
			
		    <c:forEach items="${replyList}" var="replyList">
		      
		     <div>
		        <div>
		  	        	 작성자 : ${replyList.replyer}<br />
		  	      	   작성 날짜 :  <fmt:formatDate value="${replyList.create_date}" pattern="yyyy-MM-dd" />
		        </div>
		     
		        <div>${replyList.replytext}</div>	
		       </div>  
		       <br />
		      
		       <div>
				  <button type="button" class="replyUpdateBtn" data-rno="${replyList.reply_number}">수정</button>
				  <button type="button" class="replyDeleteBtn" data-rno="${replyList.reply_number}">삭제</button>
				</div>
				<br />
				<br />
				<br />
		    </c:forEach>   
		  
		  <br />
	</div>
	
	<form name="replyForm" method="post">
	  <input type="hidden" id="board_number" name="board_number" value="${boardVO.board_number}" />
	  <input type="hidden" id="page" name="page" value="${cri.page}"> 
	  <input type="hidden" id="perPageNum" name="perPageNum" value="${cri.perPageNum}"> 
	  <input type="hidden" id="searchType" name="searchType" value="${cri.searchType}"> 
	  <input type="hidden" id="keyword" name="keyword" value="${cri.keyword}"> 
	
	  <div>
	    <label for="replyer">댓글 작성자</label>
	    <input type="text" id="replyer" name="replyer" />
	    <br/>
	    <label for="replytext">댓글 내용</label>
	    <input type="text" id="replytext" name="replytext" />
	  </div>
	  <div>
	 	 <button type="button" class="replyWriteBtn">작성</button>
	  </div>
	</form>
	
	<c:if test="${msg == false}">
			<script>
				alert("로그인이 필요합니다.");
			</script>
	</c:if>
	
	
</body>
</html>
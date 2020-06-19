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
			
			 a:link { color: black; text-decoration: none;}
			 a:visited { color: black; text-decoration: none;}
			 a:hover { color: blue; text-decoration: underline;}
			 
			 .comment{font-size: 2em;}
			 h1 { padding: 40px}
			 
			 .parent { 
			 	  border: 1px;
				  display: grid; 
				  grid-template-areas:
				    "i1 i2 i3"
				    "i4 i4 i4";
				    
				}
				.item-1 {
				  grid-area: i1;
			
				}
				.item-2 {
				  grid-area: i2;
		
				}
				.item-3 {
				  grid-area: i3;
				  text-align: right;
		
				}
				.item-4 {
				  grid-area: i4;
				  
				}
				
				.item-1, .item-2, .item-3, .item-4 {
			        padding: 1rem;
			        border: 2px solid #aaa;
			    }

									 
				
			
	</style>
	
  <script>
    var result = '${result}';
  	if(result === 'saveOK') {
  		alert("수정 되었습니다.");
  	}
  	
	$(function(){
		createReply();
		updateReply();
		deleteReply();
		//fn_fileDown(file_number);
	})
	
	function createReply(){
		$(".replyWriteBtn").on("click", function(){
		  	  var formObj = $("form[name='replyForm']");
		  	  formObj.attr("action", "/board/replyRegister");
		  	  formObj.submit();
		  	});
	}
	
	//댓글 수정 View
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
	
	
	//댓글 삭제 View
	function deleteReply(){
		$(".replyDeleteBtn").on("click", function(){
			location.href = "/board/replyDeleteView?board_number=${boardVO.board_number}"
							+ "&page=${cri.page}"
							+ "&perPageNum=${cri.perPageNum}"
							+ "&searchType=${cri.searchType}"
							+ "&keyword=${cri.keyword}"
							+ "&reply_number="+$(this).attr("data-rno");
		});
	}
	
	function fn_fileDown(file_number){
		var formObj = $("form[name = 'replyForm']");
		$("#file_number").attr("value", file_number);
		formObj.attr("action", "/board/fileDown");
		formObj.submit();
	}
	

	
  	
  </script>
	
	
</head>
<body>
	<h1 align="center"><a href="/">게시판</a></h1><hr />
	
	<div class="container">
		<c:if test="${user.identification == boardVO.identification }">
		<form action="/board/remove?board_number=${boardVO.board_number}" method="post">
			<a><button class="btn btn-danger">삭제</button></a>
			<hr />
		</form>
		</c:if>
	</div>
	
	<br />

	
	<div>
		<div class="form-group">
			<div class="container">
				<label for="title">제목</label>
				<input type="text" class="form-control" id="title" name="title" placeholder="제목" value="${boardVO.title }" readonly="readonly"/>
			</div>
		</div>
		
		<div class="form-group">
			<div class="container">
				<label for="contents">내용</label>
				<textarea id="contents" class="form-control" rows="10" name="contents" placeholder="내용" readonly="readonly">${boardVO.contents}</textarea>
			</div>
		</div>
				
		<div class="form-group">
			<div class="container">
				<label for="contents">작성자</label>
				<textarea id="name" class="form-control" name="name" placeholder="작성자" readonly="readonly">${boardVO.name}</textarea>
			</div>		
		</div>

		<div class="form-group">
			<div class="container">	
					<div>
						<a href="/board/listPage${cri.makeQuery()}"><button class="btn btn-primary">목록</button></a> 
						
						<c:if test="${user.identification == boardVO.identification }">
							<a href="/board/update?board_number=${boardVO.board_number}" ><button class="btn btn-success">수정</button></a>
						</c:if>
						
						<a href="/board/listPage"><button class="btn btn-info">취소</button></a>
						<br />
					</div>				
			</div>
		</div>
		
		<br />
		
			<div class="form-group">
				<div class="container">
					<label>파일 목록</label><br />
					<c:forEach var="file" items="${file}">
						<!-- <a href=# onclick="fn_fileDown('${file.file_number}'); return false;">${file.org_file_name}</a>(${file.file_size}kb)<br> -->
						- <a href="#" onclick="fn_fileDown('${file.file_number}'); return false;">${file.org_file_name}</a>(${file.file_size}kb)<br>
					</c:forEach>
					
				</div>
			</div>
		</div>
		<br />
		<br />
		
		<div class="container">
			<label class="comment">comment</label>
		
			
			
				<form name="replyForm" method="post">
	
				  <input type="hidden" id="board_number" name="board_number" value="${boardVO.board_number}" />
				  <input type="hidden" id="page" name="page" value="${cri.page}"> 
				  <input type="hidden" id="perPageNum" name="perPageNum" value="${cri.perPageNum}"> 
				  <input type="hidden" id="searchType" name="searchType" value="${cri.searchType}"> 
				  <input type="hidden" id="keyword" name="keyword" value="${cri.keyword}"> 
				  <input type="hidden" id="file_number" name="file_number" value="">
				  
				  <div class="input-group">
				    <!-- <div class="input-group"> -->
				    <input type="hidden" id="replyer" name="replyer" value="${user.identification}" readonly="readonly"/>
				    <!-- <label for="replytext"></label> -->
				    <input type="text" id="replytext" class="form-control" name="replytext" placeholder="내용을 입력하세요" />
				    <span class="input-group-btn">
				    	<button type="button" class="replyWriteBtn btn btn-success">등록</button>
				    </span>
				  </div>
				  
				
				  
				</form>
			
			<hr />
		</div>
		 
		 
		
		 
		 
	<div>  
			
		    <c:forEach items="${replyList}" var="replyList">
		      
		        <!-- <div class="container">
		  	                 작성자 : ${replyList.replyer}<br />
		  	      	   작성 날짜 :  <fmt:formatDate value="${replyList.create_date}" pattern="yyyy-MM-dd" /> <br />
		  	      	   댓글 : ${replyList.replytext}
		        </div> -->
		    
		        <div class="container">
			        <div class="parent">   	
						  <div class="item-1">${replyList.replyer}</div> 
						  <div class="item-2"><fmt:formatDate value="${replyList.create_date}" pattern="yyyy-MM-dd" /></div> 
						  <div class="item-3">
							  <c:if test="${user.identification == replyList.replyer }"> <!-- boardVO.identification는 글작성한 사람 아이디, user.identification는 로그인한 사람 아이디 -->
							  	<button type="button" class="replyUpdateBtn btn btn-success" data-rno="${replyList.reply_number}">수정</button>
								<button type="button" class="replyDeleteBtn btn btn-danger" data-rno="${replyList.reply_number}">삭제</button>
						   	  </c:if>
						</div>	
						  <div class="item-4">${replyList.replytext}</div> 
					
					</div>
				</div>
			
						        
		        
		               
		               <br />
		       <div>
		       		<!-- <div>로그인한 이용자 : ${user.identification } </div> -->
		       		<!-- <div>댓글 작성자 : ${replyList.replyer}</div> -->
		       		
				   <!-- <c:if test="${user.identification == replyList.replyer }"> 
					 <div class="container">
						 <button type="button" class="replyUpdateBtn btn btn-success" data-rno="${replyList.reply_number}">수정</button>
						 <button type="button" class="replyDeleteBtn btn btn-danger" data-rno="${replyList.reply_number}">삭제</button>
						 <hr />
					 </div>
				   </c:if> -->
				</div>
				<br />
				<br />
				<br />
		    </c:forEach>   
		  
		  <br />
	</div>
	
<!-- 	<form name="replyForm" method="post">
	
	  <input type="hidden" id="board_number" name="board_number" value="${boardVO.board_number}" />
	  <input type="hidden" id="page" name="page" value="${cri.page}"> 
	  <input type="hidden" id="perPageNum" name="perPageNum" value="${cri.perPageNum}"> 
	  <input type="hidden" id="searchType" name="searchType" value="${cri.searchType}"> 
	  <input type="hidden" id="keyword" name="keyword" value="${cri.keyword}"> 
	  <input type="hidden" id="file_number" name="file_number" value="">
	  
	  <div class="container">
	    <label for="replyer"></label>
	    <input type="hidden" id="replyer" name="replyer" value="${user.identification}" readonly="readonly"/>
	    <br/>
	    <label for="replytext"></label>
	    <input type="text" id="replytext" name="replytext" />
	  </div>
	  
	  <div class="container">
	 	 <button type="button" class="replyWriteBtn btn btn-success">작성</button>
	  </div>
	</form> -->
	
	<c:if test="${msg == false}">
			<script>
				alert("로그인이 필요합니다.");
			</script>
	</c:if>
	
	
</body>
</html>
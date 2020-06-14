# 세션 값을 다른 컨트롤러에서 가져 올 때

```
// 로그인정보
		UserVO vo = (UserVO) session.getAttribute("user");
		logger.info("asddasd" + vo.getIdentification());
		model.addAttribute("user", vo);
```	
UserVO vo = (UserVO) session.getAttribute("user"); 
이런식으로 가져와서 사용할 수 있다.

// 게시글을 작성할 때 바로 bno를 가져오지 않는 이슈
	
	기존방식대로 글을 작성하면 controller에서 board_number 로그를 찍어보면 null
	
	구글링하보니 mybatis에 방금 입력한 값의 특정값을 리턴해주고 싶을 때 selectKey를 사용하는것을 확인
	
	db에는 board_number가 
	
	board_number int(11) NOT NULL AUTO_INCREMENT 
	
	이렇게 자동증가 하는데 자동증가하는 값을 가져오고 싶다면
	
	<selectKey resultType="Integer" keyProperty="board_number" order="AFTER"> SELECT MAX(board_number) FROM board </selectKey> 
	
	-- resultType의 Integer는 boardVO에 Integer로 설정해주었기 때문에 동일하게 맞춰줘야한다.(int 나 long으로 해버리면 에러발생)
	-- order를 AFTER로 해준 이유는 BEFORE를 해주면 입력하기전에 board_number를 가져와서 그 값을 이용해서 처리하는데
	-- AFTER를 해주면 입력하고 board_number를 넣어준다.
	-- 리턴값인 board_number는 parameterType에 넘겨준 객체 kr.co.web.domain.BoardVO로 넘어간다.
	-- 즉, 이 메소드를 호출한 클래스에서 파라미터로 넘긴 board에서 바로 board.getBoard_number();로 값을 가져올 수 있다.
	
	mysql의 auto_increment로 지정된 key가 1,2,3을 가진 상태에서 3을 삭제 한 후 insert 했을 때 4가 key값으로
	insert 되는데 before 연산을 통해 값을 가져오면 java class 의 id값이 3으로 들어가기 때문에
	before보다는 after를 사용한다.
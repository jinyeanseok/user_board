# 세션 값을 다른 컨트롤러에서 가져 올 때

```
// 로그인정보
		UserVO vo = (UserVO) session.getAttribute("user");
		logger.info("asddasd" + vo.getIdentification());
		model.addAttribute("user", vo);
```	
UserVO vo = (UserVO) session.getAttribute("user"); 
이런식으로 가져와서 사용할 수 있다.
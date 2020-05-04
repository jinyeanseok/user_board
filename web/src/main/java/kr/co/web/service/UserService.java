package kr.co.web.service;

import kr.co.web.domain.UserVO;

public interface UserService {
	
	public void register(UserVO user) throws Exception;
	
	public UserVO login(UserVO user) throws Exception;
	
	public void modify(UserVO user) throws Exception;
	
	public void delete(UserVO user) throws Exception;
	
	public UserVO idCheck(String identification) throws Exception;
	
//	public UserVO read(UserVO user) throws Exception;
}

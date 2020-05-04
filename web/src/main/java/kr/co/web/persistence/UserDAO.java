package kr.co.web.persistence;

import kr.co.web.domain.UserVO;

public interface UserDAO {
	
	public void register(UserVO user) throws Exception;
	
	public UserVO login(UserVO user) throws Exception;
	
	public void modify(UserVO user) throws Exception;
	
	public void delete(UserVO user) throws Exception;
	
	public UserVO idCheck(String identification) throws Exception;
	
//	public UserVO read(UserVO user) throws Exception;
}

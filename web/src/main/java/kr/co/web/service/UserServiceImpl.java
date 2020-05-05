package kr.co.web.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.web.domain.UserVO;
import kr.co.web.persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService{
	
	@Inject
	private UserDAO userDAO;
	
	@Override
	public void register(UserVO user) throws Exception {
		userDAO.register(user);
	}
	
	@Override
	public UserVO login(UserVO user) throws Exception {
		return userDAO.login(user);
	}
	
	@Override
	public void modify(UserVO user) throws Exception {
		userDAO.modify(user);
	}
	
	@Override
	public void delete(UserVO user) throws Exception {
		userDAO.delete(user);
	}
	
	@Override
	public UserVO idCheck(String identification) throws Exception {
		return userDAO.idCheck(identification);
	}
	
	@Override
	public int idChk(UserVO user) throws Exception {
		return userDAO.idChk(user);
	}
	
}

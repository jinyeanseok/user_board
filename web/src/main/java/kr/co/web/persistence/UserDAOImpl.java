package kr.co.web.persistence;


import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.web.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO{ 

	
	@Inject
	private SqlSession session;
	
	private static String US = "UserMapper";
	private static String CREATE = US + ".userCreate";
	private static String LOGIN = US + ".login";
	private static String UPDATE = US + ".modify";
	private static String DELETE = US + ".delete";
	

	@Override
	public void register(UserVO user) throws Exception {
		session.insert(CREATE, user);
	}
	
	@Override
	public UserVO login(UserVO user) throws Exception {
		return session.selectOne(LOGIN, user);
	}
	
	@Override
	public void modify(UserVO user) throws Exception {
		session.update(UPDATE, user);
	}
	
	@Override
	public void delete(UserVO user) throws Exception {
		session.delete(DELETE, user);
	}


}

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
//	private static String LOGIN = US + ".login";
	private static String LOGIN = US + ".loginBcrypt";
	private static String UPDATE = US + ".modify";
	private static String DELETE = US + ".delete";
	private static String IDCHEACK = US + ".idCheck";
	private static String READ = US + ".read";
	private static String IDCHK = US + ".idChk";
	

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
	
	@Override
	public UserVO idCheck(String identification) throws Exception {
		return session.selectOne(IDCHEACK, identification);
	}
	
//	@Override
//	public UserVO read(UserVO user) throws Exception {
//		return session.selectOne(READ, user);
//	}
	
	@Override
	public int idChk(UserVO user) throws Exception {
		return session.selectOne(IDCHK, user);
	}


}

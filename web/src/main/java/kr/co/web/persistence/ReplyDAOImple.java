package kr.co.web.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.web.domain.ReplyVO;

@Repository
public class ReplyDAOImple implements ReplyDAO{
	
	@Inject
	SqlSession session;
	
	private static String RS = "replyMapper"; 
	private static String READ = RS + ".readReply";
	private static String CREATE = RS + ".createReply";
	private static String UPDATE = RS + ".updateReply";
	private static String DELETE = RS + ".deleteReply";
	private static String REPLYCOUNT = RS + ".replyCount";
	
	@Override
	public List<ReplyVO> readReply(int board_number) throws Exception {
		return session.selectList(READ, board_number);
	}
	
	@Override
	public void createReply(ReplyVO vo) throws Exception {
		session.insert(CREATE, vo);
	}
	
	@Override
	public void updateReply(ReplyVO vo) throws Exception {
		session.update(UPDATE, vo);
	}
	
	@Override
	public void deleteReply(ReplyVO vo) throws Exception {
		session.delete(DELETE, vo);
	}
	
	@Override
	public void replyCount(int board_number) throws Exception {
		session.selectOne(REPLYCOUNT, board_number);
	}

}

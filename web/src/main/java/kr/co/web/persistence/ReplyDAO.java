package kr.co.web.persistence;

import java.util.List;

import kr.co.web.domain.ReplyVO;

public interface ReplyDAO {

	public List<ReplyVO> readReply(int board_number) throws Exception;
	
	public void createReply(ReplyVO vo) throws Exception;
	
	public void updateReply(ReplyVO vo) throws Exception;
	
	public void deleteReply(ReplyVO vo) throws Exception;
	
	public ReplyVO selectReply(int reply_number) throws Exception;
	
	public void replyCount(int board_number) throws Exception;
}

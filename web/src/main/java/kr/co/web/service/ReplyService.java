package kr.co.web.service;

import java.util.List;

import kr.co.web.domain.ReplyVO;

public interface ReplyService {
	
	public List<ReplyVO> readReply(int board_number) throws Exception;

	public void createReply(ReplyVO vo) throws Exception;
	
	public void updateReply(ReplyVO vo) throws Exception;
	
	public void deleteReply(ReplyVO vo) throws Exception;
	
}

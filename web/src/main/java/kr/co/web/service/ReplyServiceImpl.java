package kr.co.web.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.web.domain.ReplyVO;
import kr.co.web.persistence.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Inject
	private ReplyDAO dao;
	
	@Override
	public List<ReplyVO> readReply(int board_number) throws Exception {
		return dao.readReply(board_number);
	}
	
	@Override
	public void createReply(ReplyVO vo) throws Exception {
		dao.createReply(vo);
	}
	
	@Override
	public void updateReply(ReplyVO vo) throws Exception {
		dao.updateReply(vo);
	}
	
	@Override
	public void deleteReply(ReplyVO vo) throws Exception {
		dao.deleteReply(vo);
	}
	
	@Override
	public void replyCount(int board_number) throws Exception {
		dao.replyCount(board_number);
	}
}

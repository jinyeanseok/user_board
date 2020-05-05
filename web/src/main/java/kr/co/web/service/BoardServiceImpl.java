package kr.co.web.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.web.domain.BoardVO;
import kr.co.web.domain.Criteria;
import kr.co.web.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Inject
	private BoardDAO boardDAO;
	
	@Override
	public void register(BoardVO board) throws Exception {
		boardDAO.create(board);
	}
	
	@Override
	public BoardVO read(Integer board_number) throws Exception {
		return boardDAO.read(board_number);
	}
	
	@Override
	public void modify(BoardVO board) throws Exception {
		boardDAO.update(board);
	}
	
	@Override
	public void remove(Integer board_number) throws Exception {
		boardDAO.delete(board_number);
	}
	
	@Override
	public List<BoardVO> listAll() throws Exception {
		return boardDAO.listAll();
	}
	
	@Override
	public List<BoardVO> listPage(Criteria cri) throws Exception {
		return boardDAO.listPage(cri);
	}
	
	@Override
	public int getTotalCount(Criteria cri) throws Exception {
		return boardDAO.getTotalCount(cri);
	}
	
	@Override
	public void viewCount(int board_number) throws Exception{
		boardDAO.viewCount(board_number);
	}
	
//	@Override
//	public int replyCount(Criteria cri) throws Exception {
//		return boardDAO.replyCount(cri);
//		
//	}
	@Override
	public void replyCount(int board_number) throws Exception {
		boardDAO.replyCount(board_number);
	}
}

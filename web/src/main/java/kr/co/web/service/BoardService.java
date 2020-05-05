package kr.co.web.service;

import java.util.List;

import javax.inject.Inject;

import kr.co.web.domain.BoardVO;
import kr.co.web.domain.Criteria;
import kr.co.web.persistence.BoardDAO;

public interface BoardService {
	
	public void register(BoardVO board) throws Exception;
	
	public BoardVO read(Integer board_number) throws Exception;
	
	public void modify(BoardVO board) throws Exception;
	
	public void remove(Integer board_number) throws Exception;
	
	public List<BoardVO> listAll() throws Exception;
	
	public List<BoardVO> listPage(Criteria cri) throws Exception;
	
	public int getTotalCount(Criteria cri) throws Exception;
	
	public void viewCount(int board_number) throws Exception;
	
//	public int replyCount(Criteria cri) throws Exception;
	public void replyCount(int board_number) throws Exception;
}

package kr.co.web.persistence;

import java.util.List;

import kr.co.web.domain.BoardVO;
import kr.co.web.domain.Criteria;

public interface BoardDAO {

	public void create(BoardVO board) throws Exception;
	
	public BoardVO read(Integer board_number) throws Exception;
	
	public void update(BoardVO board) throws Exception;
	
	public void delete(Integer board_number) throws Exception;
	
	public List<BoardVO> listAll() throws Exception;
	
	public List<BoardVO> listPage(Criteria cri) throws Exception;
	
	public int getTotalCount(Criteria cri) throws Exception;
	
	public void viewCount(int board_number) throws Exception;
	
//	public int replyCount(Criteria cri) throws Exception;
	
	public void replyCount(int board_number) throws Exception;
}

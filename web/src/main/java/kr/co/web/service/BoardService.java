package kr.co.web.service;

import java.util.List;
import java.util.Map;


import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.web.domain.BoardVO;
import kr.co.web.domain.Criteria;

public interface BoardService {
	
	public void register(BoardVO board, MultipartHttpServletRequest mpRequest) throws Exception;
	
//	public void register(BoardVO board) throws Exception;
	
	public BoardVO read(Integer board_number) throws Exception;
	
	public void modify(BoardVO board) throws Exception;
	
	public void remove(Integer board_number) throws Exception;
	
	public List<BoardVO> listAll() throws Exception;
	
	public List<BoardVO> listPage(Criteria cri) throws Exception;
	
	public int getTotalCount(Criteria cri) throws Exception;
	
	public void viewCount(int board_number) throws Exception;
	
//	public int replyCount(Criteria cri) throws Exception;
	public void replyCount(int board_number) throws Exception;
	
	public List<Map<String, Object>> selectFileList(int board_number) throws Exception;
	
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
}

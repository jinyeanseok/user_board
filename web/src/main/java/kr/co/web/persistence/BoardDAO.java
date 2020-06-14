package kr.co.web.persistence;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.web.domain.BoardVO;
import kr.co.web.domain.Criteria;

public interface BoardDAO {

	public void create(BoardVO board, MultipartHttpServletRequest mpRequest) throws Exception;
//	public void create(BoardVO board) throws Exception;
	
	public BoardVO read(Integer board_number) throws Exception;
	
	public void update(BoardVO board) throws Exception;
	
	public void delete(Integer board_number) throws Exception;
	
	public List<BoardVO> listAll() throws Exception;
	
	public List<BoardVO> listPage(Criteria cri) throws Exception;
	
	public int getTotalCount(Criteria cri) throws Exception;
	
	public void viewCount(int board_number) throws Exception;
	
//	public int replyCount(Criteria cri) throws Exception;
	
	public void replyCount(int board_number) throws Exception;
	
	public void insertFile(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> selectFileList(int board_number) throws Exception;
	
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
}

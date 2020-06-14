package kr.co.web.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.web.domain.BoardVO;
import kr.co.web.domain.Criteria;
import kr.co.web.persistence.BoardDAO;
import kr.co.web.util.FileUtils;

@Service
public class BoardServiceImpl implements BoardService{
	 
	private static final Logger logger = LoggerFactory.getLogger(BoardServiceImpl.class);
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Inject
	private BoardDAO boardDAO;
	
	@Override
//	public void register(BoardVO board) throws Exception {
	public void register(BoardVO board, MultipartHttpServletRequest mpRequest) throws Exception {
		boardDAO.create(board, mpRequest);
//		boardDAO.create(board);
		
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(board, mpRequest);
		int size = list.size();
		for(int i=0; i<size; i++) {
			boardDAO.insertFile(list.get(i));
		}
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
	
	@Override
	public List<Map<String, Object>> selectFileList(int board_number) throws Exception {
		return boardDAO.selectFileList(board_number);
	}
	
	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		return boardDAO.selectFileInfo(map);
	}
}

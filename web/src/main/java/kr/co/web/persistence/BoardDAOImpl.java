package kr.co.web.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.web.domain.BoardVO;
import kr.co.web.domain.Criteria;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Inject
	private SqlSession session;
	
	private static String NS = "BoardMapper";
	private static String CREATE = NS + ".create";
	private static String READ = NS + ".read";
	private static String UPDATE = NS + ".update";
	private static String DELETE = NS + ".delete";
	private static String LISTALL = NS + ".listAll";
	private static String LISTPAGE = NS + ".listPage";
	private static String GETTOTALCOUNT = NS + ".gettotalcount";
	private static String VIEWCOUNT = NS + ".viewCount";
	private static String REPLYCOUNT = NS + ".replyCount";
	private static String INSERTFILE = NS + ".insertFile";
	private static String SELECTFILELIST = NS + ".selectFileList";
	private static String SELECTFILEINFO = NS + ".selectFileInfo";
	private static String UPDATEFILE = NS + ".updateFile";

	@Override
	public void create(BoardVO board, MultipartHttpServletRequest mpRequest) throws Exception {
		session.insert(CREATE, board);
	}
//	@Override
//	public void create(BoardVO board) throws Exception {
//		session.insert(CREATE, board);
//	}
	
	@Override
	public BoardVO read(Integer board_number) throws Exception {
		return session.selectOne(READ, board_number);
	}
	
	@Override
	public void update(BoardVO board) throws Exception {
		session.update(UPDATE, board);
	}
	
	@Override
	public void delete(Integer board_number) throws Exception {
		session.delete(DELETE, board_number);
	}
	
	@Override
	public List<BoardVO> listAll() throws Exception {
		return session.selectList(LISTALL);
	}
	
	@Override
	public List<BoardVO> listPage(Criteria cri) throws Exception {
		return session.selectList(LISTPAGE, cri);
	}
	
	@Override
	public int getTotalCount(Criteria cri) throws Exception {
		return session.selectOne(GETTOTALCOUNT, cri);
	}
	
	@Override
	public void viewCount(int board_number) throws Exception{
		session.selectOne(VIEWCOUNT, board_number);
	}
	
//	@Override
//	public int replyCount(int board_number) throws Exception {
//		 return session.selectOne(REPLYCOUNT, board_number);
//	}
	
//	@Override
//	public int replyCount(Criteria cri) throws Exception {
//		return session.selectOne(REPLYCOUNT, cri);
//	}
	
	@Override
	public void replyCount(int board_number) throws Exception {
		 session.selectOne(REPLYCOUNT, board_number);
	}
	
	@Override
	public void insertFile(Map<String, Object> map) throws Exception {
		session.insert(INSERTFILE, map);
	}
	
	@Override
	public List<Map<String, Object>> selectFileList(int board_number) throws Exception {	
		return session.selectList(SELECTFILELIST, board_number);
	}
	
	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		return session.selectOne(SELECTFILEINFO, map);
	}
	
	@Override
	public void updateFile(Map<String, Object> map) throws Exception {
		session.update(UPDATEFILE, map);
	}
}

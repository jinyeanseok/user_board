package kr.co.web.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.web.domain.BoardVO;
import kr.co.web.domain.Criteria;
import kr.co.web.domain.PageMaker;
import kr.co.web.domain.ReplyVO;
import kr.co.web.domain.UserVO;
import kr.co.web.service.BoardService;
import kr.co.web.service.ReplyService;
import kr.co.web.service.UserService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	private BoardService boardService;

	@Inject
	ReplyService replyService;
	
	@Inject
	private UserService userService;
	
//	@RequestMapping(value = "/register", method = RequestMethod.GET)
//	public void registerGET(BoardVO board, Model model) throws Exception {
//		logger.info("register GET");
//	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET(HttpSession session , Model model) throws Exception {
		logger.info("register GET");
		
		Object loginInfo = session.getAttribute("user");
		
		if(loginInfo == null) {
			model.addAttribute("msg", false);
		}
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPOST(BoardVO board, RedirectAttributes rttr) throws Exception{
		logger.info("register post.....");
		logger.info(board.toString());
		//실질적인 insert문 실행
		boardService.register(board);
		//model에 registerOK라는 값을 가지고 있는 result 속성을 추가
		rttr.addFlashAttribute("result", "registerOK");

		
        //WEB-INF/views/board/sucess.jsp 호출
//		return "/board/success";
		return "redirect:/board/listPage";
	}	
	
	@RequestMapping(value = "/listAll", method = RequestMethod.GET)
	public void listAll(Model model) throws Exception{
		logger.info("show all list");
		List<BoardVO> boards = boardService.listAll();
		model.addAttribute("list", boards);
	}
	
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(@RequestParam("board_number") Integer board_number, @ModelAttribute("cri") Criteria cri , Model model) throws Exception{
		logger.info("read GET");
		BoardVO board = boardService.read(board_number);
		boardService.viewCount(board_number);
		model.addAttribute(board);

	}
	
//	@RequestMapping(value = "/readView", method = RequestMethod.GET)
//	public String readReply(@RequestParam("board_number") Integer board_number, @ModelAttribute("cri") Criteria cri , Model model) throws Exception{
//		logger.info("read GET");
//		BoardVO board = boardService.read(board_number);
//		logger.info("boardddd  " + board);
//		boardService.viewCount(board_number);
//		model.addAttribute(board);
//		
////		List<ReplyVO> replyList = replyService.readReply(board.getBoard_number());
//		logger.info("boardnumber = " + board_number);
//		List<ReplyVO> replyList = replyService.readReply(board_number);
//		logger.info("replyLisasdasdsadt" + replyList);
//		model.addAttribute("replyList", replyList);
//		
//		return "/board/readView";
//
//	}
	
	@RequestMapping(value = "/readView", method = RequestMethod.GET)
	public String readReply(UserVO user, HttpSession session, @RequestParam("board_number") Integer board_number, @ModelAttribute("cri") Criteria cri , Model model) throws Exception{
		logger.info("read GET");
		BoardVO board = boardService.read(board_number);
		logger.info("boardddd  " + board);
		boardService.viewCount(board_number);
		model.addAttribute(board);
		
		
		boardService.replyCount(board_number);
		// 댓글 수 업데이트
		
		
//		List<ReplyVO> replyList = replyService.readReply(board.getBoard_number());
		logger.info("boardnumber = " + board_number);
		List<ReplyVO> replyList = replyService.readReply(board_number);
		logger.info("replyLisasdasdsadt" + replyList);
		model.addAttribute("replyList", replyList);
		
		Object loginInfo = session.getAttribute("user");
		
//		UserVO login = (UserVO)userService.login(user);
		
		logger.info("loginInfo = " + loginInfo);
		
		// 로그인정보
		UserVO vo = (UserVO) session.getAttribute("user");
		logger.info("asddasd" + vo.getIdentification());
		model.addAttribute("user", vo);
		
		if(loginInfo == null) {
			model.addAttribute("msg", false);
		}else if(loginInfo != null) {
			model.addAttribute("msg", true);
		}
		
		return "/board/readView";

	}
	
	@RequestMapping(value = "/remove", method= RequestMethod.POST)
	public String removePOST(@RequestParam("board_number") Integer board_number, RedirectAttributes rttr) throws Exception {
		logger.info("removePOST");
		boardService.remove(board_number);
		rttr.addFlashAttribute("result", "removeOK");
		return "redirect:/board/listPage";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public void updateGET(@RequestParam("board_number") Integer board_number, Model model) throws Exception {
		logger.info("updateGET");
		BoardVO boardVO = boardService.read(board_number);
		model.addAttribute(boardVO);
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updatePOST(BoardVO board, RedirectAttributes rttr) throws Exception {
		logger.info("updatePOST");
		boardService.modify(board);
		rttr.addFlashAttribute("result", "saveOK");
		return "redirect:/board/read?board_number=" + board.getBoard_number();
	}
	

	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public void listPage(Criteria cri, Model model, HttpSession session) throws Exception{ // replyVO 추가
		logger.info("listPage");
        //현재 페이지에 해당하는 게시물을 조회해 옴 

//		replyService.replyCount(board_number);
//		boardService.replyCount(board_number);
	
		List<BoardVO> boards = boardService.listPage(cri);
        //모델에 추가
		model.addAttribute("list",boards);
        //PageMaker 객체 생성
		PageMaker pageMaker = new PageMaker(cri);
        //전체 게시물 수를 구함
		int totalCount = boardService.getTotalCount(cri);
        //pageMaker로 전달 -> pageMaker는 startPage, endPage, prev, next를 계산함
		pageMaker.setTotalCount(totalCount);
        //모델에 추가
		model.addAttribute("pageMaker", pageMaker);
		
		Object loginInfo = session.getAttribute("user");
		
		
		if(loginInfo == null) {
			model.addAttribute("msg", false);
		}
		
		
	
//		int replyCount = boardService.replyCount(board_number);
		
//		logger.info("replycount 111" + replyCount);
	}
	
	@RequestMapping(value="/replyRegister", method = RequestMethod.POST)
	public String replyWrite(ReplyVO vo, Criteria cri, RedirectAttributes rttr) throws Exception {
		logger.info("reply Write");
		
		replyService.createReply(vo);
		
		rttr.addAttribute("board_number", vo.getBoard_number());
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		
		return "redirect:/board/readView";
	}
	
	@RequestMapping(value="/replyUpdateView", method = RequestMethod.GET)
	public String replyUpdateView(ReplyVO vo, Criteria cri, Model model) throws Exception {
		logger.info("reply Write");
		
		model.addAttribute("replyUpdate", replyService.selectReply(vo.getReply_number()));
		
		
//		ReplyVO test = replyService.selectReply(vo.getReply_number());
//		logger.info("test = " + test);
		
		model.addAttribute("cri", cri);
		
		return "board/replyUpdateView";
	}
	
	
	//댓글 수정 POST
		@RequestMapping(value="/replyUpdate", method = RequestMethod.POST)
		public String replyUpdate(ReplyVO vo, Criteria cri, RedirectAttributes rttr) throws Exception {
			logger.info("reply Write");
			
			replyService.updateReply(vo);
			
			rttr.addAttribute("board_number", vo.getBoard_number());
			rttr.addAttribute("page", cri.getPage());
			rttr.addAttribute("perPageNum", cri.getPerPageNum());
			rttr.addAttribute("searchType", cri.getSearchType());
			rttr.addAttribute("keyword", cri.getKeyword());
			
			return "redirect:/board/readView";
		}

	
		//댓글 삭제 GET
		@RequestMapping(value="/replyDeleteView", method = RequestMethod.GET)
		public String replyDeleteView(ReplyVO vo, Criteria cri, Model model) throws Exception {
			logger.info("reply delete");
			
			model.addAttribute("replyDelete", replyService.selectReply(vo.getReply_number()));
			model.addAttribute("cri", cri);
			
//			replyService.selectReply(vo.getBoard_number())

			return "/board/replyDeleteView";
		}
		
		//댓글 삭제
		@RequestMapping(value="/replyDelete", method = RequestMethod.POST)
		public String replyDelete(ReplyVO vo, Criteria cri, RedirectAttributes rttr) throws Exception {
			logger.info("reply delete");
			
			replyService.deleteReply(vo);
			
			rttr.addAttribute("board_number", vo.getBoard_number());
			rttr.addAttribute("page", cri.getPage());
			rttr.addAttribute("perPageNum", cri.getPerPageNum());
			rttr.addAttribute("searchType", cri.getSearchType());
			rttr.addAttribute("keyword", cri.getKeyword());
			
			return "redirect:/board/readView";
		}
	
	
	
	
}

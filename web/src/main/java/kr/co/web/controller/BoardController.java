package kr.co.web.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.web.domain.BoardVO;
import kr.co.web.domain.Criteria;
import kr.co.web.domain.PageMaker;
import kr.co.web.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	private BoardService boardService;

	
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
	public void listPage(Criteria cri, Model model, HttpSession session) throws Exception{
		logger.info("listPage");
        //현재 페이지에 해당하는 게시물을 조회해 옴 
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
		
	}
	
	
}

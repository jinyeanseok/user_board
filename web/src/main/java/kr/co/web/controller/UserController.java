package kr.co.web.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.web.domain.UserVO;
import kr.co.web.service.UserService;



@Controller
@RequestMapping("/user/*")
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	private UserService userService;

	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void getRegister() throws Exception {
		logger.info("get register");
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String postRegister(UserVO user, RedirectAttributes rttr) throws Exception {
		logger.info("post register");
		
		userService.register(user);
		
		rttr.addFlashAttribute("msg", "registerOK");
		return "redirect:/";
		
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(UserVO user, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
	 logger.info("post login");
	 
	 HttpSession session = req.getSession();
	 
	 UserVO login = userService.login(user);
	 
	 if(login == null) {
	  session.setAttribute("user", null);
	  rttr.addFlashAttribute("msg", "loginFalse");
	  String oldPass = user.getPassword();
	  logger.info("로그인할 때 입력한 비밀번호" + oldPass);
	  
	 } else {
	  session.setAttribute("user", login);
	  rttr.addFlashAttribute("msg", "loginTrue");
	  String oldPass = login.getPassword();
	  logger.info("로그인할 때 입력한 비밀번호" + oldPass);
	  logger.info(login + "로그 입력");
	 }
	   
	 return "redirect:/";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session, RedirectAttributes rttr) throws Exception {
	 logger.info("get logout");
	 
	 session.invalidate();
	 
	 rttr.addFlashAttribute("msg", "logOutOK");
	 
	 return "redirect:/";
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void getModify() throws Exception {
		logger.info("get modify");
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String postModify(HttpSession session, UserVO user, RedirectAttributes rttr) throws Exception {
	 logger.info("post modify");
	 
	 userService.modify(user);
	 
	 session.invalidate();
	 
	 rttr.addFlashAttribute("result", "modifyOK");
	 
	 return "redirect:/";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public void getDelete() throws Exception {
		logger.info("get delete");
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String postWithdrawal(HttpSession session, UserVO user, RedirectAttributes rttr) throws Exception {
	 logger.info("post delete");
	  
	 UserVO vo = (UserVO) session.getAttribute("user");
	 
	 String oldPass = vo.getPassword();
	 logger.info("로그인할 때 입력한 비밀번호" + oldPass);
	 
	 String newPass = user.getPassword();
	 logger.info("회원탈퇴 폼에 입력한 비밀번호" + newPass);
	 
	 if(!(oldPass.equals(newPass))) {
	  rttr.addFlashAttribute("msg", false);
	  return "redirect:/user/delete";
	 }
	 
	 userService.delete(user);
	 
	 session.invalidate();
	 
	 rttr.addFlashAttribute("msg", "deleteOK");
	 
	 return "redirect:/";
	}
	

	
	
}

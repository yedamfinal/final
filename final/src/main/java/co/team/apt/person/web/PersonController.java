package co.team.apt.person.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import co.team.apt.common.vo.ListResidentDto;
import co.team.apt.common.vo.ManagerVo;
import co.team.apt.common.vo.ResidentVo;
import co.team.apt.person.service.PersonService;

@Controller
public class PersonController {

	@Autowired
	PersonService personService;

	// 로그인
	@RequestMapping("login.do")
	public String login(Model model, HttpServletRequest request, ResidentVo vo) {
		ResidentVo person = personService.login(vo);
		HttpSession session = request.getSession(false);
		String path = request.getHeader("Referer");
		// 체크로직
		if (person != null) {
			session.setAttribute("person", person);
		}
		// return "sign/loginResult";
		return "redirect:"+path;
	}
	
	// 로그인 아작스
	@RequestMapping("ajaxlogin.do")
	@ResponseBody
	public String ajaxlogin(Model model, HttpServletRequest request, ResidentVo vo) {
		ResidentVo person = personService.login(vo);
		HttpSession session = request.getSession(false);
		// 체크로직
		if (person != null) {
			session.setAttribute("person", person);
			return "success";
		}else {
			return "fail";
		}
		// return "sign/loginResult";
	}

	// 로그인폼이동
	@RequestMapping("loginForm.do")
	public String loginForm(Model model) {

		return "sign/loginForm";

	}

	// 로그아웃
	@RequestMapping("logout.do")
	public String logout(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		// session.removeAttribute("person"); //세션에서 person정보만 삭제
		session.invalidate();
		// return "sign/loginForm";
		return "redirect:/home";
	}

	private static final Logger logger = LoggerFactory.getLogger(PersonController.class);

	@Autowired
	PersonService service;

	// 회원가입 get 1
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String getRegister() throws Exception {

		return "sign/register";
	}

	// 입주민가입페이지 get 2
	@RequestMapping(value = "/resiRegister", method = RequestMethod.GET)
	public String getResiRegister() throws Exception {
		return "sign/resiRegister";
	}

	// 입주민 처리페이지 post 4
	@RequestMapping(value = "/resiRegister", method = RequestMethod.POST)
	public String postRegister(ListResidentDto vo) throws Exception {

		service.multiregister(vo);
		return "redirect:/home";

	}

	// 관리자가입페이지 get 3
	@RequestMapping(value = "/maneRegister", method = RequestMethod.GET)
	public String getManeRegister() throws Exception {
		return "sign/maneRegister";
	}

	// 관리자처리페이지 post 5
	@RequestMapping(value = "/maneRegister", method = RequestMethod.POST)
	public String postManeRegister(ManagerVo vo) throws Exception {
		System.out.println(vo);
		service.maneregister(vo);	

		return "redirect:/home";
	}
	
	
}

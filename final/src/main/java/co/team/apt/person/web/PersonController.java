package co.team.apt.person.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.team.apt.person.service.PersonService;
import co.team.apt.person.vo.Person;
import co.team.apt.person.vo.ResidentVo;

@Controller
public class PersonController {
	
	@Autowired
	PersonService personService;
	
	//로그인
	@RequestMapping("login.do")
	public String login(Model model, HttpServletRequest request, ResidentVo vo) {
		Person person = personService.login(vo);
		HttpSession session = request.getSession(false);
		session.setAttribute("person", person);
		//return "sign/loginResult";
		return "redirect:/";
	}
	
	//로그인폼이동
	@RequestMapping("loginForm.do")
	public String loginForm(Model model) {
		
		return "sign/loginForm";
		
	}
	
	//로그아웃
	@RequestMapping("logout.do")
	public String logout(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		//session.removeAttribute("person"); //세션에서 person정보만 삭제
		session.invalidate();
		//return "sign/loginForm";
		return "redirect:/";
	}
}

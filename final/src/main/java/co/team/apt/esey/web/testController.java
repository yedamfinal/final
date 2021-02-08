package co.team.apt.esey.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


	@Controller
	public class testController {
		
		@RequestMapping("/test.do")
		public String test(Model model) {
			return "esey/test";
		}	
	
	
}

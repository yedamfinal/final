package co.team.apt.esey.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CctvController {
	
	@RequestMapping("/cctv.do")
	public String cctv(Model model) {
		return "esey/cctv";
	}
	

}

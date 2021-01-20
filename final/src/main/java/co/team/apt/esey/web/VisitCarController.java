package co.team.apt.esey.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import co.team.apt.esey.service.VisitCarService;
import co.team.apt.esey.vo.VisitCarVo;

@Controller
public class VisitCarController {
	
	@Autowired
	VisitCarService visitCarService;
	
	@RequestMapping("visitCarInsert")
	public String visitCarInsert(VisitCarVo vo) {
		return "esey/visitCarInsert";
	}
	

}

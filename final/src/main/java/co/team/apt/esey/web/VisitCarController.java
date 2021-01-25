package co.team.apt.esey.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.team.apt.common.vo.VisitCarVo;
import co.team.apt.esey.mapper.VisitCarMapper;
import co.team.apt.esey.service.VisitCarService;

@Controller
public class VisitCarController {
	@Autowired
	VisitCarMapper dao;
	
	@Autowired
	VisitCarService visitCarService;
	
	//방문자 차량 조회
	@RequestMapping("visitList.do")
	public String visitList(Model model, VisitCarVo vo) {
		List<VisitCarVo> list = visitCarService.visitList(vo);
		model.addAttribute("visitList", list);
		return "esey/visitCarList";
	}
	//등록 폼 
	@RequestMapping("visitInsert.do")
	public String visitCarInsert(Model model){
		return "esey/visitCarInsert";
	}
		
	
	@RequestMapping("visitCar.do")
	public String insert(Model model, VisitCarVo vo) {
		
		int i = visitCarService.visitCarInsert(vo);
	
		if(i != 0) {
			return "redirect:visitList.do";
		}else {
			return null;
		}
	}
	

}

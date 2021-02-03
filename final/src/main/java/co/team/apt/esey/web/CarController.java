package co.team.apt.esey.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.team.apt.common.vo.CarVo;
import co.team.apt.esey.service.CarService;

@Controller
public class CarController {

	
	@Autowired
	CarService carService;
	
	//방문자 차량 조회
	@RequestMapping("carList.do")
	public String visitList(Model model, CarVo vo) {
		List<CarVo> list = carService.carList(vo);
		model.addAttribute("carList", list);
		return "esey/carList";
	}
	@RequestMapping("/carInsertFrom.do")
	public String carInsert(Model model) {
		return "esey/carInsertForm";
		
	}
	
	@RequestMapping("/carInsert.do")
	public String carInsert(Model model, CarVo vo) {
		carService.carInsert(vo);
		return "redirect:carList.do";
		
	}
	

}

package co.team.apt.facility.web;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.team.apt.common.vo.FacilityVo;
import co.team.apt.common.vo.ResidentVo;
import co.team.apt.facility.service.FacilityService;

@Controller
public class FacilityController {
	@Autowired
	FacilityService facilityService;
	
	//도서관 등록 폼 이동
	@RequestMapping("libraryInForm.do")
	public String libraryInForm(ResidentVo id, Model model){
		FacilityVo vo = facilityService.getLibrary(id);
		
		if(vo == null) {
			boolean[] seatList = new boolean[36];
			
			List<FacilityVo> list = facilityService.getSeat();
			for (FacilityVo facilityVo : list) {
				seatList[facilityVo.getSeat()-1] = true;
			}
			
			model.addAttribute("seatList", seatList);
			return "facility/libraryInForm";
		}else {
			model.addAttribute("vo", vo);
			return "facility/libraryUser";
		}
	}
	
	//헬스장 등록 폼 이동
		@RequestMapping("fitnessInForm.do")
		public String fitnessInForm(ResidentVo id,Model model){
			FacilityVo vo = facilityService.getFitness(id);
			if(vo == null) {
				return "facility/fitnessInForm";
			}else {
				model.addAttribute("vo", vo);
				return "facility/fitnessUser";
			}
		}
	
	//결제시 독서실 등록
	@RequestMapping("insertLibrary.do")
	public String insertLibrary(FacilityVo vo, Model model) {
		facilityService.insertLibrary(vo);
		//에러처리
		return "redirect:libraryInForm.do?id="+vo.getId();
	}
	
	//결제시 헬스장 등록
	@RequestMapping("insertFitness.do")
	public String insertFitness(FacilityVo vo, Model model) {
		int n =facilityService.insertFitness(vo);
		//에러처리
		return "redirect:fitnessInForm.do?id="+vo.getId();
	}
}

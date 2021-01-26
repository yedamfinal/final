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
		id.setType("library");
		FacilityVo vo = facilityService.getFacility(id);
		
		if(vo == null) {
			boolean[] seatList = new boolean[36];
			
			List<FacilityVo> list = facilityService.allList();
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
			id.setType("fitness");
			FacilityVo vo = facilityService.getFacility(id);
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
		facilityService.insertFacility(vo);
		//에러처리
		return "redirect:libraryInForm.do?id="+vo.getId();
	}
	
	//결제시 헬스장 등록
	@RequestMapping("insertFitness.do")
	public String insertFitness(FacilityVo vo, Model model) {
		int n =facilityService.insertFacility(vo);
		//에러처리
		return "redirect:fitnessInForm.do?id="+vo.getId();
	}
	
	//환불요청
	@RequestMapping("cancelRequest.do")
	public String cancelRequest(FacilityVo vo) {
		int n = facilityService.cancelRequest(vo);
		//에러처리
		return "redirect:home";
	}
	
	//관리인항목
	//도서관관리인페이지 이동
	@RequestMapping("libraryManager.do")
	public String manageFacility(Model model) {
		List<FacilityVo> list = facilityService.manageLibrary();
		
		model.addAttribute("list", list);
		
		return "facility/libraryManage";
	}
	
	@RequestMapping("cancelManage")
	public String cancelManage(FacilityVo vo) throws Exception {
		
		//facilityService.cancel(vo);
		facilityService.deleteLibrary(vo);
		
		return "redirect:libraryManager.do";
	}
}

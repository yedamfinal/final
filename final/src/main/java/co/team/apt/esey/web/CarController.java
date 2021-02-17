package co.team.apt.esey.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.JsonProcessingException;

import co.team.apt.common.vo.BoardVoteVo;
import co.team.apt.common.vo.CarVo;
import co.team.apt.common.vo.Paging;
import co.team.apt.common.vo.PostBoxVo;
import co.team.apt.common.vo.ResidentVo;
import co.team.apt.esey.mapper.CarMapper;
import co.team.apt.esey.service.CarService;

@Controller
public class CarController {

	
	@Autowired
	CarService carService;
	@Autowired
	CarMapper dao;
	
	
	//방문자 차량 조회
	@RequestMapping("carList.do")
	public String visitList(Model model, CarVo vo ,HttpSession session) {
		ResidentVo resiVo = (ResidentVo) session.getAttribute("person");
		if(resiVo == null){
			return "home/needLogin";
		}else if (resiVo.getType().equals("m")) {
			return "redirect:mCarList.do";
		}else {
			vo.setId(resiVo.getId());
			List<CarVo> list = carService.carList(vo);
			model.addAttribute("carList", list);
			model.addAttribute("vo", vo);
			return "esey/carList";
		}
	}
	@RequestMapping("carInsertFrom.do")
	public String carInsertFrom(Model model, CarVo vo) {
		
		int n = carService.cerror(vo);
		if(n >= 2) {
			return "redirect:carList.do?error=no";
		}else {
		return "esey/carInsertForm";
		}
	}
	
	@RequestMapping("carInsert.do")
	public String carInsert(Model model, CarVo vo) {
		carService.carInsert(vo);
		return "redirect:carList.do";
		
	}
	@RequestMapping("carRead.do")
	public String carRead(Model model, CarVo vo) {
		vo = carService.selectOne(vo);
	    model.addAttribute("vo", vo);
	    return "esey/carRead";
	}
	@RequestMapping("carDelete.do")
	public String mPostBoxDelete( Model model, CarVo vo) {
		int n= carService.carDelete(vo);
		return "redirect:carList.do";
	}
		
	@RequestMapping("carUpdateForm.do")
	public String carUpdateForm(Model model, CarVo vo) {
		vo = carService.selectOne(vo);
		model.addAttribute("vo",vo);
		
		return "esey/carUpdateForm";
	}
	@RequestMapping("carUpdate.do")
	public String carUpdate(Model model, CarVo vo) {
		int n = carService.carUpdate(vo);
		return "redirect:carList.do";
	}

	//관리자 차량조회
	@RequestMapping("mCarList.do")
	public String mCarList(Model model, Paging paging , CarVo vo) {
		
		//페이징처리
		paging.setPageUnit(10);
		paging.setPageSize(10);	//페이지넘버 자체를 지정
		// 페이지번호 파라미터
		if( paging.getPage() == null) {
			paging.setPage(1); 
		}		
		// 시작/마지막 레코드 번호
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());		
		// 전체 건수
		
//		vo.setDong("0");
//		vo.setHo("0");
//		if(vo.getSearchType() != null && vo.getSearchType().equals("dong")) {
//			String[] a = vo.getSearch().split("/");
//			vo.setDong(a[0]);
//			vo.setHo(a[1]);
//		}
		paging.setTotalRecord(dao.pagingCount(vo));		//전체레코드건수

		model.addAttribute("paging", paging);
		
		List<CarVo> list = carService.mCarList(vo);
		model.addAttribute("mCarList",list);
			return "esey/mCarList"; 
				
	}
	// 택배 상태변경 
				@RequestMapping("cmget.do")
				public String mget(Model model, CarVo vo) {
					if(vo.getCget().equals("cming")) {
						carService.cming(vo);
					} else if(vo.getCget().equals("cref")) {
						carService.cref(vo);
					}	else if(vo.getCget().equals("ccpl")) {
						carService.ccpl(vo);
					}
					return "redirect:mCarList.do";
				}
		
	
	//거부 상태일때 
	@RequestMapping("mCancel.do")
	public String cancelModal(Model model, CarVo vo) {
		int n = carService.cancel(vo);
		return "redirect:carList.do";
	}
	
}

package co.team.apt.esey.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.team.apt.common.vo.CarVo;
import co.team.apt.common.vo.Paging;
import co.team.apt.common.vo.PostBoxVo;
import co.team.apt.common.vo.ResidentVo;
import co.team.apt.common.vo.VisitCarVo;
import co.team.apt.esey.mapper.VisitCarMapper;
import co.team.apt.esey.service.VisitCarService;

@Controller
public class VisitCarController {
	
	@Autowired
	VisitCarService visitCarService;
	@Autowired
	VisitCarMapper dao;
	
	//방문자 차량 조회
	@RequestMapping("/visitList.do")
	public String visitList(Model model, VisitCarVo vo ,HttpSession session) {
		ResidentVo resiVo = (ResidentVo) session.getAttribute("person");
		if(resiVo == null){
			return "home/needLogin";
		}else if (resiVo.getType().equals("m")) {
			return null;
		}else {
		vo.setId(resiVo.getId());
		List<VisitCarVo> list = visitCarService.visitList(vo);
		model.addAttribute("visitList", list);
		return "esey/visitCarList";
		}
	}
	//등록 폼 
	@RequestMapping("visitInsert.do")
	public String visitCarInsert(Model model){
		return "esey/visitCarInsert";
	}
		
	
	@RequestMapping("visitCarInsert.do")
	public String visitCarInsert(Model model, VisitCarVo vo) {
		visitCarService.visitCarInsert(vo);
			return "redirect:visitList.do";
	}
	
	@RequestMapping("visitCarRead.do")
	public String visitCarRead(Model model, VisitCarVo vo) {
		vo = visitCarService.selectOne(vo);
	    model.addAttribute("vo", vo);
	    return "esey/visitCarRead";
	}
	@RequestMapping("visitCarDelect.do")
	public String visitCarDelect(Model model, VisitCarVo vo) {
		int n = visitCarService.visitCarDelect(vo);
		return "redirect:visitList.do";
	}
	@RequestMapping("visitCarupdateForm.do") 
		public String visitCarupdateForm(Model model, VisitCarVo vo) {
		vo = visitCarService.selectOne(vo);
		model.addAttribute("vo", vo);
		return "esey/visitCarUpdate";
	}
	@RequestMapping("visitCarUpdate.do")
	public String visitCarUpdate(Model model, VisitCarVo vo) {
		int n = visitCarService.visitCarUpdate(vo);
		return "redirect:visitList.do";
				
	}
	//관리자 차량조회
	@RequestMapping("mVisitList.do")
	public String mVisitList(Model model,Paging paging , VisitCarVo vo) {
		
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
		List<VisitCarVo> list = visitCarService.mVisitList(vo);
		model.addAttribute("mVisitList",list);
			return "esey/mVisitCarList"; 
		
	}
	//  상태변경 
			@RequestMapping("mvcget.do")
			public String mget(Model model, VisitCarVo vo) {
				if(vo.getVcget().equals("ming")) {
					visitCarService.ming(vo);
				} else if(vo.getVcget().equals("ref")) {
					visitCarService.ref(vo);
				}	else if(vo.getVcget().equals("cpl")) {
					visitCarService.cpl(vo);
				}
				return "redirect:mVisitList.do";
			}
	
	//거부 상태
			@RequestMapping("mccancel.do")
			public String vcancelModal(Model model, VisitCarVo vo) {
				int n = visitCarService.cancel(vo);
				return "redirect:visitList.do";
			}

	
}

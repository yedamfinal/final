package co.team.apt.esey.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.team.apt.common.vo.Paging;
import co.team.apt.common.vo.PostBoxVo;
import co.team.apt.common.vo.ResidentVo;
import co.team.apt.esey.mapper.PostBoxMapper;
import co.team.apt.esey.service.PostBoxService;

@Controller
public class PostBoxController {

	@Autowired
	PostBoxService postBoxService;
	
	@Autowired
	PostBoxMapper dao;
	
	//리스트 조회
	@RequestMapping("postBoxList.do")
	public String postBoxList(Model model, PostBoxVo vo ,Paging paging ,HttpSession session) {
		ResidentVo resiVo = (ResidentVo) session.getAttribute("person");
		if(resiVo == null){
			return "home/needLogin";
		}else if (resiVo.getType().equals("m")) {
		vo.setHo(resiVo.getHo());
			return "redirect:mPostBox.do";
		}else {
			//페이징처리
			paging.setPageUnit(10);
			paging.setPageSize(10);	//페이지넘버 자체를 지정
			// 페이지번호 파라미터
			if( paging.getPage() == null) {
				paging.setPage(1); 	
			}		
			}		
			// 시작/마지막 레코드 번호
			vo.setStart(paging.getFirst());
			vo.setEnd(paging.getLast());		
			// 전체 건수
			vo.setDong(resiVo.getDong());
			vo.setHo(resiVo.getHo());
			paging.setTotalRecord(dao.rpagingCount(vo));		//전체레코드건수	
		
		List<PostBoxVo> list = postBoxService.postBoxList(vo);
		model.addAttribute("postBoxList",list);
		return "esey/postBox";
		}
	
	@RequestMapping("postBoxRead.do")
	public String postBoxRead(Model model, PostBoxVo vo,HttpSession session) {
		ResidentVo resiVo = (ResidentVo) session.getAttribute("person");
		vo = postBoxService.selectOne(vo);
		model.addAttribute("vo", vo);
		if(resiVo == null){
			return "home/needLogin";
		}else if (resiVo.getType().equals("m")) {
			return "esey/mPostBoxRead";
		}else {	
		return "esey/PostBoxRead";
		}
	}
	
	//관리자 택배조회
		@RequestMapping("mPostBox.do")
		public String mPostBox(Model model, Paging paging , PostBoxVo vo) {
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
			
//			vo.setDong("0");
//			vo.setHo("0");
//			if(vo.getSearchType() != null && vo.getSearchType().equals("dong")) {
//				String[] a = vo.getSearch().split("/");
//				vo.setDong(a[0]);
//				vo.setHo(a[1]);
//			}
			paging.setTotalRecord(dao.pagingCount(vo));		//전체레코드건수

			model.addAttribute("paging", paging);
			
			List<PostBoxVo> list = postBoxService.mPostBox(vo);
			model.addAttribute("mPostBox", list);
			return "esey/mPostBox";
		}
	
	
	//관리자 등록폼으로 이동
		@RequestMapping("mPostBoxInsForm.do")
		public String mPostBoxInsForm(Model model) {
			return "esey/mPostBoxInsForm";
			
		}
		//관리자등록
		@RequestMapping("mPostBoxInsert.do")
		public String mPostBoxInsert(Model model, PostBoxVo vo) {
			postBoxService.mPostBoxInsert(vo);
			return "redirect:mPostBox.do";
		}
		//수정폼으로 이동 
		@RequestMapping("mPostBoxUpdateForm.do")
		public String mPostBoxUpdateForm(Model model, PostBoxVo vo) {
			System.out.println(vo.getPostNo());
			vo = postBoxService.selectOne(vo);
			model.addAttribute("vo", vo);
			return "esey/mPostBoxUdpForm";
		}
		@RequestMapping("mPostBoxUpdate.do")
		public String mPostBoxUpdate(Model model, PostBoxVo vo) {
			System.out.println("ddd");
			int n = postBoxService.mPostBoxUpdate(vo);
			return "redirect:mPostBox.do";
		}
		@RequestMapping("mPostBoxDelete.do")
		public String mPostBoxDelete( Model model, PostBoxVo vo) {
			int n= postBoxService.mPostBoxDelete(vo);
			return "redirect:mPostBox.do";
		}
		// 택배 상태변경 
		@RequestMapping("mget.do")
		@ResponseBody
		public PostBoxVo mget(Model model, PostBoxVo vo) {
			if(vo.getGet().equals("after")) {
				postBoxService.mafter(vo);
			} else if(vo.getGet().equals("before")) {
				postBoxService.mbefore(vo);
			}
			return postBoxService.selectOne(vo);
		}
		
}

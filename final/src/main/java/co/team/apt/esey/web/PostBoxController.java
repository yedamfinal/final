package co.team.apt.esey.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.team.apt.common.vo.BoardVoteVo;
import co.team.apt.common.vo.PostBoxVo;
import co.team.apt.common.vo.ResidentVo;
import co.team.apt.esey.service.PostBoxService;

@Controller
public class PostBoxController {

	@Autowired
	PostBoxService postBoxService;
	
	//리스트 조회
	@RequestMapping("postBoxList.do")
	public String postBoxList(Model model, PostBoxVo vo ,HttpSession session) {
		ResidentVo resiVo = (ResidentVo) session.getAttribute("person");
		if(resiVo == null){
			return "home/needLogin";
		}else if (resiVo.getType().equals("m")) {
			return "redirect:mPostBox.do";
		}else {
		vo.setDong(resiVo.getDong());
		vo.setHo(resiVo.getHo());
		List<PostBoxVo> list = postBoxService.postBoxList(vo);
		model.addAttribute("postBoxList",list);
		return "esey/postBox";
		}
	}
	@RequestMapping("postBoxRead.do")
	public String postBoxRead(Model model, PostBoxVo vo, HttpSession session) {
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
		public String mPostBox(Model model, PostBoxVo vo) {
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
		public String mPostBoxUpdateForm(Model model) {
			return "esey/mPostBoxUdpForm";
		}
		@RequestMapping("mPostBoxUpdate.do")
		public String mPostBoxUpdate(PostBoxVo vo) {
			postBoxService.mPostBoxUpdate(vo);
			return "redirect:mPostBox.do";
		}
		@RequestMapping("mPostBoxDelete.do")
		public String mPostBoxDelete(PostBoxVo vo) {
			int n= postBoxService.mPostBoxDelete(vo);
			return "redirect:mPostBox.do";
		}
		
}

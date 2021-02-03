package co.team.apt.esey.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.team.apt.common.vo.PostBoxVo;
import co.team.apt.esey.service.PostBoxService;

@Controller
public class PostBoxController {

	@Autowired
	PostBoxService postBoxService;

	@RequestMapping("mPostBoxInsForm.do")
	public String mPostBoxInsForm(Model model) {
		return "esey/mPostBoxInsForm";
		
	}
	
	@RequestMapping("mPostBoxInsert.do")
	public String mPostBoxInsert(Model model, PostBoxVo vo) {
		int n = postBoxService.mPostBoxInsert(vo);
		return "redirect/postBoxList.do";
	}
	
	@RequestMapping("postBoxList.do")
	public String postBoxList(Model model, PostBoxVo vo) {
		List<PostBoxVo> list = postBoxService.postBoxList(vo);
		model.addAttribute("postBoxList",list);
		return "esey/postBox";
	}
	
	
}

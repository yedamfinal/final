package co.team.apt.esey.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import co.team.apt.common.vo.PostBoxVo;
import co.team.apt.esey.service.PostBoxService;

@Controller
public class PostBoxController {

	@Autowired
	PostBoxService postBoxService;
	
	public String postBoxList(Model model, PostBoxVo vo) {
		List<PostBoxVo> list = postBoxService.postBoxList(vo);
		model.addAttribute("posBoxLost",list);
		return null;
	}
}

package co.team.apt.common.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.team.apt.common.vo.BoardVo;
import co.team.apt.community.service.CommunityService;
import co.team.apt.notice.service.NoticeService;

@Controller
public class CommonController {
	@Autowired
	NoticeService noticeService;
	
	@Autowired
	CommunityService communityService;
	
	@RequestMapping("/home")
	public String home(Model model, BoardVo vo) {
		vo.setEnd(4);
		List<BoardVo> list = noticeService.noticeList(vo);
		model.addAttribute("noticeList", list);
				
		return "home/home";
	}
}

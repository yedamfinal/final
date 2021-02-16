package co.team.apt.common.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.team.apt.common.vo.BoardVo;
import co.team.apt.common.vo.BoardVoteVo;
import co.team.apt.community.service.CommunityService;
import co.team.apt.notice.service.NoticeService;
import co.team.apt.vote.service.BoardVoteService;

@Controller
public class CommonController {
	@Autowired
	NoticeService noticeService;
		
	@Autowired 
	CommunityService communityService;
	
	@Autowired
	BoardVoteService voteService;
	
	
	@RequestMapping("/home")
	public String home(Model model, BoardVo vo, BoardVoteVo vvo) {
		vo.setEnd(4);
		vvo.setEnd(4);
		List<BoardVo> list = noticeService.noticeList(vo);
		List<BoardVoteVo> vlist= voteService.boardVoteList(vvo);
		
		
		vo.setType("free");
		List<BoardVo> list2 = communityService.boardList(vo);
		vo.setType("def");
		List<BoardVo> list3 = communityService.boardList(vo);
		
		
		model.addAttribute("boardVoteList", vlist);
		model.addAttribute("noticeList", list);
		model.addAttribute("freeList", list2);
		model.addAttribute("defList", list3);
		
				
		return "home/home";
	}
	
	
}

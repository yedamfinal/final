package co.team.apt.vote.web;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import co.team.apt.common.vo.BoardVoteVo;
import co.team.apt.vote.service.BoardVoteService;

@Controller
public class BoardVoteController {
	
	@Autowired
	private BoardVoteService boardVoteService;
	
	@RequestMapping("/boardVoteList.do")
	public String boardVoteList(Model model, BoardVoteVo vo) {
		List<BoardVoteVo> list = boardVoteService.boardVoteList(vo);
		model.addAttribute("boardVoteList", list);
		
		return "vote/boardVoteList";
	}
	

}

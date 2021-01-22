package co.team.apt.vote.web;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.team.apt.common.vo.BoardVoteVo;
import co.team.apt.common.vo.ResidentVo;
import co.team.apt.vote.service.BoardVoteService;

@Controller
public class BoardVoteController {
	
	@Autowired
	private BoardVoteService boardVoteService;
	
	@RequestMapping("/boardVoteInsert")
	public String boardVoteInsert(Model model, BoardVoteVo vo) {
		
		return "vote/boardVoteInsert";
	}
	
	@RequestMapping("/candiRegister")
	public String candiRegister(Model model, BoardVoteVo vo) {
		
		return "vote/candiRegister";
	}
	
	@RequestMapping("/boardVoteList.do")
	public String boardVoteList(Model model, BoardVoteVo vo) {
		List<BoardVoteVo> list = boardVoteService.boardVoteList(vo);
		model.addAttribute("boardVoteList", list);
		
		return "vote/boardVoteList";
	}
	
	@RequestMapping("/searchName.do")
	@ResponseBody
	public ResidentVo searchId(ResidentVo vo){
		
		return boardVoteService.searchName(vo);		
	}
	
	
}

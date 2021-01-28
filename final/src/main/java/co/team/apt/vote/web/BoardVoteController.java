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
	
	//등록페이지
	@RequestMapping("/boardVoteInsert.do")
	public String boardVoteInsert(Model model, BoardVoteVo vo) {
		boardVoteService.voteInsert(vo);
		return "redirect:boardVoteList.do";
	}
	
	@RequestMapping("/boardVoteInsertForm.do")
	public String boardVoteInsertForm(Model model, BoardVoteVo vo) {
		
		return "vote/boardVoteInsert";
	}
	
	@RequestMapping("/candiRegister.do")
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
	public List<ResidentVo> searchName(ResidentVo vo){
		
		return boardVoteService.searchName(vo);		
	}
	
	@RequestMapping("/boardVoteRead.do")
	public String boardVoteRead(Model model, BoardVoteVo vo) {
		vo= boardVoteService.selectOne(vo);
		model.addAttribute("vo", vo);
		return "vote/boardVoteRead";
		
	}
	
	@RequestMapping("/boardVoteUpdate.do")
	public String boardVoteUpdate(BoardVoteVo vo) {
		int n= boardVoteService.voteUpdate(vo);
		return "redirect:boardVoteList.do";
	}
	
	@RequestMapping("/boardVoteDelete.do")
	public String boardVoteDelete(BoardVoteVo vo) {
		int n= boardVoteService.voteDelete(vo);
		return "redirect:boardVoteList.do";
	}
	
	
}

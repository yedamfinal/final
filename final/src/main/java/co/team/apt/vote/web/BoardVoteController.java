package co.team.apt.vote.web;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.team.apt.common.vo.BoardVoteVo;
import co.team.apt.common.vo.CandidateVo;
import co.team.apt.common.vo.ResidentVo;
import co.team.apt.vote.service.BoardVoteService;
import co.team.apt.vote.service.CandidateService;

@Controller
public class BoardVoteController {
	@Autowired
	private CandidateService candidateService;
	
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
		model.addAttribute("vo", vo);
		return "vote/candiRegister";
	}
	
	@RequestMapping("/boardVoteList.do")
	public String boardVoteList(Model model, BoardVoteVo vo) {
		List<BoardVoteVo> list = boardVoteService.boardVoteList(vo);
		model.addAttribute("boardVoteList", list);
		
		return "vote/boardVoteList";
	}
	
	//후보자 동명이인 중에 한명만 찾기 ajax 처리
	@RequestMapping("/searchName.do")
	@ResponseBody
	public List<ResidentVo> searchName(ResidentVo vo){
		
		return boardVoteService.searchName(vo);		
	}
	
	//후보자 삭제
	@RequestMapping("/candiDelete.do")
	@ResponseBody
	public int candiDelete(CandidateVo vo){
		return candidateService.candiDelete(vo);
	}
	
	@RequestMapping("/updateCandidate.do")
	public String updateCandidate(Model model, CandidateVo vo) {
		vo =candidateService.selectName(vo);
		
		model.addAttribute("vo", vo);
		return "vote/candiRegister";
	}
	
	
	//게시판->상세보기, 수정 페이지로 이동
	@RequestMapping("/boardVoteRead.do")
	public String boardVoteRead(Model model, BoardVoteVo vo, CandidateVo cvo) {
		vo= boardVoteService.selectOne(vo);
		model.addAttribute("vo", vo);
		model.addAttribute("clist", candidateService.candidateList(cvo));
		
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
	
	
	//후보자 1명 등록
	@RequestMapping("/findCandidate.do")
	public String findCandidate(CandidateVo vo) {
		int n= candidateService.candiInsert(vo);
		
		return "redirect:boardVoteRead.do?seq="+vo.getSeq();
	}
	
	@RequestMapping("/deleteCandidate.do")
	public String deleteCandidate(CandidateVo vo) {
		int n= candidateService.candiDelete(vo);
		
		return "redirect:candiRegister.do?seq=";
	}
	
	
	
}

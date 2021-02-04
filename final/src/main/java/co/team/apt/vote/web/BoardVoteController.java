package co.team.apt.vote.web;



import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;

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
	
	//권한별 페이지 이동
	@RequestMapping("voteStart.do")
	public String payRead(Model model, BoardVoteVo vo, HttpServletRequest request) throws JsonProcessingException {
		
		HttpSession session =  request.getSession(false);
		ResidentVo resiVo = (ResidentVo) session.getAttribute("person");
		List<BoardVoteVo> list = boardVoteService.boardVoteList(vo);
		model.addAttribute("boardVoteList", list);
		if(resiVo == null) { //로그인 안한상태
			return "home/needLogin";
		}else if(resiVo.getType().equals("m")){//관리자로 로그인
			
			return "vote/boardVoteList";
		}else  {//세대주로 로그인
			return "vote/userBoardVoteList";
		}
	}
	
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
	
	//투표 결과 페이지
	@RequestMapping("/result.do")
	@ResponseBody
	public String result(Model model, BoardVoteVo vo) {
		
		if(vo.getEndDate().getTime() > System.currentTimeMillis()) {
			return "<script>"
					 + "alert(\"you can't checked the result.\");"
			         + "location.href='voteStart.do'"
			         + "</script>";
		} else {
			return "<script>"
			         + "location.href='voteResult.do?seq="+vo.getSeq()+"'"
			         + "</script>";
		}
		
	}
	@RequestMapping("/voteResult.do")
	public String ResultForm(Model model, BoardVoteVo vo) {
		model.addAttribute("vo", vo);
		return "vote/result";
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
	
	//
	@RequestMapping("/editCandidate.do")
	public String editCandidate(Model model, CandidateVo vo) {
		String name= vo.getName();
		vo =candidateService.selectName(vo);
		vo.setName(name);
		model.addAttribute("vo", vo);

		return "vote/editCandidate";
	}
	
	@RequestMapping("/candiRegister.do")
	public String candiRegister(Model model, CandidateVo vo) {
		model.addAttribute("vo", vo);
		return "vote/candiRegister";
	}
	
	//매니저 게시판->상세보기, 수정 페이지로 이동
	@RequestMapping("/boardVoteRead.do")
	public String boardVoteRead(Model model, BoardVoteVo vo, CandidateVo cvo) {
		vo= boardVoteService.selectOne(vo);
		model.addAttribute("vo", vo);
		model.addAttribute("clist", candidateService.candidateList(cvo));
		
		return "vote/boardVoteRead";
	}
	
	//주민 게시판->상세보기, 수정 페이지로 이동
		@RequestMapping("/userBoardVoteRead.do")
		public String userBoardVoteRead(Model model, BoardVoteVo vo, CandidateVo cvo) {
			vo= boardVoteService.selectOne(vo);
			model.addAttribute("vo", vo);
			model.addAttribute("clist", candidateService.candidateList(cvo));
			
			return "vote/userBoardVoteRead";
		}
	//후보자 정보 수정
	@RequestMapping("/boardVoteUpdate.do")
	public String boardVoteUpdate(BoardVoteVo vo) {
		int n= boardVoteService.voteUpdate(vo);
		return "redirect:boardVoteList.do";
	}
	
	@RequestMapping("/boardVoteDelete.do")
	public String boardVoteDelete(BoardVoteVo vo) {
		System.out.println(vo);
		int n= boardVoteService.voteDelete(vo);
		return "redirect:boardVoteList.do";
	}
	
	
	//후보자 1명 등록
	@RequestMapping("/register.do")
	public String findCandidate(CandidateVo vo) {
		int n= candidateService.candiInsert(vo);
		return "redirect:boardVoteRead.do?seq="+vo.getSeq();
	}
	
	
	//후보자 삭제
	@RequestMapping("/deleteCandidate.do")
	public String deleteCandidate(CandidateVo vo) {
		System.out.println(vo);
		int n= candidateService.candiDelete(vo);
		
		return "redirect:boardVoteRead.do?seq="+vo.getSeq();
	}
	
	//후보자 수정
	@RequestMapping("/updateCandidate.do")
	public String updateCandidate(CandidateVo vo) {
		System.out.println(vo);
		int n =candidateService.candiUpdate(vo);
		
		return "redirect:boardVoteRead.do?seq="+vo.getSeq();
	}
	
	//공약 및 프로필
	@RequestMapping("/profile.do")
	public String profile(Model model, CandidateVo vo) {
		model.addAttribute("vo", vo);
		
		return "vote/profile";
	}
	
	//승호가 테스트에 쓴거
	@RequestMapping("hoTest.do")
	public String hoTest() {
		return "vote/test";
	}
}

package co.team.apt.vote.web;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.team.apt.common.vo.BoardVo;
import co.team.apt.common.vo.BoardVoteVo;
import co.team.apt.common.vo.CandidateVo;
import co.team.apt.common.vo.Paging;
import co.team.apt.common.vo.ResidentVo;
import co.team.apt.vote.mapper.BoardVoteMapper;
import co.team.apt.vote.service.BoardVoteService;
import co.team.apt.vote.service.CandidateService;

@Controller
public class BoardVoteController {
	@Autowired
	private CandidateService candidateService;

	@Autowired
	private BoardVoteService boardVoteService;
	
	@Autowired
	BoardVoteMapper dao;

	// 권한별 페이지 이동
	@RequestMapping("voteStart.do")
	public String payRead(Model model, BoardVoteVo vo, Paging paging, HttpServletRequest request) throws JsonProcessingException {

		HttpSession session = request.getSession(false);
		ResidentVo resiVo = (ResidentVo) session.getAttribute("person");
		List<BoardVoteVo> list = boardVoteService.boardVoteList(vo);
		model.addAttribute("boardVoteList", list);

		// 페이징처리
		paging.setPageUnit(10);
		paging.setPageSize(10); // 페이지넘버 자체를 지정
		// 페이지번호 파라미터
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
		// 시작/마지막 레코드 번호
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());
		// 전체 건수
		paging.setTotalRecord(dao.pagingCount(vo)); // 전체레코드건수

		model.addAttribute("paging", paging); // JSP -> <my:paging paging="${paging}" />

		List<BoardVoteVo> list1 = boardVoteService.boardVoteList(vo);
		model.addAttribute("boardVoteList", list1);

		if (resiVo == null) { // 로그인 안한상태
			return "home/needLogin";
		} else if (resiVo.getType().equals("m")) {// 관리자로 로그인

			return "vote/boardVoteList";
		} else {// 세대주로 로그인

			return "vote/userBoardVoteList";
		}
	}

	// 등록페이지
	@RequestMapping("/boardVoteInsert.do")
	public String boardVoteInsert(Model model, BoardVoteVo vo) {
		boardVoteService.voteInsert(vo);
		return "redirect:voteStart.do";
	}

	@RequestMapping("/boardVoteInsertForm.do")
	public String boardVoteInsertForm(Model model, BoardVoteVo vo) {

		return "vote/boardVoteInsert";
	}

	@RequestMapping("/boardVoteList.do")
	public String boardVoteList(Model model, BoardVoteVo vo) {
		List<BoardVoteVo> list = boardVoteService.boardVoteList(vo);
		model.addAttribute("boardVoteList", list);

		return "vote/boardVoteList";
	}

	// 후보자 동명이인 중에 한명만 찾기 ajax 처리
	@RequestMapping("/searchName.do")
	@ResponseBody
	public List<ResidentVo> searchName(ResidentVo vo) {

		return boardVoteService.searchName(vo);
	}

	// 후보자 삭제
	@RequestMapping("/candiDelete.do")
	@ResponseBody
	public int candiDelete(CandidateVo vo) {
		return candidateService.candiDelete(vo);
	}

	//
	@RequestMapping("/editCandidate.do")
	public String editCandidate(Model model, CandidateVo vo) {
		String name = vo.getName();
		vo = candidateService.selectName(vo);
		vo.setName(name);
		model.addAttribute("vo", vo);

		return "vote/editCandidate";
	}

	@RequestMapping("/candiRegister.do")
	public String candiRegister(Model model, CandidateVo vo) {
		model.addAttribute("vo", vo);
		return "vote/candiRegister";
	}

	// 매니저 게시판->상세보기, 수정 페이지로 이동
	@RequestMapping("/boardVoteRead.do")
	public String boardVoteRead(Model model, BoardVoteVo vo, CandidateVo cvo) {
		vo = boardVoteService.selectOne(vo);
		model.addAttribute("vo", vo);
		model.addAttribute("clist", candidateService.candidateList(cvo));

		return "vote/boardVoteRead";
	}

	// 주민 게시판->상세보기, 수정 페이지로 이동
	@RequestMapping("/userBoardVoteRead.do")
	public String userBoardVoteRead(Model model, BoardVoteVo vo, CandidateVo cvo) throws JsonProcessingException {
		List<CandidateVo> list = candidateService.candidateList(cvo);
		vo = boardVoteService.selectOne(vo);
		model.addAttribute("vo", vo);
		model.addAttribute("clist", list);
		if (vo.getEndDate().getTime() > System.currentTimeMillis()) {
			return "vote/userBoardVoteRead";
		} else {

			ObjectMapper mapper = new ObjectMapper();
			String json = mapper.writeValueAsString(list);
			model.addAttribute("json", json);
			model.addAttribute("cvo", cvo);

			return "vote/result";
		}
	}

	// 후보자 정보 수정
	@RequestMapping("/boardVoteUpdate.do")
	public String boardVoteUpdate(BoardVoteVo vo) {
		int n = boardVoteService.voteUpdate(vo);
		return "redirect:voteStart.do";
	}

	@RequestMapping("/boardVoteDelete.do")
	public String boardVoteDelete(BoardVoteVo vo) {
		System.out.println(vo);
		int n = boardVoteService.voteDelete(vo);
		return "redirect:voteStart.do";
	}

	// 후보자 1명 등록
	@RequestMapping("/register.do")
	public String findCandidate(CandidateVo vo, HttpServletRequest request,
			@RequestParam(required = false) MultipartFile uploadFile) throws IllegalStateException, IOException {

		String path = request.getSession().getServletContext().getRealPath("/resources/img/candidate");
		if (uploadFile != null && uploadFile.getSize() > 0) {
			File file = new File(path, uploadFile.getOriginalFilename());// rename

			uploadFile.transferTo(file);
			vo.setPicture(uploadFile.getOriginalFilename());
		}
		int n = candidateService.candiInsert(vo);
		return "redirect:boardVoteRead.do?seq=" + vo.getSeq();
	}

	// 후보자 프로필 상세보기 페이지

	// 후보자 삭제
	@RequestMapping("/deleteCandidate.do")
	public String deleteCandidate(CandidateVo vo) {
		System.out.println(vo);
		int n = candidateService.candiDelete(vo);

		return "redirect:boardVoteRead.do?seq=" + vo.getSeq();
	}

	// 후보자 수정
	@RequestMapping("/updateCandidate.do")
	public String updateCandidate(CandidateVo vo, HttpServletRequest request,
			@RequestParam(required = false) MultipartFile uploadFile) throws IllegalStateException, IOException {

		String path = request.getSession().getServletContext().getRealPath("/resources/img/candidate");
		if (uploadFile != null && uploadFile.getSize() > 0) {
			File file = new File(path, uploadFile.getOriginalFilename());// rename

			uploadFile.transferTo(file);
			vo.setPicture(uploadFile.getOriginalFilename());
		}
		int n = candidateService.candiUpdate(vo);

		return "redirect:boardVoteRead.do?seq=" + vo.getSeq();
	}

	// 공약 및 프로필
	@RequestMapping("/profile.do")
	public String profile(Model model, CandidateVo vo) {
		vo = candidateService.candiProfile(vo);
		model.addAttribute("vo", vo);

		return "vote/profile";
	}

	// 승호가 테스트에 쓴거
	@RequestMapping("hoTest.do")
	public String hoTest() {
		return "vote/test";
	}
}

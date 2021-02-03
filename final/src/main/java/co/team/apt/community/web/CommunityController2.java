package co.team.apt.community.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import co.team.apt.common.vo.BoardVo;
import co.team.apt.common.vo.Paging;
import co.team.apt.community.mapper.CommunityMapper;
import co.team.apt.community.service.CommunityService;

//@Controller
public class CommunityController2 {
	
	@Autowired 
	CommunityService communityService;
	
	@Autowired
	CommunityMapper dao;
	
	//자유게시판 
	//자유게시판 이동
	@RequestMapping("communityList/{type:.+}")
	public String freeList(Model model,BoardVo vo, Paging paging, 
			@PathVariable("type") String type) {
		
		vo.setType(type);
		
		//페이징처리
		paging.setPageUnit(10);
		paging.setPageSize(10);	//페이지넘버 자체를 지정
		// 페이지번호 파라미터
		if( paging.getPage() == null) {
			paging.setPage(1); 
		}		
		// 시작/마지막 레코드 번호
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());		
		// 전체 건수
		paging.setTotalRecord(dao.pagingCount(vo));		//전체레코드건수


		model.addAttribute("paging", paging);	//JSP -> <my:paging paging="${paging}" />
		
		List<BoardVo> list = communityService.boardList(vo);
		model.addAttribute("boardList", list);
		
		return "community/"+vo.getType()+"/list";
	}
	
	//글쓰기 폼으로 이동
	@RequestMapping("freeInsertForm.do")
	public String insertForm(Model model) {
		return "community/free/insertForm";
	}
	
	//글쓰기
	@RequestMapping("freeInsert.do")
	public String insert(Model model,BoardVo vo) {
		
		int n = communityService.boardInsert(vo);
		
		
		if(n != 0) {
			return "redirect:freeList.do";			
		}else {
			return null;//에러처리
		}
	}
	
	//글내용보기
	@RequestMapping("freeRead.do")
	public String read(BoardVo vo, Model model) {
		vo = communityService.boardOne(vo);
		model.addAttribute("vo",vo);
		return "community/free/read";
	}
	
	//글수정폼으로 이동
	@RequestMapping("freeUpdateForm.do")
	public String updateForm(BoardVo vo, Model model) {
		vo = communityService.boardOne(vo);
		model.addAttribute("vo",vo);
		return "community/free/updateForm";
	}
	
	//글 삭제
	@RequestMapping("freeDelete.do")
	public String delete(BoardVo vo, Model model) {
		int n = communityService.boardDelete(vo);
		
		if(n != 0) {		
			return "redirect:freeList.do";
		}else {
			return null;//에러처리
		}
	}
	
	//업데이트
	@RequestMapping("freeUpdate.do")
	public String update(BoardVo vo, Model model) {
		int n = communityService.boardUpdate(vo);
		
		if(n != 0) {		
			return "redirect:freeList.do";
		}else {
			return null;//에러처리
		}
	}
	
	//자유게시판 끝
}

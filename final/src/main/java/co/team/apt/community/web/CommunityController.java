package co.team.apt.community.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.team.apt.common.vo.BcommentVo;
import co.team.apt.common.vo.BoardVo;
import co.team.apt.common.vo.Paging;
import co.team.apt.community.mapper.CommunityMapper;
import co.team.apt.community.service.CommunityService;

@Controller
public class CommunityController {
	
	@Autowired 
	CommunityService communityService;
	
	@Autowired
	CommunityMapper dao;
	
	@ModelAttribute("type")
	public String type(BoardVo vo) {
		return vo.getType();
	}
	
	//자유게시판 
	//자유게시판 이동
	@RequestMapping("communityList"	)
	public String freeList(Model model,BoardVo vo, Paging paging, HttpSession session) {
		//model.addAttribute("type", vo.getType());
		if(vo.getType() != null) {
			session.setAttribute("pageType", vo.getType());
		}else {
			vo.setType((String) session.getAttribute("pageType"));
		}
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
		
		return vo.getType()+"/list";
	}
	
	//글쓰기 폼으로 이동
	@RequestMapping("communityInsertForm.do")
	public String insertForm(Model model) {
		return "community/insertForm";
	}
	
	//글쓰기
	@RequestMapping("communityInsert.do")
	public String insert(Model model,BoardVo vo) {
		
		int n = communityService.boardInsert(vo);
		
		
		if(n != 0) {
			return "redirect:communityList";			
		}else {
			return null;//에러처리
		}
	}
	
	//글내용보기
	@RequestMapping("communityRead.do")
	public String read(BoardVo vo, Model model) throws JsonProcessingException {
		vo = communityService.boardOne(vo);
		//vo ->> json 파싱
		List<BcommentVo> comment = communityService.commentList(vo);
		ObjectMapper mapper = new ObjectMapper();
		String re = mapper.writeValueAsString(comment);
		model.addAttribute("comment",re);
		model.addAttribute("vo",vo);
		return "community/read";
	}
	
	//글수정폼으로 이동
	@RequestMapping("communityUpdateForm.do")
	public String updateForm(BoardVo vo, Model model) {
		vo = communityService.boardOne(vo);
		model.addAttribute("vo",vo);
		return "community/updateForm";
	}
	
	//글 삭제
	@RequestMapping("communityDelete.do")
	public String delete(BoardVo vo, Model model) {
		int n = communityService.boardDelete(vo);
		
		if(n != 0) {		
			return "redirect:communityList";
		}else {
			return null;//에러처리
		}
	}
	
	//업데이트
	@RequestMapping("communityUpdate.do")
	public String update(BoardVo vo, Model model) {
		int n = communityService.boardUpdate(vo);
		
		if(n != 0) {		
			return "redirect:communityList";
		}else {
			return null;//에러처리
		}
	}
	//댓글 리스트 아작스
	@RequestMapping("commentList.ajax")
	@ResponseBody
	public List<BcommentVo> commentList(BoardVo vo) {
		List<BcommentVo> comment = communityService.commentList(vo);
		return comment;
	}
	
	//댓글 작성
	@RequestMapping("addComment.do")
	@ResponseBody
	public BcommentVo addComment(BcommentVo vo) {
		int n = communityService.addComment(vo);
		
		if(n!=0)
			return vo;
		else
			return null;
	}
	
	//댓글삭제
	@RequestMapping("commentDelete.do")
	@ResponseBody
	public String commentDelete(BcommentVo vo) {
		int n = communityService.commentDelete(vo);
		
		if(n!=0)
			return "success";
		else
			return null;
	}
	
	//댓글삭제
		@RequestMapping("commentUpdate.do")
		@ResponseBody
		public String commentUpdate(BcommentVo vo) {
			int n = communityService.commentUpdate(vo);
			
			if(n!=0)
				return "success";
			else
				return null;
		}
}

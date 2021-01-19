package co.team.apt.community.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.team.apt.community.service.CommunityService;
import co.team.apt.community.vo.BoardVo;

@Controller
public class CommunityController {
	
	@Autowired 
	CommunityService communityService;
	
	//자유게시판
	@RequestMapping("freeList.do")
	public String freeList(Model model,BoardVo vo) {
		
		List<BoardVo> list = communityService.boardList(vo);
		model.addAttribute("boardList", list);
		
		return "community/free/list";
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
		model.addAttribute("type",vo.getType());
		
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
			return "redirect:freeList.do?type=free";
		}else {
			return null;//에러처리
		}
	}
	
	//업데이트
	@RequestMapping("freeUpdate.do")
	public String update(BoardVo vo, Model model) {
		int n = communityService.boardUpdate(vo);
		
		if(n != 0) {		
			return "redirect:freeList.do?type=free";
		}else {
			return null;//에러처리
		}
	}
}

package co.team.apt.notice.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.team.apt.common.vo.BoardVo;
import co.team.apt.common.vo.Paging;
import co.team.apt.notice.mapper.NoticeMapper;
import co.team.apt.notice.service.NoticeService;

@Controller
public class NoticeController {
	@Autowired
	NoticeService noticeService;
	
	@Autowired
	NoticeMapper dao;
	
	//공지사항
	@RequestMapping("noticeList.do")
	public String noticeList(Model model, BoardVo vo, Paging paging) {
		
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
		
		List<BoardVo> list = noticeService.noticeList(vo);
		model.addAttribute("noticeList", list);
		
		return "notice/list";
	}
	
	//글쓰기 폼으로 이동
	@RequestMapping("noticeInsertForm.do")
	public String insertForm(Model model) {
		return "notice/insertForm";
	}
	
	//글쓰기
	@RequestMapping("noticeInsert.do")
	public String insert(Model model, BoardVo vo) {
		
		int n = noticeService.noticeInsert(vo);
		model.addAttribute("type", vo.getType());
		
		if(n != 0) {
			return "redirect:noticeList.do";
		}else {
			return null;//에러처리 필요
		}
	}
	
	//글내용보기
	@RequestMapping("noticeRead.do")
	public String read(BoardVo vo, Model model) {
		vo = noticeService.noticeOne(vo);
		model.addAttribute("vo", vo);
		return "notice/read";		
	}
	
	@RequestMapping("noticeUpdateForm.do")
	public String updateForm(BoardVo vo, Model model) {
		vo = noticeService.noticeOne(vo);
		model.addAttribute("vo", vo);
		return "notice/updateForm";
	}
	
	@RequestMapping("noticeUpdate.do")
	public String update(Model model, BoardVo vo) {
		
		int n = noticeService.noticeUpdate(vo);
		model.addAttribute("type", vo.getType());
		
		if(n != 0) {
			return "redirect:noticeList.do";	//return "redirect:noticeList.do?type=notice"; type값 리턴
		}else {
			return null;//에러처리 필요
		}
	}
	
	@RequestMapping("noticeDelete.do")
	public String delete(BoardVo vo, Model model) {
		int n = noticeService.noticeDelete(vo);		
				
		if(n != 0) {
			return "redirect:noticeList.do?type=notice";
		}else {
			return null;//에러처리 필요
		}		
		
	}
}

package co.team.apt.notice.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.team.apt.community.vo.BoardVo;
import co.team.apt.notice.service.NoticeService;

@Controller
public class NoticeController {
	@Autowired
	NoticeService noticeService;
	
	//공지사항
	@RequestMapping("noticeList.do")
	public String noticeList(Model model, BoardVo vo) {
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
		
		int n = noticeService.NoticeInsert(vo);
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
		model.addAttribute("vo", vo);
		return "notice/read";		
	}
}

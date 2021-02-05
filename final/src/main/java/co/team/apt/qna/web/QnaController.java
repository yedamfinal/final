package co.team.apt.qna.web;


import java.io.IOException;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.team.apt.common.vo.Paging;
import co.team.apt.common.vo.QnaVo;
import co.team.apt.common.vo.ResidentVo;
import co.team.apt.qna.mapper.QnaMapper;
import co.team.apt.qna.service.QnaService;

@Controller
public class QnaController {
	@Autowired
	QnaService qnaService;
	
	@Autowired
	QnaMapper dao;
		
	
	@RequestMapping("qnaList.do")
	public String qnaList(Model model, QnaVo vo, Paging paging, HttpServletRequest request) {
		
		//권한별 페이지이동 시작
		HttpSession session =  request.getSession(false);
		ResidentVo resiVo = (ResidentVo) session.getAttribute("person");
		
		if(resiVo == null) { //로그인 안한상태
			return "home/needLogin";
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
				
		List<QnaVo> list = qnaService.qnaList(vo);
		model.addAttribute("qnaList", list);
		
		return "qna/list";	//수정
	}
	
	//글쓰기 폼으로 이동
	@RequestMapping("qnaInsertForm.do")
	public String insertForm(Model model) {
		return "qna/insertForm";
	}
	
	//답글쓰기 폼으로 이동
		@RequestMapping("replyInsertForm.do")
		public String replyInsertForm(Model model, QnaVo vo) {
			vo = qnaService.qnaOne(vo);
			model.addAttribute("vo", vo);
			return "qna/replyInsertForm";
		}
	
	//글쓰기
	@RequestMapping("qnaInsert.do")
	public String insert(Model model, QnaVo vo, HttpServletRequest request) throws IllegalStateException, IOException {
				
		int n = qnaService.qnaInsert(vo);
				
		if(n != 0) {
			return "redirect:qnaList.do";
		}else {
			return null;//에러처리 필요
		}
	}
	
	//답글쓰기
		@RequestMapping("replyInsert.do")
		public String replyInsert(Model model, QnaVo vo, HttpServletRequest request) throws IllegalStateException, IOException {
					
			int n = qnaService.replyInsert(vo);
					
			if(n != 0) {
				return "redirect:qnaList.do";
			}else {
				return null;//에러처리 필요
			}
		}
	
	
	
	//글내용보기
	@RequestMapping("qnaRead.do")
	public String read(QnaVo vo, Model model) {
		vo = qnaService.qnaOne(vo);
		model.addAttribute("vo", vo);
		return "qna/read";		
	}
	
	@RequestMapping("qnaUpdateForm.do")
	public String updateForm(QnaVo vo, Model model) {
		vo = qnaService.qnaOne(vo);
		model.addAttribute("vo", vo);
		return "qna/updateForm";
	}
	
	@RequestMapping("replyUpdateForm.do")
	public String replyUpdateForm(QnaVo vo, Model model) {
		vo = qnaService.qnaOne(vo);
		model.addAttribute("vo", vo);
		return "qna/replyUpdateForm";
	}
	
	@RequestMapping("qnaUpdate.do")
	public String update(Model model, QnaVo vo) {
		
		int n = qnaService.qnaUpdate(vo);
				
		if(n != 0) {
			return "redirect:qnaList.do";	//return "redirect:noticeList.do?type=notice"; type값 리턴
		}else {
			return null;//에러처리 필요
		}
	}
	
	@RequestMapping("replyUpdate.do")
	public String replyUpdate(Model model, QnaVo vo) {
		
		int n = qnaService.qnaUpdate(vo);
				
		if(n != 0) {
			return "redirect:qnaList.do";	//return "redirect:noticeList.do?type=notice"; type값 리턴
		}else {
			return null;//에러처리 필요
		}
	}
	
	@RequestMapping("qnaDelete.do")
	public String delete(QnaVo vo, Model model) {
		int n = qnaService.qnaDelete(vo);		
				
		if(n != 0) {
			return "redirect:qnaList.do";
		}else {
			return null;//에러처리 필요
		}		
		
	}

}

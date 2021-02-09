package co.team.apt.notice.web;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;



import co.team.apt.common.vo.BoardVo;
import co.team.apt.common.vo.Paging;
import co.team.apt.common.vo.ResidentVo;
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
	public String noticeList(Model model, BoardVo vo, Paging paging, HttpServletRequest request) {
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
	public String insert(Model model, BoardVo vo, HttpServletRequest request,
			@RequestParam(required = false) MultipartFile uploadFile) throws IllegalStateException, IOException {
		
			//첨부파일 처리
				String path = request.getSession()
									 .getServletContext()
									 .getRealPath("/resources/img/upload"); 
				if(uploadFile != null && uploadFile.getSize()>0) {
					File file = new File(path,
							uploadFile.getOriginalFilename());
					//rename
					
					uploadFile.transferTo(file);
					vo.setDeffile(uploadFile.getOriginalFilename());			
				}
		
		int n = noticeService.noticeInsert(vo);
		model.addAttribute("type", vo.getType());
		
		if(n != 0) {
			return "redirect:noticeList.do";
		}else {
			return null;//에러처리 필요
		}
	}
	//다운로드
	@RequestMapping("download/{fileName:.+}")
	public void downloadPDFResource(HttpServletRequest request, HttpServletResponse response,
			@PathVariable("fileName") String fileName) {

		String dataDirectory = request.getSession().getServletContext().getRealPath("/resources/img/upload");
		Path file = Paths.get(dataDirectory, fileName);
		if (Files.exists(file)) {
			response.setContentType("application/octet-stream;charset=UTF-8");
			response.addHeader("Content-Disposition", "attachment; filename=" + fileName);
			try {
				Files.copy(file, response.getOutputStream());
				response.getOutputStream().flush();
			} catch (IOException ex) {
				ex.printStackTrace();
			}
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
	
	//아파트소개
	@RequestMapping("introduece.do")
	public String intoduce(Model model) {
		return "introduce/introduce";
	}
	
			
}

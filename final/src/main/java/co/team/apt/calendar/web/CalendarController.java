package co.team.apt.calendar.web;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.team.apt.calendar.mapper.CalendarMapper;
import co.team.apt.calendar.service.CalendarService;
import co.team.apt.common.vo.BoardVo;
import co.team.apt.common.vo.CalendarVo;

@Controller
public class CalendarController {
	
	@Autowired
	CalendarService calendarService; 
	
	@Autowired
	CalendarMapper dao;
		
	//캘린더 조회
	@RequestMapping("calendar.do")
	public String calendar(Model model, CalendarVo vo) {
		
//		List<CalendarVo> list = calendarService.CalendarList(vo);
//		model.addAttribute("calendarList", list);
//				
		return "calendar/calendar";
	}
			
	
	
	
	//글쓰기
	@RequestMapping("calendarInsert.do")
	@ResponseBody
	public CalendarVo insert(CalendarVo vo) throws SQLException {
						
			int n = calendarService.CalendarInsert(vo);
						
			if(n != 0) {
				return vo;
			}else {
				return null;//에러처리 필요
			}
		}
	
	//글수정
	@RequestMapping("calendarUpdate.do")
	@ResponseBody
	public CalendarVo update(CalendarVo vo) throws SQLException {
							
			int n = calendarService.CalendarUpdate(vo);
							
			if(n != 0) {
				return vo;
			}else {
				return null;//에러처리 필요
			}
	}
	
	@RequestMapping("calendarDelete.do")
	@ResponseBody
	public CalendarVo delete(CalendarVo vo) {
		int n = calendarService.CalendarDelete(vo);		
				
		if(n != 0) {
			return vo;
		}else {
			return null;//에러처리 필요
		}		
		
	}
}

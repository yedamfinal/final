package co.team.apt.calendar.web;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.team.apt.calendar.mapper.CalendarMapper;
import co.team.apt.calendar.service.CalendarService;
import co.team.apt.common.vo.CalendarVo;

@Controller
public class CalendarController {
	
	@Autowired
	CalendarService calendarService; 
	
	@Autowired
	CalendarMapper dao;
		
	//캘린더
	@RequestMapping("calendar.do")
	public String calendar(Model model, CalendarVo vo) {
		
		
		/*
		 * List<CalendarVo> list = calendarService.CalendarList(vo);
		 * model.addAttribute("calendarList", list);
		 */
		 
		
		return "calendar/calendar";
	}
			
	
	
	
	//글쓰기
	@RequestMapping("calendarInsert.do")
	public String insert(CalendarVo vo) throws SQLException {
						
			int n = calendarService.CalendarInsert(vo);
						
			if(n != 0) {
				return "redirect:calendar.do";
			}else {
				return null;//에러처리 필요
			}
		}
}

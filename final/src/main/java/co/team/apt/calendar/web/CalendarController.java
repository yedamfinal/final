package co.team.apt.calendar.web;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.team.apt.calendar.mapper.CalendarMapper;
import co.team.apt.calendar.service.CalendarService;
import co.team.apt.common.vo.CalendarVo;

@Controller
public class CalendarController {
	
	@Autowired
	CalendarService calendarService; 
	
	@Autowired
	CalendarMapper dao;
		
	//캘린더 조회
	@RequestMapping("calendar.do")
	public String calendar(CalendarVo vo) {
		return "calendar/calendar";
	}
	
	//캘린더 조회
		@RequestMapping("calendarAjax.do")
		@ResponseBody
		public List<CalendarVo> calendarAjax(CalendarVo vo) {
			System.out.println(vo);
			List<CalendarVo> list = calendarService.CalendarList(vo);
						for (CalendarVo v : list ) {
							v.setAllDay(true);
						}
			return list;
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
	public void update(CalendarVo vo) throws SQLException {
			System.out.println(vo);
			int n = calendarService.CalendarUpdate(vo);
	}
	
	
	//글 삭제
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

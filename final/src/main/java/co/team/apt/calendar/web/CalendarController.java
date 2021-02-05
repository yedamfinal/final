package co.team.apt.calendar.web;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.team.apt.calendar.mapper.CalendarMapper;
import co.team.apt.calendar.service.CalendarService;
import co.team.apt.common.vo.CalendarVo;
import co.team.apt.common.vo.ResidentVo;

@Controller
public class CalendarController {
	
	@Autowired
	CalendarService calendarService; 
	
	@Autowired
	CalendarMapper dao;
		
	//캘린더 조회
	@RequestMapping("calendar.do")
	public String calendar(CalendarVo vo, HttpServletRequest request) {
		
		//권한별 페이지이동 시작
				HttpSession session =  request.getSession(false);
				ResidentVo resiVo = (ResidentVo) session.getAttribute("person");
				
				if(resiVo == null) { //로그인 안한상태
					return "home/needLogin";
				}
		
		return "calendar/calendar";
	}
	
	//캘린더 조회
	@RequestMapping("calendarAjax.do")
	@ResponseBody
	public List<CalendarVo> calendarAjax(CalendarVo vo) {
						
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

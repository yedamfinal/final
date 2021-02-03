package co.team.apt.calendar.mapper;

import java.util.List;

import co.team.apt.common.vo.CalendarVo;

public interface CalendarMapper {
	public List<CalendarVo> calendarList(CalendarVo vo);
	public CalendarVo calendarOne(CalendarVo vo);
	public int calendarInsert(CalendarVo vo);
	public int calendarUpdate(CalendarVo vo);
	public int calendarDelete(CalendarVo vo);
}

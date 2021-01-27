package co.team.apt.calendar.mapper;

import java.util.List;

import co.team.apt.common.vo.CalendarVo;

public interface CalendarMapper {
	public List<CalendarVo> CalendarList(CalendarVo vo);
	public CalendarVo CalendarOne(CalendarVo vo);
	public int CalendarInsert(CalendarVo vo);
	public int CalendarUpdate(CalendarVo vo);
	public int CalendarDelete(CalendarVo vo);
}

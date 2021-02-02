package co.team.apt.calendar.service;

import java.util.List;

import org.springframework.stereotype.Service;

import co.team.apt.common.vo.CalendarVo;

@Service
public interface CalendarService {
	public List<CalendarVo> CalendarList(CalendarVo vo);
	public CalendarVo CalendarOne(CalendarVo vo);
	public int CalendarInsert(CalendarVo vo);
	public int CalendarUpdate(CalendarVo vo);
	public int CalendarDelete(CalendarVo vo);
}

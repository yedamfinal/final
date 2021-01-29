package co.team.apt.calendar.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.team.apt.calendar.mapper.CalendarMapper;
import co.team.apt.calendar.service.CalendarService;
import co.team.apt.common.vo.CalendarVo;
@Service
public class CalendarServiceImpl implements CalendarService {

	@Autowired CalendarMapper dao;	
	
	@Override
	public List<CalendarVo> CalendarList(CalendarVo vo) {
		// TODO Auto-generated method stub
		return dao.calendarList(vo);
	}

	@Override
	public CalendarVo CalendarOne(CalendarVo vo) {
		// TODO Auto-generated method stub
		return dao.calendarOne(vo);
	}

	@Override
	public int CalendarInsert(CalendarVo vo) {
		// TODO Auto-generated method stub
		return dao.calendarInsert(vo);
	}

	@Override
	public int CalendarUpdate(CalendarVo vo) {
		// TODO Auto-generated method stub
		return dao.calendarUpdate(vo);
	}

	@Override
	public int CalendarDelete(CalendarVo vo) {
		// TODO Auto-generated method stub
		return dao.calendarDelete(vo);
	}

}

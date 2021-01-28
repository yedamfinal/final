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
		return dao.CalendarList(vo);
	}

	@Override
	public CalendarVo CalendarOne(CalendarVo vo) {
		// TODO Auto-generated method stub
		return dao.CalendarOne(vo);
	}

	@Override
	public int CalendarInsert(CalendarVo vo) {
		// TODO Auto-generated method stub
		return dao.CalendarInsert(vo);
	}

	@Override
	public int CalendarUpdate(CalendarVo vo) {
		// TODO Auto-generated method stub
		return dao.CalendarUpdate(vo);
	}

	@Override
	public int CalendarDelete(CalendarVo vo) {
		// TODO Auto-generated method stub
		return dao.CalendarDelete(vo);
	}

}

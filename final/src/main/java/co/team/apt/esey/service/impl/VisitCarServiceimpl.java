package co.team.apt.esey.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.team.apt.common.vo.VisitCarVo;
import co.team.apt.esey.mapper.VisitCarMapper;
import co.team.apt.esey.service.VisitCarService;

@Service("visitCarService")
public class VisitCarServiceimpl implements VisitCarService {
	@Autowired VisitCarMapper dao;
	
	@Override
	public List<VisitCarVo> visitList(VisitCarVo vo) {
		// TODO Auto-generated method stub
		return dao.visitList(vo);
	}
	@Override
	public int visitCarInsert(VisitCarVo vo) {
		return dao.visitCarInsert(vo);
		// TODO Auto-generated method stub
		
	}
	@Override
	public VisitCarVo selectOne(VisitCarVo vo) {
		// TODO Auto-generated method stub
		return dao.selectOne(vo);
	}
	@Override
	public int visitCarDelect(VisitCarVo vo) {
		// TODO Auto-generated method stub
		return dao.visitCarDelect(vo);
	}
	@Override
	public int visitCarUpdate(VisitCarVo vo) {
		// TODO Auto-generated method stub
		return dao.visitCarUpdate(vo);
	}
	@Override
	public List<VisitCarVo> mVisitList(VisitCarVo vo) {
		// TODO Auto-generated method stub
		return dao.mVisitList(vo);
	}
	@Override
	public int ming(VisitCarVo vo) {
		// TODO Auto-generated method stub
		return dao.ming(vo);
	}
	@Override
	public int ref(VisitCarVo vo) {
		// TODO Auto-generated method stub
		return dao.ref(vo);
	}
	@Override
	public int cpl(VisitCarVo vo) {
		// TODO Auto-generated method stub
		return dao.cpl(vo);
	}
	@Override
	public void deletevisitCar() {
		// TODO Auto-generated method stub
		dao.terVisitcar();
		
	}
	@Override
	public int cancel(VisitCarVo vo) {
		// TODO Auto-generated method stub
		return dao.cancel(vo);
	}
	
}


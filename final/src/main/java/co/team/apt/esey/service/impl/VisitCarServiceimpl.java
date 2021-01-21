package co.team.apt.esey.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.team.apt.common.vo.VisitCarVo;
import co.team.apt.esey.mapper.VisitCarMapper;
import co.team.apt.esey.service.VisitCarService;

@Service
public class VisitCarServiceimpl implements VisitCarService {
	@Autowired VisitCarMapper dao;

	@Override
	public String visitCarInsert(VisitCarVo vo) {
		return dao.visitCarInsert(vo);
		// TODO Auto-generated method stub
		
	}
	@Override
	public List<VisitCarVo> visitList(VisitCarVo vo) {
		// TODO Auto-generated method stub
		return dao.visitList(vo);
	}
	
	

}

package co.team.apt.facility.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.team.apt.common.vo.FacilityVo;
import co.team.apt.common.vo.ResidentVo;
import co.team.apt.facility.mapper.FacilityMapper;
import co.team.apt.facility.service.FacilityService;

@Service
public class FacilityServiceImpl implements FacilityService {
	
	@Autowired
	private FacilityMapper dao;
	
	@Override
	public int insertLibrary(FacilityVo vo) {
		// TODO Auto-generated method stub
		return dao.insertLibrary(vo);
	}

	@Override
	public List<FacilityVo> getSeat() {
		// TODO Auto-generated method stub
		return dao.allList();
	}

	@Override
	public int insertFitness(FacilityVo vo) {
		// TODO Auto-generated method stub
		return dao.insertFitness(vo);
	}

	@Override
	public FacilityVo getLibrary(ResidentVo vo) {
		// TODO Auto-generated method stub
		return dao.getLibrary(vo);
	}

	@Override
	public FacilityVo getFitness(ResidentVo vo) {
		// TODO Auto-generated method stub
		return dao.getFitness(vo);
	}



}

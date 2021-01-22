package co.team.apt.facility.service;

import java.util.List;

import co.team.apt.common.vo.FacilityVo;

public interface FacilityService {
	public int insertLibrary(FacilityVo vo);
	public List<FacilityVo> getSeat();
	public int insertFitness(FacilityVo vo);
}

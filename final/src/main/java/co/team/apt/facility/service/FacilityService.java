package co.team.apt.facility.service;

import java.util.List;

import co.team.apt.common.vo.FacilityVo;
import co.team.apt.common.vo.ResidentVo;

public interface FacilityService {
	public int insertLibrary(FacilityVo vo);
	public List<FacilityVo> getSeat();
	public int insertFitness(FacilityVo vo);
	public FacilityVo getLibrary(ResidentVo vo);
	public FacilityVo getFitness(ResidentVo vo);
}

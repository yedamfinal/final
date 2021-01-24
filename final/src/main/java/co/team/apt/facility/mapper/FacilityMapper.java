package co.team.apt.facility.mapper;

import java.util.List;

import co.team.apt.common.vo.FacilityVo;
import co.team.apt.common.vo.ResidentVo;

public interface FacilityMapper {
	public int insertLibrary(FacilityVo vo);
	public int insertFitness(FacilityVo vo);
	public List<FacilityVo> allList();
	public FacilityVo getLibrary(ResidentVo vo);
	public FacilityVo getFitness(ResidentVo vo);
	
}

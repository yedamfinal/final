package co.team.apt.facility.mapper;

import java.util.List;

import co.team.apt.common.vo.FacilityVo;

public interface FacilityMapper {
	public int insertLibrary(FacilityVo vo);
	public int insertFitness(FacilityVo vo);
	public List<FacilityVo> allList();
}

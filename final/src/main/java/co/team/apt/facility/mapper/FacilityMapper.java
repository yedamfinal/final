package co.team.apt.facility.mapper;

import java.util.List;

import co.team.apt.common.vo.FacilityVo;
import co.team.apt.common.vo.ResidentVo;

public interface FacilityMapper {
	public int insertLibrary(FacilityVo vo);
	public List<FacilityVo> getSeat();
	public FacilityVo getLibrary(ResidentVo vo);
	public int cancelLibrary(FacilityVo vo);
	public List<FacilityVo> manageLibrary();
	public int deleteLibrary(FacilityVo vo);

}

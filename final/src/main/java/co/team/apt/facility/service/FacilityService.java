package co.team.apt.facility.service;

import java.util.List;

import co.team.apt.common.vo.FacilityVo;
import co.team.apt.common.vo.ResidentVo;

public interface FacilityService {
	public int insertFacility(FacilityVo vo);
	public FacilityVo getFacility(ResidentVo vo);
	public int cancelRequest(FacilityVo vo);
	public List<FacilityVo> manageLibrary(FacilityVo vo);
	public String getToken() throws Exception;
	public void cancel(FacilityVo vo) throws Exception;
	public int deleteLibrary(FacilityVo vo);
	public List<FacilityVo> getSeat(FacilityVo vo);
	public void deleteFacility();
	public int pagingCount(FacilityVo vo);
}

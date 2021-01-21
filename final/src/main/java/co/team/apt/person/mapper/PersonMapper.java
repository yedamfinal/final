package co.team.apt.person.mapper;


import co.team.apt.common.vo.ManagerVo;
import co.team.apt.common.vo.ResidentVo;

public interface PersonMapper {
	
	public ResidentVo loginCheck(ResidentVo vo);
	public ResidentVo loginResident(ResidentVo vo);
	public ManagerVo loginManager(ResidentVo vo);
	
}

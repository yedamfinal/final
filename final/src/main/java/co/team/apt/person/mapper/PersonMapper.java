package co.team.apt.person.mapper;


import co.team.apt.person.vo.ManagerVo;
import co.team.apt.person.vo.ResidentVo;

public interface PersonMapper {
	
	public ResidentVo loginCheck(ResidentVo vo);
	public ResidentVo loginResident(ResidentVo vo);
	public ManagerVo loginManager(ResidentVo vo);
	
}

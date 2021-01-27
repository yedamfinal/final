package co.team.apt.person.service;

import java.util.List;

import co.team.apt.common.vo.ManagerVo;
import co.team.apt.common.vo.ResidentVo;

public interface PersonService {
	public ResidentVo login(ResidentVo vo);
	public List<ManagerVo> managerList(ManagerVo vo);
	public void managerInsert(ManagerVo vo);
	public List<ResidentVo> residentList(ResidentVo vo);

	void resiRegister(ResidentVo vo);
	void maneregister(ManagerVo vo);
}

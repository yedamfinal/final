package co.team.apt.person.service;

import java.util.List;

import co.team.apt.person.vo.ManagerVo;
import co.team.apt.person.vo.Person;
import co.team.apt.person.vo.ResidentVo;

public interface PersonService {
	public Person login(ResidentVo vo);
	public List<ManagerVo> managerList(ManagerVo vo);
	public void managerInsert(ManagerVo vo);
	public List<ResidentVo> residentList(ResidentVo vo);
	public void residentInsert(ResidentVo vo);
}

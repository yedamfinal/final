package co.team.apt.person.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.team.apt.person.mapper.PersonMapper;
import co.team.apt.person.service.PersonService;
import co.team.apt.person.vo.ManagerVo;
import co.team.apt.person.vo.Person;
import co.team.apt.person.vo.ResidentVo;

@Service
public class PersonServiceImpl implements PersonService {
	
	@Autowired PersonMapper dao;
	
	//로그인
	@Override
	public Person login(ResidentVo vo) {
		ResidentVo resultvo=dao.loginCheck(vo);
		if(vo != null && vo.getId().equals(resultvo.getId())) {
			if(resultvo.getOwner().equals("세대주")||resultvo.getOwner().equals("세대원")) {
				return dao.loginResident(resultvo);
			}else {
				return dao.loginManager(resultvo);
			}
		}else {
			System.out.println("로그인 실패 하였습니다. 다시 시도 해주세요.");
		}
		return null;
	}

	@Override
	public List<ManagerVo> managerList(ManagerVo vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void managerInsert(ManagerVo vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<ResidentVo> residentList(ResidentVo vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void residentInsert(ResidentVo vo) {
		// TODO Auto-generated method stub

	}

}

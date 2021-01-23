package co.team.apt.person.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import co.team.apt.common.vo.ManagerVo;
import co.team.apt.common.vo.ResidentVo;
import co.team.apt.person.mapper.PersonMapper;
import co.team.apt.person.service.PersonService;



@Service
public class PersonServiceImpl implements PersonService {
	
	@Autowired PersonMapper dao;
	
	
	
	
	
	//로그인
	@Override
	public ResidentVo login(ResidentVo vo) {
		ResidentVo resultvo=dao.loginCheck(vo);
		if(resultvo != null && resultvo.getType().equals("r")) {
				return dao.loginResident(resultvo);
		}else {
			return resultvo;
		}
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
	public void resiRegister(ResidentVo vo) {
		// TODO Auto-generated method stub
		dao.register(vo);
	}



	@Override
	public void maneregister(ManagerVo vo) {
		// TODO Auto-generated method stub
		dao.mregister(vo);
	}

}

package co.team.apt.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.team.apt.emp.EmpVO;
import co.team.apt.emp.service.EmpService;
import co.team.apt.mapper.EmpMapper;


@Service
public class EmpServiceImpl implements EmpService {

	@Autowired EmpMapper empDAO;
	
	@Override
	public EmpVO getEmp(EmpVO empVO) {
		return empDAO.getEmp(empVO);
	}

	@Override
	public List<EmpVO> getEmpList(EmpVO empVO) {
		return empDAO.getEmpList();
	}

	@Override
	public void empInsert(EmpVO empVO) {
		//empDAO.insertEmp(empVO);
	}

}

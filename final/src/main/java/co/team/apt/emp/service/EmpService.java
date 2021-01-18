package co.team.apt.emp.service;

import java.util.List;

import org.springframework.stereotype.Service;

import co.team.apt.emp.EmpVO;


public interface EmpService {

	public EmpVO getEmp(EmpVO empVO);
	public List<EmpVO> getEmpList(EmpVO empVO);
	public void empInsert(EmpVO empVO);
	
}

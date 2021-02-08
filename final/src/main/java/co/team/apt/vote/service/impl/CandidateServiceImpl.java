package co.team.apt.vote.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.team.apt.common.vo.CandidateVo;
import co.team.apt.common.vo.ResidentVo;
import co.team.apt.vote.mapper.CandidateMapper;
import co.team.apt.vote.service.CandidateService;


@Service("candidateService")
public class CandidateServiceImpl implements CandidateService {
	
	@Autowired
	private CandidateMapper dao;

	@Override
	public List<CandidateVo> candidateList(CandidateVo vo) {
		// TODO Auto-generated method stub
		return dao.candidateList(vo);
	}


	@Override
	public int candiInsert(CandidateVo vo) {
		// TODO Auto-generated method stub
		return dao.candiInsert(vo);
	}

	@Override
	public int candiUpdate(CandidateVo vo) {
		// TODO Auto-generated method stub
		return dao.candiUpdate(vo);
	}

	@Override
	public int candiDelete(CandidateVo vo) {
		// TODO Auto-generated method stub
		return dao.candiDelete(vo);
		
	}


	@Override
	public CandidateVo selectName(CandidateVo vo) {
		// TODO Auto-generated method stub
		return dao.selectName(vo);
	}


	@Override
	public CandidateVo candiProfile(CandidateVo vo) {
		// TODO Auto-generated method stub
		return dao.candiProfile(vo);
	}




	

}

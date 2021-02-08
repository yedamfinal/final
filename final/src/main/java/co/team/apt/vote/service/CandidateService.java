package co.team.apt.vote.service;

import java.util.List;

import co.team.apt.common.vo.BoardVoteVo;
import co.team.apt.common.vo.CandidateVo;
import co.team.apt.common.vo.ResidentVo;

public interface CandidateService {
	List<CandidateVo> candidateList(CandidateVo vo);
	
	int candiInsert(CandidateVo vo);
	int candiUpdate(CandidateVo vo);
	int candiDelete(CandidateVo vo);

	CandidateVo selectName(CandidateVo vo);

	CandidateVo candiProfile(CandidateVo vo);
	
}

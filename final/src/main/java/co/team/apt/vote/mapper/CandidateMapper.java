package co.team.apt.vote.mapper;

import java.util.List;

import co.team.apt.common.vo.BoardVoteVo;
import co.team.apt.common.vo.CandidateVo;
import co.team.apt.common.vo.ResidentVo;

public interface CandidateMapper {
	List<CandidateVo> candidateList(CandidateVo vo);
	
	int candiInsert(CandidateVo vo);
	int candiUpdate(CandidateVo vo);
	int candiDelete(CandidateVo vo);

	CandidateVo selectName(CandidateVo vo);

	CandidateVo candiProfile(CandidateVo vo);
	
	
	
	
	

}

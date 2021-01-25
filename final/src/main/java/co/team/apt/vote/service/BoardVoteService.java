package co.team.apt.vote.service;

import java.util.List;

import co.team.apt.common.vo.BoardVoteVo;
import co.team.apt.common.vo.ResidentVo;

public interface BoardVoteService {
	List<BoardVoteVo> boardVoteList(BoardVoteVo vo);

	BoardVoteVo selectOne(BoardVoteVo vo);
	
	int voteInsert(BoardVoteVo vo);
	int voteUpdate(BoardVoteVo vo);
	int voteDelete(BoardVoteVo vo);
	
	ResidentVo searchName(ResidentVo vo);
}

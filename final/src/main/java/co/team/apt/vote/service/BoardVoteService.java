package co.team.apt.vote.service;

import java.util.List;

import co.team.apt.common.vo.BoardVoteVo;

public interface BoardVoteService {
	List<BoardVoteVo> boardVoteList(BoardVoteVo vo);
	BoardVoteVo selectOne(BoardVoteVo vo);
	
	int voteInsert(BoardVoteVo vo);
	int voteUpdate(BoardVoteVo vo);
	int voteDelete(BoardVoteVo vo);
}

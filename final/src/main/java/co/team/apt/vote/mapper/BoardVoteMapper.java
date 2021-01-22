package co.team.apt.vote.mapper;

import java.util.List;

import co.team.apt.common.vo.BoardVoteVo;

public interface BoardVoteMapper {
	List<BoardVoteVo> boardVoteList(BoardVoteVo vo);
	BoardVoteVo selectOne(BoardVoteVo vo);
	
	int voteInsert(BoardVoteVo vo);
	int voteUpdate(BoardVoteVo vo);
	int voteDelete(BoardVoteVo vo);
}


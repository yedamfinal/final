package co.team.apt.community.service;

import java.util.List;

import co.team.apt.common.vo.BoardVo;


public interface CommunityService {
	public List<BoardVo> boardList(BoardVo vo);
	public BoardVo boardOne(BoardVo vo);
	public int boardInsert(BoardVo vo);
	public int boardUpdate(BoardVo vo);
	public int boardDelete(BoardVo vo);
}

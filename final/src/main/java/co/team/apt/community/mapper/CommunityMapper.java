package co.team.apt.community.mapper;

import java.util.List;

import co.team.apt.community.vo.BoardVo;

public interface CommunityMapper {
	public List<BoardVo> boardList(BoardVo vo);
	public BoardVo boardOne(BoardVo vo);
	public int boardInsert(BoardVo vo);
	public int boardUpdate(BoardVo vo);
	public int boardDelete(BoardVo vo);
}

package co.team.apt.community.service;

import java.util.List;

import co.team.apt.common.vo.BcommentVo;
import co.team.apt.common.vo.BoardVo;


public interface CommunityService {
	public List<BoardVo> boardList(BoardVo vo);
	public BoardVo boardOne(BoardVo vo);
	public int boardInsert(BoardVo vo);
	public int boardUpdate(BoardVo vo);
	public int boardDelete(BoardVo vo);
	public int addComment(BcommentVo vo);
	public List<BcommentVo> commentList(BoardVo vo);
	public int commentDelete(BcommentVo vo);
	public int commentUpdate(BcommentVo vo);
	public int addReComment(BcommentVo vo);
}

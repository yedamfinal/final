package co.team.apt.community.mapper;

import java.util.List;

import co.team.apt.common.vo.BcommentVo;
import co.team.apt.common.vo.BoardVo;

public interface CommunityMapper {
	public List<BoardVo> boardList(BoardVo vo);
	public BoardVo boardOne(BoardVo vo);
	public int boardInsert(BoardVo vo);
	public int boardUpdate(BoardVo vo);
	public int boardDelete(BoardVo vo);
	public int pagingCount(BoardVo vo);
	public int addCommnet(BcommentVo vo);
	public List<BcommentVo> commentList(BoardVo vo);
	public int commentDelete(BcommentVo vo);
	public int commentUpdate(BcommentVo vo);
	public int addReComment(BcommentVo vo);
	public int addReCommentBefore(BcommentVo vo);
	public String getRereno(BcommentVo vo);
}

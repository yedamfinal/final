package co.team.apt.notice.mapper;

import java.util.List;

import co.team.apt.community.vo.BoardVo;

public interface NoticeMapper {
	public List<BoardVo> noticeList(BoardVo vo);
	public BoardVo noticeOne(BoardVo vo);
	public int noticeInsert(BoardVo vo);
	public int noticeUpdate(BoardVo vo);
	public int noticeDelete(BoardVo vo);
}

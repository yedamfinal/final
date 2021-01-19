package co.team.apt.notice.service;

import java.util.List;

import org.springframework.stereotype.Service;

import co.team.apt.community.vo.BoardVo;

@Service
public interface NoticeService {
	public List<BoardVo> noticeList(BoardVo vo);
	public BoardVo noticeOne(BoardVo vo);
	public int NoticeInsert(BoardVo vo);
	public int NoticeUpdate(BoardVo vo);
	public int NoticeDelete(BoardVo vo);
}

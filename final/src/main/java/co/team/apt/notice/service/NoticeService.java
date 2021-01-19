package co.team.apt.notice.service;

import java.util.List;

import org.springframework.stereotype.Service;

import co.team.apt.community.vo.BoardVo;

@Service
public interface NoticeService {
	public List<BoardVo> noticeList(BoardVo vo);	//목록
	public BoardVo noticeOne(BoardVo vo);	//한건 조회
	public int noticeInsert(BoardVo vo);
	public int noticeUpdate(BoardVo vo);
	public int noticeDelete(BoardVo vo);
}

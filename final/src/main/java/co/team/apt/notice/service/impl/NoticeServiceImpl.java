package co.team.apt.notice.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.team.apt.community.vo.BoardVo;
import co.team.apt.notice.mapper.NoticeMapper;
import co.team.apt.notice.service.NoticeService;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired NoticeMapper dao;

	@Override
	public List<BoardVo> noticeList(BoardVo vo) {
		// TODO Auto-generated method stub
		return dao.noticeList(vo);
	}

	@Override
	public BoardVo noticeOne(BoardVo vo) {
		// TODO Auto-generated method stub
		return dao.noticeOne(vo);
	}

	@Override
	public int noticeInsert(BoardVo vo) {
		// TODO Auto-generated method stub
		return dao.noticeInsert(vo);
	}

	@Override
	public int noticeUpdate(BoardVo vo) {
		// TODO Auto-generated method stub
		return dao.noticeUpdate(vo);
	}

	@Override
	public int noticeDelete(BoardVo vo) {
		// TODO Auto-generated method stub
		return dao.noticeDelete(vo);
	}
	
}

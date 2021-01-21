package co.team.apt.vote.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.team.apt.common.vo.BoardVoteVo;
import co.team.apt.vote.mapper.BoardVoteMapper;
import co.team.apt.vote.service.BoardVoteService;

@Service("boardVoteService")
public class BoardVoteServiceImpl implements BoardVoteService {
	@Autowired
	private BoardVoteMapper dao;
	
	@Override
	public List<BoardVoteVo> boardVoteList(BoardVoteVo vo) {
		// TODO Auto-generated method stub
		return dao.boardVoteList(vo);
	}

	@Override
	public BoardVoteVo selectOne(BoardVoteVo vo) {
		// TODO Auto-generated method stub
		return dao.selectOne(vo);
	}

	@Override
	public int voteInsert(BoardVoteVo vo) {
		// TODO Auto-generated method stub
		return dao.voteInsert(vo);
	}

	@Override
	public int voteUpdate(BoardVoteVo vo) {
		// TODO Auto-generated method stub
		return dao.voteUpdate(vo);
	}

	@Override
	public int voteDelete(BoardVoteVo vo) {
		// TODO Auto-generated method stub
		return dao.voteDelete(vo);
	}

}

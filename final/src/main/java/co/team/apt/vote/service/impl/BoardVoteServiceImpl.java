package co.team.apt.vote.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.team.apt.common.vo.BoardVoteVo;
import co.team.apt.vote.mapper.VoteMapper;
import co.team.apt.vote.service.BoardVoteService;

@Service("VoteService")
public class BoardVoteServiceImpl implements BoardVoteService {
	
	@Autowired
	private VoteMapper dao;

	
	public List<BoardVoteVo> voteList(BoardVoteVo vo) {
		// TODO Auto-generated method stub
		return dao.voteList(vo);
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

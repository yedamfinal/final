package co.team.apt.community.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.team.apt.common.vo.BcommentVo;
import co.team.apt.common.vo.BoardVo;
import co.team.apt.community.mapper.CommunityMapper;
import co.team.apt.community.service.CommunityService;

@Service
public class communityServiceImpl implements CommunityService {

	@Autowired CommunityMapper dao;
	
	@Override
	public List<BoardVo> boardList(BoardVo vo) {
		// TODO Auto-generated method stub
		return dao.boardList(vo);
	}

	@Override
	public BoardVo boardOne(BoardVo vo) {
		// TODO Auto-generated method stub
		return dao.boardOne(vo);
	}

	@Override
	public int boardInsert(BoardVo vo) {
		// TODO Auto-generated method stub
		return dao.boardInsert(vo);
	}

	@Override
	public int boardUpdate(BoardVo vo) {
		// TODO Auto-generated method stub
		return dao.boardUpdate(vo);
	}

	@Override
	public int boardDelete(BoardVo vo) {
		// TODO Auto-generated method stub
		return dao.boardDelete(vo);
	}

	@Override
	public int addComment(BcommentVo vo) {
		// TODO Auto-generated method stub
		return dao.addCommnet(vo);
	}

	@Override
	public List<BcommentVo> commentList(BoardVo vo) {
		// TODO Auto-generated method stub
		return dao.commentList(vo);
	}

	@Override
	public int commentDelete(BcommentVo vo) {
		// TODO Auto-generated method stub
		return dao.commentDelete(vo);
	}

	@Override
	public int commentUpdate(BcommentVo vo) {
		// TODO Auto-generated method stub
		return dao.commentUpdate(vo);
	}

}

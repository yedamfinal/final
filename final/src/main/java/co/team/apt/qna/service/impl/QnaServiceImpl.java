package co.team.apt.qna.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.team.apt.common.vo.QnaVo;
import co.team.apt.qna.mapper.QnaMapper;
import co.team.apt.qna.service.QnaService;

@Service
public class QnaServiceImpl implements QnaService{

	@Autowired QnaMapper dao;

	@Override
	public List<QnaVo> qnaList(QnaVo vo) {
		// TODO Auto-generated method stub
		return dao.qnaList(vo);
	}

	@Override
	public QnaVo qnaOne(QnaVo vo) {
		// TODO Auto-generated method stub
		return dao.qnaOne(vo);
	}

	@Override
	public int qnaInsert(QnaVo vo) {
		// TODO Auto-generated method stub
		return dao.qnaInsert(vo);
	}

	@Override
	public int qnaUpdate(QnaVo vo) {
		// TODO Auto-generated method stub
		return dao.qnaUpdate(vo);
	}

	@Override
	public int qnaDelete(QnaVo vo) {
		// TODO Auto-generated method stub
		return dao.qnaDelete(vo);
	}
	@Override
	public int replyInsert(QnaVo vo) {
		dao.replyLayerUpdate(vo);
		return dao.replyInsert(vo);
	}

	@Override
	public int replyUpdate(QnaVo vo) {
		// TODO Auto-generated method stub
		return dao.replyUpdate(vo);
	}

	@Override
	public int replyDelete(QnaVo vo) {
		// TODO Auto-generated method stub
		return dao.replyDelete(vo);
	}
	
	
}

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
		return null;
	}

	@Override
	public QnaVo qnaOne(QnaVo vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int qnaInsert(QnaVo vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int qnaUpdate(QnaVo vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int qnaDelete(QnaVo vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	
}

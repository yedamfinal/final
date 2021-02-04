package co.team.apt.qna.service;

import java.util.List;

import org.springframework.stereotype.Service;

import co.team.apt.common.vo.QnaVo;

@Service
public interface QnaService {
	public List<QnaVo> qnaList(QnaVo vo);	//목록
	public QnaVo qnaOne(QnaVo vo);	//한건 조회
	public int qnaInsert(QnaVo vo);
	public int qnaUpdate(QnaVo vo);
	public int qnaDelete(QnaVo vo);
	public int replyInsert(QnaVo vo);
	public int replyUpdate(QnaVo vo);
	public int replyDelete(QnaVo vo);
}

package co.team.apt.qna.mapper;

import java.util.List;

import co.team.apt.common.vo.QnaVo;

public interface QnaMapper {
	public List<QnaVo> qnaList(QnaVo vo);
	public QnaVo qnaOne(QnaVo vo);
	public int qnaInsert(QnaVo vo);
	public int qnaUpdate(QnaVo vo);
	public int qnaDelete(QnaVo vo);
	public int pagingCount(QnaVo vo);
	public int replyInsert(QnaVo vo);
	public int replyUpdate(QnaVo vo);
	public int replyDelete(QnaVo vo);
}

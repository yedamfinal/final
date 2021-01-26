package co.team.apt.comment.service;

import java.util.List;

import co.team.apt.common.vo.BcommentVo;

public interface CommentService {
	//댓글 조회
	public List<BcommentVo> list(int bno) throws Exception;
	//댓글 입력
	public void write(BcommentVo vo);
	//댓글 수정
	public void modify(BcommentVo vo);
	//댓글 삭제
	public void delete(BcommentVo vo);
}

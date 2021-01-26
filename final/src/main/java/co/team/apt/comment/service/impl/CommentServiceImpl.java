/*
 * package co.team.apt.comment.service.impl;
 * 
 * import java.util.List;
 * 
 * import javax.inject.Inject;
 * 
 * import org.apache.ibatis.session.SqlSession; import
 * org.springframework.stereotype.Service;
 * 
 * import co.team.apt.comment.mapper.CommentMapper; import
 * co.team.apt.common.vo.BcommentVo;
 * 
 * @Service public class CommentServiceImpl implements CommentMapper {
 * 
 * @Inject private ReplyDAO dao;
 * 
 * // 댓글 조회
 * 
 * @Override public List<ReplyVO> list(int bno) throws Exception { return
 * dao.list(bno); }
 * 
 * @Override public void write(ReplyVO vo) throws Exception { dao.write(vo); }
 * 
 * @Override public void modify(ReplyVO vo) throws Exception { dao.modify(vo); }
 * 
 * @Override public void delete(ReplyVO vo) throws Exception { dao.delete(vo); }
 * 
 * }
 */
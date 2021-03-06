package co.team.apt.esey.service;

import java.util.List;

import org.springframework.stereotype.Service;

import co.team.apt.common.vo.PostBoxVo;

@Service
public interface PostBoxService {
	
	public List<PostBoxVo> postBoxList(PostBoxVo vo);
	public int mPostBoxInsert(PostBoxVo vo);
	PostBoxVo selectOne(PostBoxVo vo);
	public List<PostBoxVo> mPostBox(PostBoxVo vo);
	public int mPostBoxUpdate(PostBoxVo vo);
	public int mPostBoxDelete(PostBoxVo vo);
	public int mafter(PostBoxVo vo);
	public int mbefore(PostBoxVo vo);
}

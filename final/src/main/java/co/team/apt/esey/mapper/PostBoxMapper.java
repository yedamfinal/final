package co.team.apt.esey.mapper;

import java.util.List;

import co.team.apt.common.vo.PostBoxVo;

public interface PostBoxMapper {
	
	public List<PostBoxVo> postBoxList(PostBoxVo vo);
	public int mPostBoxInsert(PostBoxVo vo); 
	PostBoxVo selectOne(PostBoxVo vo);
	public List<PostBoxVo> mPostBox(PostBoxVo vo);

}

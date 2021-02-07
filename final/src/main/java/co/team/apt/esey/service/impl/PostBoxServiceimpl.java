package co.team.apt.esey.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.team.apt.common.vo.PostBoxVo;
import co.team.apt.esey.mapper.PostBoxMapper;
import co.team.apt.esey.service.PostBoxService;

@Service
public class PostBoxServiceimpl implements PostBoxService {
	
	@Autowired
	PostBoxMapper dao;
	
	public List<PostBoxVo> postBoxList(PostBoxVo vo){
	return dao.postBoxList(vo);
}

	@Override
	public int mPostBoxInsert(PostBoxVo vo) {
		// TODO Auto-generated method stub
		return dao.mPostBoxInsert(vo);
	}

	@Override
	public PostBoxVo selectOne(PostBoxVo vo) {
		// TODO Auto-generated method stub
		return dao.selectOne(vo);
	}

	@Override
	public List<PostBoxVo> mPostBox(PostBoxVo vo) {
		// TODO Auto-generated method stub
		return dao.mPostBox(vo);
	}

	@Override
	public int mPostBoxUpdate(PostBoxVo vo) {
		// TODO Auto-generated method stub
		return dao.mPostBoxUpdate(vo);
	}

	@Override
	public int mPostBoxDelete(PostBoxVo vo) {
		// TODO Auto-generated method stub
		return dao.mPostBoxDelete(vo);
	}

	@Override
	public int mafter(PostBoxVo vo) {
		// TODO Auto-generated method stub
		return dao.mafter(vo);
	}

	@Override
	public int mbefore(PostBoxVo vo) {
		// TODO Auto-generated method stub
		return dao.mbefore(vo);
	}

}

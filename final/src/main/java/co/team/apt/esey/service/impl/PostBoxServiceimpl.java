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

}

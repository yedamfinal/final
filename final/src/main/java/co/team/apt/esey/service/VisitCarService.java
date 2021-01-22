package co.team.apt.esey.service;


import java.util.List;

import co.team.apt.common.vo.VisitCarVo;


public interface VisitCarService {
		
	public List<VisitCarVo> visitList(VisitCarVo vo);
	public int visitCarInsert(VisitCarVo vo);
	
		
}

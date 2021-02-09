package co.team.apt.esey.service;


import java.util.List;

import co.team.apt.common.vo.VisitCarVo;


public interface VisitCarService {
		
	public List<VisitCarVo> visitList(VisitCarVo vo);
	public int visitCarInsert(VisitCarVo vo);
	VisitCarVo selectOne(VisitCarVo vo);
	public int visitCarDelect(VisitCarVo vo);
	public int visitCarUpdate(VisitCarVo vo);
	public List<VisitCarVo> mVisitList(VisitCarVo vo);
	public int ming(VisitCarVo vo);
	public int ref(VisitCarVo vo);
	public int cpl(VisitCarVo vo);
		
}

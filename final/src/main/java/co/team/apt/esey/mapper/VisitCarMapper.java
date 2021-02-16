package co.team.apt.esey.mapper;

import java.util.List;

import co.team.apt.common.vo.PostBoxVo;
import co.team.apt.common.vo.VisitCarVo;

public interface VisitCarMapper {
	
	public List<VisitCarVo> visitList(VisitCarVo vo);
	public int visitCarInsert(VisitCarVo vo);
	VisitCarVo selectOne(VisitCarVo vo);
	public int visitCarDelect(VisitCarVo vo);
	public int visitCarUpdate(VisitCarVo vo);
	public List<VisitCarVo> mVisitList(VisitCarVo vo);
	public int ming(VisitCarVo vo);
	public int ref(VisitCarVo vo);
	public int cpl(VisitCarVo vo);
	public void terVisitcar();
	//입주자 차량조회 등록 
	

}

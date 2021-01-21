package co.team.apt.esey.mapper;

import java.util.List;

import co.team.apt.common.vo.VisitCarVo;

public interface VisitCarMapper {
	
	public List<VisitCarVo> visitList(VisitCarVo vo);
	public String visitCarInsert(VisitCarVo vo);

}
 
package co.team.apt.esey.mapper;

import java.util.List;

import co.team.apt.common.vo.CarVo;
import co.team.apt.common.vo.VisitCarVo;

public interface VisitCarMapper {
	
	public List<VisitCarVo> visitList(VisitCarVo vo);
	public int visitCarInsert(VisitCarVo vo);
	//입주자 차량조회 등록 
	

}

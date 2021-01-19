package co.team.apt.esey.service;

import java.util.List;

import org.springframework.stereotype.Service;


import co.team.apt.esey.vo.VisitCarVo;

@Service
public interface VisitCarService {
		
		public VisitCarVo visitCar(VisitCarVo vo);
		public void visitCarInsert(VisitCarVo vo);
		public void visitCarUpdate(VisitCarVo vo);
		
}

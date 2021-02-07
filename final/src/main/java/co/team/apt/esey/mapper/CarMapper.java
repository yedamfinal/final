package co.team.apt.esey.mapper;

import java.util.List;

import co.team.apt.common.vo.CarVo;

public interface CarMapper {
	
		public List<CarVo> carList(CarVo vo); 
		public int carInsert(CarVo vo);
		CarVo selectOne(CarVo vo);
		public int cerror(CarVo vo);
		public int carDelete(CarVo vo);
		public int carUpdate(CarVo vo);
}

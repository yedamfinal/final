package co.team.apt.esey.service;


import java.util.List;

import co.team.apt.common.vo.CarVo;



public interface CarService {
		
	public List<CarVo> carList(CarVo vo);
	public int carInsert(CarVo vo);
	CarVo selectOne(CarVo vo);
	public int cerror(CarVo vo);
	public int carDelete(CarVo vo);
	public int carUpdate(CarVo vo);
	public List<CarVo> mCarList(CarVo vo);
	public int cming(CarVo vo);
	public int cref(CarVo vo);
	public int ccpl(CarVo vo);
		
}

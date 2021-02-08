package co.team.apt.esey.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.team.apt.common.vo.CarVo;
import co.team.apt.esey.mapper.CarMapper;
import co.team.apt.esey.service.CarService;

@Service
public class CarServiceimpl implements CarService {
	@Autowired CarMapper dao;

	@Override
	public List<CarVo> carList(CarVo vo) {
		// TODO Auto-generated method stub
		return dao.carList(vo);
	}

	@Override
	public int carInsert(CarVo vo) {
		// TODO Auto-generated method stub
		return dao.carInsert(vo);
	}

	@Override
	public CarVo selectOne(CarVo vo) {
		// TODO Auto-generated method stub
		return dao.selectOne(vo);
	}

	@Override
	public int cerror(CarVo vo) {
		// TODO Auto-generated method stub
		return dao.cerror(vo);
	}

	@Override
	public int carDelete(CarVo vo) {
		// TODO Auto-generated method stub
		return dao.carDelete(vo);
	}

	@Override
	public int carUpdate(CarVo vo) {
		// TODO Auto-generated method stub
		return dao.carUpdate(vo);
	}

	@Override
	public List<CarVo> mCarList(CarVo vo) {
		// TODO Auto-generated method stub
		return dao.mCarList(vo);
	}


}


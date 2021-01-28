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


}

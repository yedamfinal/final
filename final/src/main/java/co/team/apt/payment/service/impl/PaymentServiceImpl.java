package co.team.apt.payment.service.impl;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import co.team.apt.common.vo.PaymentVo;
import co.team.apt.common.vo.ResidentVo;
import co.team.apt.payment.mapper.PaymentMapper;
import co.team.apt.payment.service.PaymentService;

@Service
public class PaymentServiceImpl implements PaymentService{
	
	@Autowired
	PaymentMapper dao;
	
	@Override
	public int payInsert(PaymentVo vo) {
		// TODO Auto-generated method stub
		int n = dao.insertPayment(vo);
		if(n!=0)
			n = dao.insertPayPublic(vo);
		return n;
	}

	@Override
	public List<PaymentVo> payRead(PaymentVo vo) {
		
		SimpleDateFormat format = new SimpleDateFormat ("yy-MM");
		String format_time = format.format (System.currentTimeMillis());
		vo.setPayMonth(format_time);		
		        				 		
		List<PaymentVo> list =dao.payTotal(vo);
		
		return list;
	}

	@Override
	public String getOwner(ResidentVo resiVo) {
		// TODO Auto-generated method stub
		return dao.getOwner(resiVo);
	}
	

}

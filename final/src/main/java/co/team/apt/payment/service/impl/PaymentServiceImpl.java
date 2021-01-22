package co.team.apt.payment.service.impl;

import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.team.apt.common.vo.PaymentVo;
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
	public PaymentVo payRead(PaymentVo vo) {
		
		SimpleDateFormat format = new SimpleDateFormat ("yy-MM");
		String format_time = format.format (System.currentTimeMillis());
		vo.setPayMonth(format_time);		
		        				 		
		vo=dao.payTotal(vo);
		
		return vo;
	}

}

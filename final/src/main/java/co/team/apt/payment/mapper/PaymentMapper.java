package co.team.apt.payment.mapper;

import co.team.apt.payment.vo.PaymentVo;

public interface PaymentMapper {
	public int insertPayment(PaymentVo vo);
	public int insertPayPublic(PaymentVo vo);
}

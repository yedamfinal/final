package co.team.apt.payment.service;

import co.team.apt.common.vo.PaymentVo;

public interface PaymentService {
	public int payInsert(PaymentVo vo);
	public PaymentVo payRead(PaymentVo vo);
}

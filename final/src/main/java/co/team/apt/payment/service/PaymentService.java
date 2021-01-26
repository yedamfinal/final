package co.team.apt.payment.service;

import co.team.apt.common.vo.PaymentVo;
import co.team.apt.common.vo.ResidentVo;

public interface PaymentService {
	public int payInsert(PaymentVo vo);
	public PaymentVo payRead(PaymentVo vo);
	public String getOwner(ResidentVo resiVo);
}

package co.team.apt.payment.service;

import java.util.List;

import co.team.apt.common.vo.PaymentVo;
import co.team.apt.common.vo.ResidentVo;

public interface PaymentService {
	public int payInsert(PaymentVo vo);
	public List<PaymentVo> payRead(PaymentVo vo);
	public String getOwner(ResidentVo resiVo);
}

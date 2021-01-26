package co.team.apt.payment.mapper;

import co.team.apt.common.vo.PaymentVo;
import co.team.apt.common.vo.ResidentVo;

public interface PaymentMapper {
	public int insertPayment(PaymentVo vo);
	public int insertPayPublic(PaymentVo vo);
	public PaymentVo payTotal(PaymentVo vo);
	public String getOwner(ResidentVo resiVo);
}

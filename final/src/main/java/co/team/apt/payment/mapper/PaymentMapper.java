package co.team.apt.payment.mapper;

import java.util.List;

import co.team.apt.common.vo.CardInfo;
import co.team.apt.common.vo.PaymentVo;
import co.team.apt.common.vo.ResidentVo;

public interface PaymentMapper {
	public int insertPayment(PaymentVo vo);
	public int insertPayPublic(PaymentVo vo);
	public List<PaymentVo> payTotal(PaymentVo vo);
	public String getOwner(ResidentVo resiVo);
	public int payOneSuccess(PaymentVo vo);
	public int autoPay(CardInfo vo);
}

package co.team.apt.payment.service;

import java.util.List;

import co.team.apt.common.vo.CardInfo;
import co.team.apt.common.vo.FacilityVo;
import co.team.apt.common.vo.PaymentVo;
import co.team.apt.common.vo.ResidentVo;

public interface PaymentService {
	public int payInsert(PaymentVo vo);
	public List<PaymentVo> payRead(PaymentVo vo);
	public String getOwner(ResidentVo resiVo);
	public String getToken() throws Exception;
	public void getbillingKey(CardInfo vo) throws Exception;
	public void againPayment(CardInfo vo) throws Exception;
	public int payOneSuccess(PaymentVo vo);
	public int autoPay(CardInfo vo);
}

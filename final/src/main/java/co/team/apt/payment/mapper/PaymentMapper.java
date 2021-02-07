package co.team.apt.payment.mapper;

import java.util.List;
import java.util.Map;

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
	public List<Map<String, Object>> payExcel(PaymentVo vo);
	public List<PaymentVo> monthList(PaymentVo vo);
	public PaymentVo payComparison(PaymentVo vo);
	public void payDelay();
	public List<PaymentVo> managerList();
	public void insertPayment(Map<String, Object> map);
	public void insertPayPublic(Map<String, Object> map);
}

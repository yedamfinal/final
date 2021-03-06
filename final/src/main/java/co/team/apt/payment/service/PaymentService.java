package co.team.apt.payment.service;

import java.io.File;
import java.util.List;
import java.util.Map;

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
	public String againPayment(CardInfo vo) throws Exception;
	public int payOneSuccess(PaymentVo vo);
	public int autoPay(CardInfo vo);
	public List<Map<String, Object>> payExcel(PaymentVo vo);
	public List<PaymentVo> monthList(PaymentVo vo);
	public PaymentVo payComparison(PaymentVo vo);
	public void payDelay();
	public List<PaymentVo> managerList(PaymentVo vo);
	public List<?> getExcelUpload(File file);
	public List<PaymentVo> detailList(PaymentVo vo);
	public int pagingCount(PaymentVo vo);
}

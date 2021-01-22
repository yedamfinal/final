package co.team.apt.payment.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.team.apt.common.vo.PaymentVo;
import co.team.apt.payment.service.PaymentService;

@Controller
public class PaymentController {

	@Autowired
	PaymentService paymentService;
	
	@RequestMapping("payRead.do")
	public String payRead(Model model, PaymentVo vo) {
		
		vo = paymentService.payRead(vo);
		
		model.addAttribute("pay",vo);
		
		return "payment/read";
	}
	
	@RequestMapping("payInsertForm.do")
	public String payRead(Model model) {
		return "payment/insertForm";
	}
	
	@RequestMapping("payInsert.do")
	public String payInsert(Model model, PaymentVo vo) {
		
		paymentService.payInsert(vo);
		
		return "payment/test";
	}
	
	@RequestMapping("payTotal.do")
	public String payTotal(Model model, PaymentVo vo) {
		
		return "";
	}
}

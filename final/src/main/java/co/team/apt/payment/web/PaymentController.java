package co.team.apt.payment.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.team.apt.payment.service.PaymentService;
import co.team.apt.payment.vo.paymentVo;

@Controller
public class PaymentController {

//	@Autowired
//	PaymentService paymentService;
	
	@RequestMapping("payRead.do")
	public String payRead(Model model, paymentVo vo) {
		return "payment/read";
	}
}

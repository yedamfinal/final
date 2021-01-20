package co.team.apt.payment.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.team.apt.payment.vo.PaymentVo;

@Controller
public class PaymentController {

//	@Autowired
//	PaymentService paymentService;
	
	@RequestMapping("payRead.do")
	public String payRead(Model model, PaymentVo vo) {
		return "payment/read";
	}
}

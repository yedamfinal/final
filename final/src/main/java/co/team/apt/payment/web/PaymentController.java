package co.team.apt.payment.web;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.team.apt.common.vo.CardInfo;
import co.team.apt.common.vo.PaymentVo;
import co.team.apt.common.vo.ResidentVo;
import co.team.apt.payment.service.PaymentService;

@Controller
public class PaymentController {

	@Autowired
	PaymentService paymentService;
	
	@RequestMapping("payRead.do")
	public String payRead(Model model, PaymentVo vo, HttpServletRequest request) throws JsonProcessingException {
		//권한별 페이지이동 시작
		HttpSession session =  request.getSession(false);
		ResidentVo resiVo = (ResidentVo) session.getAttribute("person");
		
		if(resiVo == null) { //로그인 안한상태
			return "home/needLogin";
		}else if(resiVo.getType().equals("m")){//관리자로 로그인
			return "";
		}else if(resiVo.getOwner().equals("owner")) {//세대주로 로그인
			vo.setId(resiVo.getId()); 
		}else {//기타(세대원) 등등
			vo.setId(paymentService.getOwner(resiVo)); //세대주 아이디 찾아서 담기
		}
		
		List<PaymentVo> list = paymentService.payRead(vo);
		
//		//vo -> json 파싱
//		ObjectMapper mapper = new ObjectMapper();
//		String pay = mapper.writeValueAsString(vo);
//		model.addAttribute("pay2",pay);
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		int total = 0;
		int tax = 0;
		int delay = 0;
		for(PaymentVo v : list) {
			total += Integer.parseInt(v.getCost());
			if(v.getStatus().equals("no")) {
				delay += Integer.parseInt(v.getCost());
				tax += Integer.parseInt(v.getDelayTax());
			}
		}
		
		map.put("total", total);
		map.put("delay", delay);
		map.put("tax", tax);
		model.addAttribute("payList",list);
		model.addAttribute("payMap",map);
		
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
	
	@RequestMapping("payOneSuccess.do")
	public String payTotal(PaymentVo vo) {
		int n = paymentService.payOneSuccess(vo);
		
		return "redirect:payRead.do";
	}
	
	@RequestMapping("autoPay.do")
	public String autoPay(CardInfo vo) {
		
		int n = paymentService.autoPay(vo);
		return "redirect:payRead.do";
	}
	
	
}

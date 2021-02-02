package co.team.apt.payment.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
		List<PaymentVo> monthList = paymentService.monthList(vo);
		
		//vo -> json 파싱
//		ObjectMapper mapper = new ObjectMapper();
//		String pay = mapper.writeValueAsString(vo);
//		model.addAttribute("pay2",pay);
		HashMap<String, Object> map = new HashMap<String, Object>();
		
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
		map.put("id", vo.getId());
		map.put("monthList", monthList);
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
	
	//결제
	@RequestMapping("payOneSuccess.do")
	public String payTotal(PaymentVo vo) {
		int n = paymentService.payOneSuccess(vo);
		
		return "redirect:payRead.do";
	}
	
	//정기결제
	@RequestMapping("autoPay.do")
	public String autoPay(CardInfo vo) {
		
		int n = paymentService.autoPay(vo);
		
		return "redirect:payRead.do";
	}
	
	// 엑셀출력
	@RequestMapping("payExcelView.do")
	public ModelAndView excelView(PaymentVo vo, HttpServletResponse response) throws IOException {
		List<Map<String, Object>> list = paymentService.payExcel(vo);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String[] header = { "납입액", 
							"납입날짜", 
							"월", 
							"연체료",
							"난방",
							"수도세",
							"급탕비",
							"전기세",
							"기타",
							"일반관리비",
							"청소비",
							"경비비",
							"소독비",
							"승강기사용료",
							"공용전기세",
							"공용수도세",
							"수선유지비",
							"장기수선 충당금",
							"대표회의 운영비"};
		map.put("headers", header);
		map.put("filename", "excel_dept");
		map.put("datas", list);
		return new ModelAndView("commonExcelView", map);
	}
	
	
	//전월비교 아작스
	@RequestMapping("payComparison.do")
	@ResponseBody
	public PaymentVo payComparison(PaymentVo vo) {
		vo = paymentService.payComparison(vo);
		return vo;
	}
}

package co.team.apt.payment.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;

import co.team.apt.common.vo.BoardVo;
import co.team.apt.common.vo.CardInfo;
import co.team.apt.common.vo.Paging;
import co.team.apt.common.vo.PaymentVo;
import co.team.apt.common.vo.ResidentVo;
import co.team.apt.payment.service.PaymentService;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;

@Controller
public class PaymentController {

	@Autowired
	PaymentService paymentService;
	
	@RequestMapping("payRead.do")
	public String payRead(Model model, PaymentVo vo, Paging paging, HttpServletRequest request) throws JsonProcessingException {
		//권한별 페이지이동 시작
		HttpSession session =  request.getSession(false);
		ResidentVo resiVo = (ResidentVo) session.getAttribute("person");
		
		if(resiVo == null) { //로그인 안한상태
			return "home/needLogin";
		}else if(resiVo.getType().equals("m")){//관리자로 로그인
			//페이징처리
			paging.setPageUnit(10);
			paging.setPageSize(10);	//페이지넘버 자체를 지정
			// 페이지번호 파라미터
			if( paging.getPage() == null) {
				paging.setPage(1); 
			}		
			// 시작/마지막 레코드 번호
			vo.setStart(paging.getFirst());
			vo.setEnd(paging.getLast());		
			// 전체 건수
			paging.setTotalRecord(paymentService.pagingCount(vo));		//전체레코드건수


			model.addAttribute("paging", paging);
			
			List<PaymentVo> managerList = paymentService.managerList(vo);
			model.addAttribute("payList",managerList);
			model.addAttribute("payVo", vo);
			
			return "payment/payManager";
		}else if(resiVo.getOwner().equals("owner")) {//세대주로 로그인
			vo.setId(resiVo.getId()); 
		}else {//기타(세대원) 등등
			vo.setId(paymentService.getOwner(resiVo)); //세대주 아이디 찾아서 담기
		}
		
		List<PaymentVo> list = paymentService.payRead(vo);
		List<PaymentVo> monthList = paymentService.monthList(vo);
		List<PaymentVo> detailList = paymentService.detailList(vo);
		
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
		model.addAttribute("detailList",detailList);
		
		return "payment/read";
	}
	
	@RequestMapping("managerRead.do")
	public String managerRead(Model model, ResidentVo rvo ) {
		PaymentVo vo = new PaymentVo();
		vo.setId(paymentService.getOwner(rvo));
		
		List<PaymentVo> list = paymentService.payRead(vo);
		List<PaymentVo> monthList = paymentService.monthList(vo);
		List<PaymentVo> detailList = paymentService.detailList(vo);
		
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
		model.addAttribute("detailList",detailList);
		model.addAttribute("rvo", rvo);
		
		return "payment/read";
	}

//	@RequestMapping("payInsertForm.do")
//	public String payRead(Model model) {
//		return "payment/insertForm";
//	}
//	
//	@RequestMapping("payInsert.do")
//	public String payInsert(Model model, PaymentVo vo) {
//		
//		paymentService.payInsert(vo);
//		
//		return "payment/test";
//	}
//	
//	@RequestMapping("payTotal.do")
//	public String payTotal(Model model, PaymentVo vo) {
//		
//		return "";
//	}
	
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
		map.put("filename", "payment");
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
	
	// pdf출력
	@Autowired
	DataSource dataSourceSpied;
	
	@RequestMapping("paymentPdf.do" )
	public void report(HttpServletRequest request, HttpServletResponse response
			, @RequestParam(required=false) String id) throws Exception {
		Connection conn = dataSourceSpied.getConnection();
		
		request.setCharacterEncoding("UTF-8");
		
		
		
		// 소스 컴파일 jrxml -> jasper
		InputStream stream = getClass().getResourceAsStream("/pdf/payment.jrxml");
		JasperReport jasperReport = JasperCompileManager.compileReport(stream); // 파라미터 맵
		HashMap<String, Object> map = new HashMap<>();
		map.put("P_id", id);
		JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, map, conn);
		JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());
	}
	
	@RequestMapping("payExcelUpload.do")
	public String payExcelUpload(Model model, HttpServletRequest request,
			@RequestParam(required = false) MultipartFile excelFile) throws IllegalStateException, IOException {
		
		//첨부파일 처리
		String path = request.getSession()
							 .getServletContext()
							 .getRealPath("/resources/excelTest"); 
		if(excelFile != null && excelFile.getSize()>0) {
			File file = new File(path, excelFile.getOriginalFilename());
			excelFile.transferTo(file);
			
			/*
			 * FileInputStream aa = null; try { aa = new FileInputStream((File)excelFile); }
			 * catch (FileNotFoundException e) { System.out.println("이게뜨면 ㄴ안대 아아아아ㅏ아");
			 * throw new RuntimeException(e.getMessage(), e); }
			 */
			
			paymentService.getExcelUpload(file);
			
		}
		return "redirect:payRead.do";
	}
	
//	public void payExcelUpload2(HttpServletRequest request,
//			@RequestParam(required = false) MultipartFile uploadFile, HttpServletResponse rep) 
//					throws IllegalStateException, IOException {
//		
//		 
//        Map returnObject = new HashMap(); 
//        
//        try { // MultipartHttpServletRequest 생성 
//            MultipartHttpServletRequest mhsr = (MultipartHttpServletRequest) request; 
//            Iterator iter = mhsr.getFileNames(); 
//            MultipartFile mfile = null; 
//            String fieldName = ""; 
//            
//            // 값이 나올때까지
//            while (iter.hasNext()) { 
//                fieldName = iter.next().toString(); // 내용을 가져와서 
//                mfile = mhsr.getFile(fieldName); 
//                String origName; 
//                origName = new String(mfile.getOriginalFilename().getBytes("8859_1"), "UTF-8"); //한글꺠짐 방지 // 파일명이 없다면 
//                
//                returnObject.put("params", mhsr.getParameterMap()); 
//                
//                
//                //위치 및 파일
//                System.out.println(origName);
//                //paymentService.getExcelUpload("D:\\"+origName);
//            }
//            
//            } catch (UnsupportedEncodingException e) { // TODO Auto-generated catch block 
//                e.printStackTrace(); 
//            }catch (IllegalStateException e) { // TODO Auto-generated catch block 
//                e.printStackTrace(); 
//            } catch (IOException e) { // TODO Auto-generated catch block 
//                e.printStackTrace(); 
//            }
//       
//	}
}

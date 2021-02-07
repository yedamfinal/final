package co.team.apt.payment.service.impl;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.team.apt.common.service.CommonExcelUp;
import co.team.apt.common.vo.CardInfo;
import co.team.apt.common.vo.PaymentVo;
import co.team.apt.common.vo.ResidentVo;
import co.team.apt.payment.mapper.PaymentMapper;
import co.team.apt.payment.service.PaymentService;
import net.sf.json.JSONObject;

@Service
public class PaymentServiceImpl implements PaymentService{
	
	@Autowired
	PaymentMapper dao;
	
	@Override
	public int payInsert(PaymentVo vo) {
		// TODO Auto-generated method stub
		int n = dao.insertPayment(vo);
		if(n!=0)
			n = dao.insertPayPublic(vo);
		return n;
	}

	@Override
	public List<PaymentVo> payRead(PaymentVo vo) {
		
		SimpleDateFormat format = new SimpleDateFormat ("yy-MM");
		String format_time = format.format (System.currentTimeMillis());
		vo.setPayMonth(format_time);		
		        				 		
		List<PaymentVo> list =dao.payTotal(vo);
		
		return list;
	}

	@Override
	public String getOwner(ResidentVo resiVo) {
		// TODO Auto-generated method stub
		return dao.getOwner(resiVo);
	}

	@Override
	public String getToken() throws Exception {
		String strUrl = "https://api.iamport.kr/users/getToken";

		URL url = new URL(strUrl); // 호출할 url
		Map<String, Object> params = new LinkedHashMap<>(); // 파라미터 세팅
		params.put("imp_key", "2931481265928471");
		params.put("imp_secret", "0CfGz03QVo2mi9EVKCay3SFcEOnOYBPZe5FO5JF18InqR1mCDxaHqQT4EhTDTJC8OiWU2CVakiAcjWOX");

		StringBuilder postData = new StringBuilder();
		for (Map.Entry<String, Object> param : params.entrySet()) {
			if (postData.length() != 0)
				postData.append('&');
			postData.append(URLEncoder.encode(param.getKey(), "UTF-8"));
			postData.append('=');
			postData.append(URLEncoder.encode(String.valueOf(param.getValue()), "UTF-8"));
		}
		byte[] postDataBytes = postData.toString().getBytes("UTF-8");

		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("POST");
		// conn.setRequestProperty("Content-Type", "application/json"); //json으로 값넘기기
		conn.setDoOutput(true);
		conn.getOutputStream().write(postDataBytes); // POST 호출

		BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));

		String inputLine;
		String str = "";
		while ((inputLine = in.readLine()) != null) { // response 출력
			JSONObject obj = JSONObject.fromObject(inputLine);
			obj = obj.getJSONObject("response");
			str = obj.getString("access_token");
		}

		in.close();

		return str;
	}

	@Override
	public void getbillingKey(CardInfo vo) throws Exception {
		String strUrl = "https://api.iamport.kr/subscribe/customers/"+vo.getId();

		URL url = new URL(strUrl); // 호출할 url
		Map<String, Object> params = new LinkedHashMap<>(); // 파라미터 세팅

		params.put("card_number", vo.getCardNumber());//카드번호
		params.put("expiry", vo.getExpriy());//카드 ㅇ효기간
		params.put("birth", vo.getBirth());//생년월일
		params.put("pwd_2digit", vo.getPassword());//카드비밀번호 앞 두자리
		
		StringBuilder postData = new StringBuilder();
		for (Map.Entry<String, Object> param : params.entrySet()) {
			if (postData.length() != 0)
				postData.append('&');
			postData.append(URLEncoder.encode(param.getKey(), "UTF-8"));
			postData.append('=');
			postData.append(URLEncoder.encode(String.valueOf(param.getValue()), "UTF-8"));
		}
		byte[] postDataBytes = postData.toString().getBytes("UTF-8");

		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("POST");
		//conn.setRequestProperty("Content-Type", "application/json"); //json으로 값넘기기
		conn.setRequestProperty("Authorization", getToken());//test 1에서 받은 토큰
		conn.setDoOutput(true);
		conn.getOutputStream().write(postDataBytes); // POST 호출

		BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));

		String inputLine;
		String str = "";
		while ((inputLine = in.readLine()) != null) { // response 출력
			//리턴
		}
		in.close();
		
	}

	@Override
	public String againPayment(CardInfo vo) throws Exception {
		String strUrl = "https://api.iamport.kr/subscribe/payments/again";//test1
	
		String payno = Long.toString(System.currentTimeMillis());
		
		
		URL url = new URL(strUrl); // 호출할 url
		Map<String, Object> params = new LinkedHashMap<>(); // 파라미터 세팅
		params.put("customer_uid", vo.getId()); // 빌링키
		params.put("merchant_uid", payno); // 거래번호
		params.put("amount", vo.getCost()); // 가격
		params.put("name", vo.getPayMonth()+"월 관리비"); // 목적
		
		StringBuilder postData = new StringBuilder();
		for (Map.Entry<String, Object> param : params.entrySet()) {
			if (postData.length() != 0)
				postData.append('&');
			postData.append(URLEncoder.encode(param.getKey(), "UTF-8"));
			postData.append('=');
			postData.append(URLEncoder.encode(String.valueOf(param.getValue()), "UTF-8"));
		}
		byte[] postDataBytes = postData.toString().getBytes("UTF-8");

		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("POST");
		//conn.setRequestProperty("Content-Type", "application/json"); //json으로 값넘기기
		conn.setRequestProperty("Authorization", getToken());//test 1에서 받은 토큰
		conn.setDoOutput(true);
		conn.getOutputStream().write(postDataBytes); // POST 호출

		BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));

		String inputLine;
		String str = "";
		while ((inputLine = in.readLine()) != null) { // response 출력
			System.out.println(inputLine);
		}
		in.close();
	
		return payno;
	}

	@Override
	public int payOneSuccess(PaymentVo vo) {
		// TODO Auto-generated method stub
		return dao.payOneSuccess(vo);
	}

	@Override
	public int autoPay(CardInfo vo) {
		// TODO Auto-generated method stub
		//자동결제 빌링키 발급 및 결제
		PaymentVo payVo = new PaymentVo();
		payVo.setId(vo.getId());
		payVo.setCost(vo.getCost());

		SimpleDateFormat format = new SimpleDateFormat ("yy-MM");
		String format_time = format.format (System.currentTimeMillis());
		payVo.setPayMonth(format_time);	
		
		try {
			getbillingKey(vo);
			//빌링키 발급완료 db 상태저장
			List<PaymentVo> list = dao.payTotal(payVo);
			
			System.out.println(vo);
			System.out.println(payVo);
			System.out.println(list);
			if(list != null) {		
				payVo.setPayNo(againPayment(vo));
				dao.payOneSuccess(payVo);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		//자동결제 yes로 수정 및 결제정보 저장
		return dao.autoPay(vo);
	}

	@Override
	public List<Map<String, Object>> payExcel(PaymentVo vo) {
		// TODO Auto-generated method stub
		return dao.payExcel(vo);
	}

	@Override
	public List<PaymentVo> monthList(PaymentVo vo) {
		// TODO Auto-generated method stub
		return dao.monthList(vo);
	}

	@Override
	public PaymentVo payComparison(PaymentVo vo) {
		// TODO Auto-generated method stub
		return dao.payComparison(vo);
	}
	
	//매월1일 연체 처리
	@Override
	public void payDelay() {
		// TODO Auto-generated method stub
		dao.payDelay();
	}
	
	//매니저화면 리스트
	@Override
	public List<PaymentVo> managerList() {
		// TODO Auto-generated method stub
		return dao.managerList();
	}
	
	//엑셀 업로드
	@Override
	public List<?> getExcelUpload(File excelFile) {
		String[] payPublic={"nomal", "clean",	"guard", "disinfection", "elevator",	"pelectric", "pwater", "repair",	"lrepair",	"representative"};
		String[] payment={"dong", "ho", "heating", "water", "hatwater", "electric", "etc"};			

        Map<String, Object> publicMap = new HashMap<String, Object>();
        Map<String, Object> paymentMap = new HashMap<String, Object>();
        List<?> list = null;
        
        try {
//            Workbook wbs = WorkbookFactory.create(new FileInputStream(excelFile));
            Workbook wbs = CommonExcelUp.getWorkbook(excelFile);
            
            Sheet sheet = (Sheet) wbs.getSheetAt(0);
 
            System.out.println(excelFile);
            
            
            //관리비 공통사항 
            int publicRowNum = sheet.getFirstRowNum() + 1;
            Row row = sheet.getRow(publicRowNum);
            for (int i = 0; i < payPublic.length; i++) {
            	publicMap.put(payPublic[i], ""+CommonExcelUp.cellValue(row.getCell(i)));				
			}
                
                //신규삽입
                dao.insertPayPublic(publicMap);
                System.out.println(publicMap);
            
            //세대별 관리비
            for (int i = sheet.getFirstRowNum() + 3; i <= sheet.getLastRowNum(); i++) {
                
                row = sheet.getRow(i);
                
                for (int j = 0; j < payment.length; j++) {
                	paymentMap.put(payment[j], ""+CommonExcelUp.cellValue(row.getCell(j)));				
    			}
                
                //신규삽입
                dao.insertPayment(paymentMap);
                System.out.println(paymentMap);
            }
        
            //데이터가져옵니다.
            list = null;//dao.testDbList(map);
            
        }catch(Exception e){
            
        }
        
       
        return list;

	}

	
	

}

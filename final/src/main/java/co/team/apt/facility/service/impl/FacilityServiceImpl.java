package co.team.apt.facility.service.impl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.team.apt.common.vo.FacilityVo;
import co.team.apt.common.vo.ResidentVo;
import co.team.apt.facility.mapper.FacilityMapper;
import co.team.apt.facility.service.FacilityService;
import net.sf.json.JSONObject;

@Service
public class FacilityServiceImpl implements FacilityService {

	@Autowired
	private FacilityMapper dao;

	@Override
	public int insertFacility(FacilityVo vo) {
		// TODO Auto-generated method stub
		return dao.insertLibrary(vo);
	}

	@Override
	public FacilityVo getFacility(ResidentVo vo) {
		// TODO Auto-generated method stub
		return dao.getLibrary(vo);
	}

	@Override
	public int cancelRequest(FacilityVo vo) {
		// TODO Auto-generated method stub
		return dao.cancelLibrary(vo);
	}

	@Override
	public List<FacilityVo> manageLibrary() {
		// TODO Auto-generated method stub
		return dao.manageLibrary();
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
			System.out.println(inputLine);
			JSONObject obj = JSONObject.fromObject(inputLine);
			obj = obj.getJSONObject("response");
			str = obj.getString("access_token");
		}

		in.close();

		return str;
	}

	@Override
	public void cancel(FacilityVo vo) throws Exception {
		// 환불받기

		String strUrl = "https://api.iamport.kr/payments/cancel";

		URL url = new URL(strUrl); // 호출할 url
		Map<String, Object> params = new LinkedHashMap<>(); // 파라미터 세팅
		params.put("merchant_uid", vo.getPayNo());
		params.put("amount", vo.getCost());
		params.put("reason", "기타");

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
		conn.setRequestProperty("Authorization", getToken()); // 토큰값
		conn.setDoOutput(true);
		conn.getOutputStream().write(postDataBytes); // POST 호출

		BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));

		String inputLine;
		while ((inputLine = in.readLine()) != null) { // response 출력
			System.out.println(inputLine);
		}

		in.close();

	}

	@Override
	public int deleteLibrary(FacilityVo vo) {
		// TODO Auto-generated method stub
		return dao.deleteLibrary(vo);
	}

	@Override
	public List<FacilityVo> getSeat(FacilityVo vo) {
		// TODO Auto-generated method stub
		return dao.getSeat(vo);
	}

}

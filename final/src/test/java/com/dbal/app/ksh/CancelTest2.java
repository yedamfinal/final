package com.dbal.app.ksh;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.LinkedHashMap;
import java.util.Map;

import net.sf.json.JSONObject;

public class CancelTest2 {
	public static void main(String[] args) throws Exception{
		String strUrl = "https://api.iamport.kr/subscribe/customers/test1";

		URL url = new URL(strUrl); // 호출할 url
		Map<String, Object> params = new LinkedHashMap<>(); // 파라미터 세팅
//		params.put("imp_key", "2931481265928471");
//		params.put("imp_secret", "0CfGz03QVo2mi9EVKCay3SFcEOnOYBPZe5FO5JF18InqR1mCDxaHqQT4EhTDTJC8OiWU2CVakiAcjWOX");
		params.put("card_number", "6210-3178-4850-4859");//카드번호
		params.put("expiry", "2021-12");//카드 ㅇ효기간
		params.put("birth", "900207");//생년월일
		params.put("pwd_2digit", "31");//카드비밀번호 앞 두자리
		
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
		conn.setRequestProperty("Authorization", "2255d7d9fe6e1c19e2a6d659ab1742291cfb1bf7");//test 1에서 받은 토큰
		conn.setDoOutput(true);
		conn.getOutputStream().write(postDataBytes); // POST 호출

		BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));

		String inputLine;
		String str = "";
		while ((inputLine = in.readLine()) != null) { // response 출력
			System.out.println(inputLine);
//			System.out.println(URLDecoder.decode(inputLine));
//			for (int i = 0; i < inputLine.length(); i++) {
//	            System.out.print(String.format("U+%04X ", inputLine.codePointAt(i)));
//	        }
		}
		in.close();
	}
}

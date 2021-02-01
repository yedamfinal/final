package com.dbal.app.ksh;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.LinkedHashMap;
import java.util.Map;

import net.sf.json.JSONObject;

public class CancelTest3 {
	public static void main(String[] args) throws Exception{
		String strUrl = "https://api.iamport.kr/subscribe/payments/again";//test1

		URL url = new URL(strUrl); // 호출할 url
		Map<String, Object> params = new LinkedHashMap<>(); // 파라미터 세팅
//		params.put("imp_key", "2931481265928471");
//		params.put("imp_secret", "0CfGz03QVo2mi9EVKCay3SFcEOnOYBPZe5FO5JF18InqR1mCDxaHqQT4EhTDTJC8OiWU2CVakiAcjWOX");
		params.put("customer_uid", "test1");//카드번호
		params.put("merchant_uid", "test");//카드 ㅇ효기간
		params.put("amount", "1000");//생년월일
		params.put("name", "관리비");//카드비밀번호 앞 두자리
		
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
		conn.setRequestProperty("Authorization", "0a92cf9138570f8fdb31539e66108e846d2d5a7b");//test 1에서 받은 토큰
		conn.setDoOutput(true);
		conn.getOutputStream().write(postDataBytes); // POST 호출

		BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));

		String inputLine;
		String str = "";
		while ((inputLine = in.readLine()) != null) { // response 출력
			System.out.println(inputLine);
//			JSONObject obj = JSONObject.fromObject(inputLine);
//			obj = obj.getJSONObject("response");
//			str = obj.getString("access_token");
//			System.out.println(str);
		}
		in.close();
	}
}

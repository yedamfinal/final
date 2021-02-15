package co.team.apt.common.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class PaymentVo {
	private String payId; //
	private String cost; //납입총액
	private Date payDate; //납입날
	private String status; //연체상태
	private String id;//세대주
	private String payMonth; //납입달
	private String delayTax; //연체료
	private String payNo; // 결제번호
	//개인
	private String heating; //난방비
	private String water; 	//수도세
	private String hatWater;//급탕비
	private String electric;//전기세
	private String etc;		//기타
	//공용
	private String nomal;	//일반관리비
	private String clean;	//청소비
	private String guard;	//경비비
	private String disinfection;//소독비
	private String elevator;//승강기
	private String pElectric;//전기공용
	private String pWater;	//수도공용
	private String repair;	//수선유지비
	private String lRepair;	//장기수선충당금
	private String representative;	//입주자 대표회의 운영비
	private Integer people;	//세대수
	//개인정보(관리자페이지)
	private String dong; //동
	private String ho; //호수
	
	//엑셀업로드
	private String excelFile;
	
	//페이징
	private int start;//조회시작
	private int end;//조회끝
}

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
	private Date payMonth; //납입달
	private String delayTax; //연체료
	//개인
	private String heating;
	private String water;
	private String hatWater;
	private String electric;
	private String etc;
	//공용
	private String nomal;
	private String clean;
	private String guard;
	private String disinfection;
	private String elevator;
	private String pElectric;
	private String pWater;
	private String repair;
	private String lRepair;
	private String representative;
	private Integer people;
}

package co.team.apt.common.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ResidentVo {
	private String id;
	private String password;
	private String name;
	private String phone;
	private Date birth;
	private String owner;
	private String auth;
	private String dong;
	private String ho;
	private String del;
	private String type;
	
}

package co.team.apt.person.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ResidentVo implements Person{
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
}
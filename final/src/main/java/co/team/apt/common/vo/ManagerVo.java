package co.team.apt.common.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ManagerVo {
	private String id;
	private String password;
	private String name;
	private Date birth;
	private String king;
}

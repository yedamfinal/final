package co.team.apt.person.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ManagerVo implements Person{
	private String id;
	private String password;
	private String name;
	private Date birth;
	private String king;
}

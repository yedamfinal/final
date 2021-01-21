package co.team.apt.common.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class BcommentVo {
	private int reno;
	private String recontent;
	private Date redate;
	private String type;
	private int no;
	private String writer;
}

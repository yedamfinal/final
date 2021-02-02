package co.team.apt.common.vo;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class BcommentVo {
	private int reno;
	private String recontent;
	@JsonFormat(pattern = "yy/MM/dd")
	private Date redate;
	private int defno;
	private String writer;
}

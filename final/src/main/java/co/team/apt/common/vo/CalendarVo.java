package co.team.apt.common.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class CalendarVo {
	private int calendarno;
	private String caltitle;
	private String calcontent;
	private Date startdate;
	private Date enddate;	
	private String writer;
	
}

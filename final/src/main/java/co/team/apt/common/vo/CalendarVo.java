package co.team.apt.common.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class CalendarVo {
	private Integer calendarno;
	private String title;
	private String description;
	private Date start;
	private Date end;	
	private String username;
	private String backgroundColor;
	private String textColor;
	private String allDay;
}

package co.team.apt.common.vo;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class CalendarVo {
	private Integer calendarno;
	private String title;
	private String description;
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date start;
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date end;
	private String startDate;
	private String endDate;
	private String username;
	private String backgroundColor;
	private String textColor;
	private boolean allDay;
}

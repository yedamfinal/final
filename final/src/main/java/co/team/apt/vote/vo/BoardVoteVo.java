package co.team.apt.vote.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardVoteVo {
	private int seq;
	private String title;
	private Date startDate;
	private Date endDate;
}

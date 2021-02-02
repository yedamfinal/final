package co.team.apt.common.vo;

import java.sql.Date;

import lombok.Data;
@Data
public class QnaVo {
	private int qnano;
	private String name;
	private String content;
	private String writher;
	private Date qnadate;
	private int originno;
	private int groupord;
	private int grouplayer;
	
	private int start;//조회시작
	private int end;//조회끝
}

package co.team.apt.community.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardVo {
	private int defno;
	private String title;
	private String content;
	private String deffile;
	private Date defdate;
	private String state; //하자보수 게시판 처리상태
	private String wirter; //글쓴이
	private String type; //게시판종류
}

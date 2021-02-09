package co.team.apt.common.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class PostBoxVo {
	
	private int postNo;
	private String product;
	private String get;
	private Date getTime;
	private Date arriveDate;
	private String dong;
	private String ho;
	private String rn;
	private int start;
	private int end;
	private String search;//검색어
	private String searchType;//검색타입
	
	
	
	
	

}

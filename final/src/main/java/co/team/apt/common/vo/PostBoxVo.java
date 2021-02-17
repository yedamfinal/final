package co.team.apt.common.vo;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class PostBoxVo {
	
	private int postNo;
	private String product;
	private String get;
	 @JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date getTime;
	 @JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date arriveDate;
	private String dong;
	private String ho;
	private String rn;
	private int start;
	private int end;
	private String search;//검색어
	private String searchType;//검색타입
	
	
	
	
	

}

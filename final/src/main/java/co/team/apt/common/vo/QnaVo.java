package co.team.apt.common.vo;

import java.sql.Date;

import lombok.Data;
@Data
public class QnaVo {
	private int qnano;
	private String title;
	private String content;
	private String writer;
	private Date qnadate;
	private Integer originno;	//원글번호
    private Integer groupord;	//원글에 대한 순서
    private Integer grouplayer;	//답글계층
	//검색
	private String search;//검색어
	private String searchType;//검색타입
	private String all;
	
	private int start;//조회시작
	private int end;//조회끝
}

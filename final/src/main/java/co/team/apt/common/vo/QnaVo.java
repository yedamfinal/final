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
	private int family; //그룹번호
	private int depth;	//원글로부터 깊이
	private int indent;	//들여쓰기 수준
	private int parent;	//부모글
	//검색
	private String search;//검색어
	private String searchType;//검색타입
	private String all;
	
	private int start;//조회시작
	private int end;//조회끝
}

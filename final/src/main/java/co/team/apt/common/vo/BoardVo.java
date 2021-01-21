package co.team.apt.common.vo;

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
	private String writer; //글쓴이
	private String type; //게시판종류
	
	//페이징
//	private int page;//현재페이지
//	private int pageno;//한페이지 글숫자
	private int start;//조회시작
	private int end;//조회끝
//	private int last;//마지막글번호(마지막페이지)
//	private int pageBlock; //페이지 블럭숫자(보통10)
//	private int startPage; //페이지블럭 시작페이지
//	private int endPage; //페이지블럭 마지막페이지
//	
//	//검색
//	private String search;//검색어
//	private String searchType;//검색타입
}

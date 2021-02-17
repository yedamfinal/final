package co.team.apt.common.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class VisitCarVo {

   private String carNum;
   private String purpose;
   private Date startDate;
   private Date endDate;
   private String Id;
   private int visitNo;
   private String vcget;
   private String dong;
   private String ho;
   private int start;
   private int end;
   private String search;//검색어
   private String searchType;//검색타입
   private String cancel;
   
   
}
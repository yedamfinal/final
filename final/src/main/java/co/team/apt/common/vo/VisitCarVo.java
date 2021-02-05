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
   
}
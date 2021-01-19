package co.team.apt.esey.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class VisitCarVo {

   private String carnum;
   private String purpose;
   private Date startdate;
   private Date enddate;
   private String id;
   
}
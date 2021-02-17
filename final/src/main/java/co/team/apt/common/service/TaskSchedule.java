package co.team.apt.common.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import co.team.apt.esey.service.VisitCarService;
import co.team.apt.facility.service.FacilityService;
import co.team.apt.payment.service.PaymentService;

@Component
public class TaskSchedule {
	@Autowired
	FacilityService facilityService;
	@Autowired
	PaymentService paymentService;
	@Autowired
	VisitCarService visitCarService;
	
	//초 분 시 일 월 요일
	@Scheduled(cron = "1 0 0 22 * *")//둘다간격 delay 끝나는시간기준, rate 시작시간기준 
	//@Scheduled(cron = "0 45 11 * * *")
	public void payDelay() {
		//관리비 미납자 연체처리
		paymentService.payDelay();
	}
	
	@Scheduled(cron = "0 0 6 * * *")//둘다간격 delay 끝나는시간기준, rate 시작시간기준 
	//@Scheduled(cron = "0 45 11 * * *")
	public void deleteFacility() {
		//헬스장 독서실 기간종료자 삭제
		facilityService.deleteFacility();
	}
	
	
	@Scheduled(cron = "0 0 0 * * *")//둘다간격 delay 끝나는시간기준, rate 시작시간기준 
	//@Scheduled(cron = "0 45 11 * * *")
	public void deletevisitCar() {
		//헬스장 독서실 기간종료자 삭제
		visitCarService.deletevisitCar();
	}
	
	
//	//초 분 시 일 월 요일
//	@Scheduled(cron = "0/10 * * * * *")//둘다간격 delay 끝나는시간기준, rate 시작시간기준 
//	public void task1() {
//		System.out.println("task1");
//		//memberService.memberInsert(null); //필요한 서비스
//	}
//	
//	//밀리세컨드 단위 1/1000초
//	@Scheduled(fixedRate = 15*1000)//둘다간격 delay 끝나는시간기준, rate 시작시간기준 
//	public void task2() {
//		System.out.println("task2");
//		//memberService.memberInsert(null); //필요한 서비스
//	}
	
	
}

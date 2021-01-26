<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<style>
    .top{
        height: 200px;
    }
    .mid{
        height: 50px;
    	background-color: rgba(128, 128, 128, 0.26);
    }
    .bottom{
        height: 400px;
    }
    .center{
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .mon{
        width: 80px;
        height: 80px;
    }
    .card-group{
        width: 90%;
    }
    .mid2{
    	height: 80px;
    }
    
    
</style>
</head>
<body>
${pay }
<div class="container" >
    <div class="top row">
        <div class="col-sm row">
        	<div class="col-4 center">
        		<span class="border border-primary rounded-circle mon center">
        			${pay.payMonth }
        		</span>
        	</div>
        	<div class="col-8 center">
                납부마감일 ㄴㅁㅇㄻㄴㅇㄹ<br>
                납부마감일을 넘길시 연체료가 부과됩니다.
            </div>
        </div>
        <div class="col-sm center">
        	<div class="card-group">
                <div class="card">
                    <div class="card-header" >
                        납기내
                    </div>
                    <div class="card-body">
                        ${pay.cost }원
                    </div>
                </div>
                <div class="card">
                    <div class="card-header" >
                        납기후
                    </div>
                    <div class="card-body">
                       ${pay.cost*1.02 - (pay.cost * 1.02)%1 }원
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="mid row">
        <div class="col-sm">
			<div class="mid2" align="center"></div>
		</div>
        <div class="col-sm">
        	<div class="mid2" align="right">
        		<button class="btn btn-outline-dark">엑셀로 저장</button>
        		<button class="btn btn-outline-dark">고지서 인쇄</button>
        	</div>
        </div>
    </div>
    <div class="bottom row">
        <div class="col-sm">
        	<div>
        	<table class="table">
			  <tbody>
			    <tr>
			      <th scope="row">당월부과액</th>
			      <td>${pay.cost }</td>
			    </tr>
			    <tr>
			      <th scope="row">미납액</th>
			      <td>0</td>
			    </tr>
			    <tr>
			      <th scope="row">연체료</th>
			      <td>0</td>
			    </tr>
			    <tr>
			      <th scope="row">납기내 금액</th>
			      <td>${pay.cost }</td>
			    </tr>
			    <tr>
			      <th scope="row">납기후 연체료</th>
			      <td>${pay.cost * 0.02 - (pay.cost * 0.02)%1 }</td>
			    </tr>
			    <tr>
			      <th scope="row">납기후 금액</th>
			      <td>${pay.cost * 1.02 - (pay.cost * 1.02)%1 }</td>
			    </tr>
			  </tbody>
			</table>
        	</div>
        </div>
        <div class="col-sm">
        	<div>
        		<button type="button" class="btn btn-outline-dark" data-toggle="modal" data-target="#detail">상세 내역 조회</button>
        		<button type="button" class="btn btn-outline-dark" data-toggle="modal" data-target="#comparison">전월 비교 조회</button>
        		<button type="button" class="btn btn-outline-dark" data-toggle="modal" data-target="#payment">납부 내역 조회</button>
        		
        	</div>
        	<button type="button" id="paymentButton" class="btn btn-outline-dark btn-block">관리비 납부하기</button>
        	<button type="button" id="regular" class="btn btn-outline-dark btn-block">관리비 정기결제</button>
        </div>
    </div>
    


<!-- Modal -->
<div class="modal fade" id="detail" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">상세 내역</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
         <table class="table">
			  <tbody>
			    <tr>
			      <th scope="row">일반관리비</th>
			      <td>${pay.nomal }</td>
			    </tr>
			    <tr>
			      <th scope="row">청소비</th>
			      <td>${pay.clean }</td>
			    </tr>
			    <tr>
			      <th scope="row">경비비</th>
			      <td>${pay.guard }</td>
			    </tr>
			    <tr>
			      <th scope="row">소독비</th>
			      <td>${pay.disinfection }</td>
			    </tr>
			    <tr>
			      <th scope="row">승강기사용료</th>
			      <td>${pay.elevator }</td>
			    </tr>
			    <tr>
			      <th scope="row">공용전기세</th>
			      <td>${pay.PElectric }</td>
			    </tr>
			    <tr>
			      <th scope="row">공용수도세</th>
			      <td>${pay.PWater }</td>
			    </tr>
			    <tr>
			      <th scope="row">수선 유지비</th>
			      <td>${pay.repair }</td>
			    </tr>
			    <tr>
			      <th scope="row">장기수선 충당금</th>
			      <td>${pay.LRepair }</td>
			    </tr>
			    <tr>
			      <th scope="row">입주자 대표회의 운영비</th>
			      <td>${pay.representative }</td>
			    </tr>
			    <tr>
			      <th scope="row">난방비</th>
			      <td>${pay.heating }</td>
			    </tr>
			    <tr>
			      <th scope="row">수도세</th>
			      <td>${pay.water }</td>
			    </tr>
			    <tr>
			      <th scope="row">급탕비</th>
			      <td>${pay.hatWater }</td>
			    </tr>
			    <tr>
			      <th scope="row">전기세</th>
			      <td>${pay.electric }</td>
			    </tr>
			    <tr>
			      <th scope="row">기타</th>
			      <td>${pay.etc }</td>
			    </tr>
			  </tbody>
			</table> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="comparison" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">전월 비교</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary">Understood</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="payment" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">납부 내역</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary">Understood</button>
      </div>
    </div>
  </div>
</div>
    
</div>
</body>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
	/* 이벤트 등록 */
	$('#regular').on('click',regular)
	$('#paymentButton').on('click',payment)
	
	
	//결제 정보
	var IMP = window.IMP; // 생략해도 괜찮습니다.
	IMP.init("imp17111120"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.
	
	//정기 결제
	function regular(){
		console.log("aaa");
		// IMP.request_pay(param, callback) 호출
		  IMP.request_pay({ // param
		    pg: "html5_inicis",
		    pay_method: "card", // "card"만 지원됩니다
		    merchant_uid: "test123", // 빌링키 발급용 주문번호
		    customer_uid: "gildong_0001_1234", // 카드(빌링키)와 1:1로 대응하는 값
		    name: "최초인증결제",
		    amount: 0 // 0 으로 설정하여 빌링키 발급만 진행합니다.
		 /*    , 
		    buyer_name : '승호', // 회원이름
		    buyer_tel: "010-4242-4242" */
		  }, function (rsp) { // callback
		    if (rsp.success) {
		      // 빌링키 발급 성공
		      console.log(rsp);
		    } else {
		      // 빌링키 발급 실패
		      console.log(rsp);
		    }
		  });
	}
	function payment(){
		
	}
</script>
</html>
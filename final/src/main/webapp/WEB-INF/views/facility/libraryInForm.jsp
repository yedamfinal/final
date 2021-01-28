<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		${person }
		<form id="frm" name="frm" action="insertLibrary.do">
			<div class="row">
				<div class="col-sm-8" align="center">
					<img alt="" src="resources/img/library.jpg">
				</div>
				<!-- 1~20 // 21~36 -->
				<div class="col-sm-4">
					<br>
					<br> <input id="id" name="id" type="hidden"
						value="${person.id }" /> <input id="name" name="name"
						type="hidden" value="${person.name }" /> <input id="phone"
						name="phone" type="hidden" value="${person.phone }" /> <input
						id="payNo" name="payNo" type="hidden" value="" /> <input
						id="type" name="type" type="hidden" value="library" />

					<div class="form-group">
						<div class="input-group date" id="datetimepicker4"
							data-target-input="nearest">
							<input name="startDate" type="text"
								class="form-control datetimepicker-input"
								data-target="#datetimepicker4" />
							<div class="input-group-append" data-target="#datetimepicker4"
								data-toggle="datetimepicker">
								<div class="input-group-text">
									<i class="fa fa-calendar"></i>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<select class="form-control" name="month" id="month">
							<option value="1" label="1개월"></option>
							<option value="3" label="3개월"></option>
							<option value="6" label="6개월"></option>
						</select>
					</div>
					<div class="form-group">
						<input class="form-control" name="cost" id="cost" value="11만원"
							readonly /><br>
					</div>

					<input class="btn btn-primary" id="payment" type="button"
						value="등록">
				</div>
				<div class="form-group">
					<c:forEach items="${seatList }" var="seat" varStatus="i">
						<div class="form-check-inline">
							<c:if test="${seat eq false }">
									<label class="form-check-label" for="s${i.count}">${i.count}</label>
									<input class="form-check-input" type="radio" name="seat"
										class="seat" id='s${i.count }' value="${i.count}" />
							</c:if>
							<c:if test="${seat eq true }">
									<label class="form-check-label" for="s${i.count}">${i.count}</label>
									<input class="form-check-input" type="radio" name="seat"
										class="seat" id='s${i.count }' value="${i.count}" disabled />
							</c:if>
						</div>
					</c:forEach>
				</div>
			</div>
		</form>
	</div>
</body>
<!-- 제이쿼리 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 결제 -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="resources/js/payment/payment.js"></script>
<script type="text/javascript">
	//이벤트
	$('#month').on('change', moveCost);
	$('#startDate').on('change', getSeat);
	$('#payment').on('click', payment);

	//개월선택시 가격입력
	function moveCost() {
		let month = $(this).val();
		if (month == '1') {
			$('#cost').val('11만원')
		} else if (month == '3') {
			$('#cost').val('30만원')
		} else {
			$('#cost').val('55만원')
		}
		getSeat();
	}
	//좌석값 받아오기
	function getSeat(){
		let month = $('#month').val();
		let start = $('#startDate').val();
		console.log(month, start);
		if(month==null || month=='' || start==null || start==''){
			return;
		}
		
		$.ajax({
			url : 'getSeat.do',
			type : 'POST',
			dataType : 'json',
			data : {
				startDate : start,
				month : month
			},
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : makeSeat
		});
	}
	
	//좌석 변경
	function makeSeat(data){
		console.log(data);
		for(a of $('.seat[disabled]')){
			$(a).removeAttr("disabled");
		}
		for(a of data){
			$('#s'+a.seat).attr("disabled",true); 
		}
	}

	//결제
	var IMP = window.IMP; // 생략해도 괜찮습니다.
	IMP.init("imp17111120"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.
	
	function payment() {
		let frm = $("#frm").serializeObject();
		frm.cost = frm.cost.replace("만원","0000");
		let payNo = Date.now();
		$('#payNo').val(payNo);
		//결제 정보
		let param = { // param
			pg : "html5_inicis",
			merchant_uid : payNo, //결제번호
			name : "독서실", //헬스장, 독서실, x월 관리비 결제명
			amount : Number(frm.cost)/100, //가격
			buyer_name : frm.name, // 회원이름
			buyer_tel : frm.phone //회원전화번호
		}
		IMP.request_pay(param, function(rsp) { // callback
			if (rsp.success) {
				// 결제 성공 시 로직, 디비에 저장
				
				$("#frm").submit();
			} else {
				// 결제 실패 시 로직, 결제실패 메시지 or 페이지
				alert("결제에 실패하였습니다.")
			}
		});
	}
	
	$(function () {
        $('#datetimepicker4').datetimepicker({
            format: 'L'
        });
    });
</script>
</html>
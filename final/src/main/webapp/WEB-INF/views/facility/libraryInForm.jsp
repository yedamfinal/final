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
		<img alt="" src="resources/img/library.jpg">
		<!-- 1~20 // 21~36 -->
		<form id="frm" name="frm" action="insertLibrary.do">
			<input id="id" name="id" type="hidden" value="${person.id }" /><br>
			<input id="name" name="name" type="hidden" value="${person.name }" /><br>
			<input id="phone" name="phone" type="hidden" value="${person.phone }" /><br>
			<input name="startDate" id="statDate" type="date" /><br> <select
				name="month" id="month">
				<option value="1" label="1개월"></option>
				<option value="3" label="3개월"></option>
				<option value="6" label="6개월"></option>
			</select><br>
			<c:forEach items="${seatList }" var="seat" varStatus="i">
				<c:if test="${seat eq false }">
					<label for="${i.count}">${i.count}</label>
					<input type="radio" name="seat" id="seat" value="${i.count}" />
				</c:if>
				<c:if test="${seat eq true }">
					<label for="${i.count}">${i.count}</label>
					<input type="radio" name="seat" id="seat" value="${i.count}"
						disabled />
				</c:if>
			</c:forEach>
			<br> 가격 : <input name="cost" id="cost" value="11만원"/><br>
			<input id ="payment" type="button" value="등록">
		</form>
	</div>
</body>
<!-- 제이쿼리 -->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 결제 -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="resources/js/payment/payment.js"></script>
<script type="text/javascript">
	//이벤트
	$('#month').on('change', moveCost);
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
	}

	//결제
	var IMP = window.IMP; // 생략해도 괜찮습니다.
	IMP.init("imp17111120"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.
	
	function payment() {
		let frm = $("#frm").serializeObject();
		frm.cost = frm.cost.replace("만원","0000");
		//결제 정보
		let param = { // param
			pg : "html5_inicis",
			merchant_uid : Date.now(), //결제번호
			name : "독서실", //헬스장, 독서실, x월 관리비 결제명
			amount : frm.cost, //가격
			buyer_name : frm.name, // 회원이름
			buyer_tel : frm.phone //회원전화번호
		}
		IMP.request_pay(param, function(rsp) { // callback
			if (rsp.success) {
				// 결제 성공 시 로직, 디비에 저장
				console.log(rsp);
				//$("#frm").submit();
			} else {
				// 결제 실패 시 로직, 결제실패 메시지 or 페이지
				alert("결제에 실패하였습니다.")
			}
		});
	}
	/* var IMP = window.IMP; // 생략해도 괜찮습니다.
	IMP.init("imp17111120"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.

	// IMP.request_pay(param, callback) 호출
	IMP.request_pay({ // param
		pg : "html5_inicis",
		merchant_uid : Date.now(), //결제번호
		name : "library", //헬스장, 독서실, x월 관리비 결제명
		amount : 64900, //가격
		buyer_name : "홍길동", // 회원이름
		buyer_tel : "010-4242-4242" //회원전화번호
	}, function(rsp) { // callback
		if (rsp.success) {
			// 결제 성공 시 로직, 디비에 저장

		} else {
			// 결제 실패 시 로직, 결제실패 메시지 or 페이지
			alert("결제에 실패하였습니다.")
		}
	}); */
</script>
</html>
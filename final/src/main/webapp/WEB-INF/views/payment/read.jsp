<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<style>
.top {
	height: 200px;
}

.mid {
	height: 50px;
	background-color: rgba(128, 128, 128, 0.26);
}

.bottom {
	height: 400px;
}

.center {
	display: flex;
	justify-content: center;
	align-items: center;
}

.mon {
	width: 80px;
	height: 80px;
}

.card-group {
	width: 90%;
}

.mid2 {
	height: 80px;
}
</style>
</head>
<body>
<select id="aa"onchange="aaaa()">
<option>a</option>
<option>b</option>
<option>c</option>
<option>d</option>
</select>
	<div class="container">
		<div class="top row">
			<div class="col-sm row">
				<div class="col-4 center">
					<span class="border border-primary rounded-circle mon center"
						id="voMonth">  </span>
				</div>
				<div class="col-8 center">
					납부마감일 ㄴㅁㅇㄻㄴㅇㄹ<br> 납부마감일을 넘길시 연체료가 부과됩니다.
				</div>
			</div>
			<div class="col-sm center">
				<div class="card-group">
					<div class="card">
						<div class="card-header">납기내</div>
						<div class="card-body">
							<fmt:formatNumber type="number" maxFractionDigits="3"
								value="${payMap['total']+payMap['tax'] }" />
							원
						</div>
					</div>
					<div class="card">
						<div class="card-header">납기후</div>
						<div class="card-body">
							<fmt:formatNumber type="number" maxFractionDigits="3"
								value="${payList[0].cost*1.02+payMap['delay']+payMap['tax'] + (1-(payList[0].cost*1.02%1)%1) }" />
							원
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
					<button class="btn btn-outline-dark" onclick="location.href='payExcelView.do?id=${payMap['id'] }'">엑셀로 저장</button>
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
								<td><fmt:formatNumber type="number" maxFractionDigits="3"
										value="${payMap['total']+payMap['tax'] }" />원</td>
							</tr>
							<tr>
								<th scope="row">미납액</th>
								<td><fmt:formatNumber type="number" maxFractionDigits="3"
										value="${payMap['delay']}" />원</td>
							</tr>
							<tr>
								<th scope="row">연체료</th>
								<td><fmt:formatNumber type="number" maxFractionDigits="3"
										value="${payMap['tax']}" />원</td>
							</tr>
							<tr>
								<th scope="row">납기내 금액</th>
								<td id="beforeCost"><fmt:formatNumber type="number" maxFractionDigits="3"
										value="${payMap['total']+payMap['tax'] }" />원</td>
							</tr>
							<tr>
								<th scope="row">납기후 연체료</th>
								<td><fmt:formatNumber type="number" maxFractionDigits="3"
										value="${payList[0].cost*0.02+payMap['tax'] + (1-(payList[0].cost*0.02%1)%1) }" />원</td>
							</tr>
							<tr>
								<th scope="row">납기후 금액</th>
								<td id="afterCost"><fmt:formatNumber type="number" maxFractionDigits="3"
										value="${payList[0].cost*1.02+payMap['delay'] + payMap['tax'] + (1-(payList[0].cost*1.02%1)%1)} " />원</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="col-sm">
				<div>
					<button type="button" class="btn btn-outline-dark"
						data-toggle="modal" data-target="#detail">상세 내역 조회</button>
					<button type="button" class="btn btn-outline-dark"
						data-toggle="modal" data-target="#comparison">전월 비교 조회</button>
					<button type="button" class="btn btn-outline-dark"
						data-toggle="modal" data-target="#payment">납부 내역 조회</button>

				</div>
				<button type="button" id="paymentButton"
					class="btn btn-outline-dark btn-block">관리비 납부하기</button>
				<button type="button" data-toggle="modal" data-target="#regularPayment"
					class="btn btn-outline-dark btn-block">관리비 정기결제</button>
			</div>
		</div>



		<!-- Modal -->
		<div class="modal fade" id="detail" data-backdrop="static"
			data-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="staticBackdropLabel">상세 내역</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<table class="table">
							<c:forEach items="${payList }" var="pay">
								<thead>
									<tr>
										<th scope="row">${pay.payMonth }월납입항목</th>
										<th>금액 (원)</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">일반관리비</th>
										<td><fmt:formatNumber type="number" maxFractionDigits="3"
												value="${pay.nomal }" /></td>
									</tr>
									<tr>
										<th scope="row">청소비</th>
										<td><fmt:formatNumber type="number" maxFractionDigits="3"
												value="${pay.clean }" /></td>
									</tr>
									<tr>
										<th scope="row">경비비</th>
										<td><fmt:formatNumber type="number" maxFractionDigits="3"
												value="${pay.guard }" /></td>
									</tr>
									<tr>
										<th scope="row">소독비</th>
										<td><fmt:formatNumber type="number" maxFractionDigits="3"
												value="${pay.disinfection }" /></td>
									</tr>
									<tr>
										<th scope="row">승강기사용료</th>
										<td><fmt:formatNumber type="number" maxFractionDigits="3"
												value="${pay.elevator }" /></td>
									</tr>
									<tr>
										<th scope="row">공용전기세</th>
										<td><fmt:formatNumber type="number" maxFractionDigits="3"
												value="${pay.PElectric }" /></td>
									</tr>
									<tr>
										<th scope="row">공용수도세</th>
										<td><fmt:formatNumber type="number" maxFractionDigits="3"
												value="${pay.PWater }" /></td>
									</tr>
									<tr>
										<th scope="row">수선 유지비</th>
										<td><fmt:formatNumber type="number" maxFractionDigits="3"
												value="${pay.repair }" /></td>
									</tr>
									<tr>
										<th scope="row">장기수선 충당금</th>
										<td><fmt:formatNumber type="number" maxFractionDigits="3"
												value="${pay.LRepair }" /></td>
									</tr>
									<tr>
										<th scope="row">입주자 대표회의 운영비</th>
										<td><fmt:formatNumber type="number" maxFractionDigits="3"
												value="${pay.representative }" /></td>
									</tr>
									<tr>
										<th scope="row">난방비</th>
										<td><fmt:formatNumber type="number" maxFractionDigits="3"
												value="${pay.heating }" /></td>
									</tr>
									<tr>
										<th scope="row">수도세</th>
										<td><fmt:formatNumber type="number" maxFractionDigits="3"
												value="${pay.water }" /></td>
									</tr>
									<tr>
										<th scope="row">급탕비</th>
										<td><fmt:formatNumber type="number" maxFractionDigits="3"
												value="${pay.hatWater }" /></td>
									</tr>
									<tr>
										<th scope="row">전기세</th>
										<td><fmt:formatNumber type="number" maxFractionDigits="3"
												value="${pay.electric }" /></td>
									</tr>
									<tr>
										<th scope="row">기타</th>
										<td><fmt:formatNumber type="number" maxFractionDigits="3"
												value="${pay.etc }" /></td>
									</tr>
									<tr>
										<th scope="row">${pay.payMonth }월합계</th>
										<td><fmt:formatNumber type="number" maxFractionDigits="3"
												value="${pay.cost }" /></td>
									</tr>
								</tbody>
							</c:forEach>
						</table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>

		<!-- Modal -->
		<div class="modal fade" id="comparison" data-backdrop="static"
			data-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="staticBackdropLabel">전월 비교</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<input type="month" id="month1">
						<input type="month" id="month2">
						<button type="button" class="btn btn-primary">조회</button><br>
						<table class="table" id="jun">
						<thead>
							<tr>
								<th scope="row">${pay.payMonth }월납입항목</th>
								<th id="monthTh1">x월 금액 (원)</th>
								<th id="monthTh2">x월 금액 (원)</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">일반관리비</th>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">청소비</th>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">경비비</th>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">소독비</th>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">승강기사용료</th>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">공용전기세</th>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">공용수도세</th>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">수선 유지비</th>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">장기수선 충당금</th>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">입주자 대표회의 운영비</th>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">난방비</th>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">수도세</th>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">급탕비</th>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">전기세</th>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">기타</th>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">${pay.payMonth }월합계</th>
								<td></td>
								<td></td>
							</tr>
						</tbody>
						</table>
					</div>
					<div class="modal-footer">
						
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>

		<!-- Modal -->
		<div class="modal fade" id="payment" data-backdrop="static"
			data-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="staticBackdropLabel">납부 내역</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">...</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-primary">Understood</button>
					</div>
				</div>
			</div>
		</div>

		<!-- Modal -->
		<div class="modal fade" id="regularPayment" data-backdrop="static"
			data-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<form action="autoPay.do" method="post">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="staticBackdropLabel">납부 내역</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
							<div>
								<label for="cardNumber">카드 번호 XXXX-XXXX-XXXX-XXXX</label> <input
									id="cardNumber" name="cardNumber" type="text">
							</div>
							<div>
								<label for="expriy">카드 유효기간 YYYY-MM</label> <input id="expriy"
									type="text" name="expriy">
							</div>
							<div>
								<label for="birth">생년월일 YYMMDD</label> <input id="birth"
									type="text" name="birth">
							</div>
							<div>
								<label for="password">카드 비밀번호 앞 두자리 XX</label> <input
									id="password" type="text" name="password">
							</div>
							<input hidden type="text" value="id"
								name="id" value="${payList[0].id }">
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" 
							data-dismiss="modal">닫기</button>
						<button type="submit" class="btn btn-primary"  id="regular">경기결제</button>
					</div>
				</div>
				</form>
			</div>
		</div>

	</div>
	<form action="payOneSuccess.do" method="post" style="display: none;" id="payOneSuccess">
		<input name="cost" id="payOneCost">
		<input name="payNo" id="payOnePayNo">
		<input name="id" value="${payMap['id'] }">
	</form>
</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"
	integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF"
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
	/* 이벤트 등록 */
	//$('#regular').on('click', regular) //정기결제
	$('#paymentButton').on('click', payment) //결제
	
	//현재 달입력
	let voMonth = new Date();
	$('#voMonth').html(voMonth.getMonth()+1+' 월');
	

	//정기 결제
	function regular() {
		
	}
	
	
	//관리비 납부
	//결제
	var IMP = window.IMP; // 생략해도 괜찮습니다.
	IMP.init("imp17111120"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.
	
	function payment() {
		let payNo = Date.now();
		$('#payNo').val(payNo);
		let cost = $('#beforeCost').html().replace('원','').replace(',','');
		/* let cost = $('#afterCost').html().replace('원','').replace(',',''); */
		//결제 정보
		let param = { // param
			pg : "html5_inicis",
			merchant_uid : payNo, //결제번호
			name : $('#voMonth').html()+" 관리비", //헬스장, 독서실, x월 관리비 결제명
			amount : 1200, //가격
			buyer_name : '${person.name}', // 회원이름
			buyer_tel :  '${person.phone}'//회원전화번호
		}
		
		IMP.request_pay(param, function(rsp) { // callback
			if (rsp.success) {
				// 결제 성공 시 로직, 디비에 저장
				$('#payOnePayNo').val(payNo);
				$('#payOneCost').val(cost);
				$('#payOneSuccess').submit();
			} else {
				// 결제 실패 시 로직, 결제실패 메시지 or 페이지
				alert("결제에 실패하였습니다.")
			}
		}); 
	}
	
	//전월비교
	function previousMonth(){
		var t = document.getElementById("jun");
		var r = t.rows;
		var i = 0;
		for(c of r){
			c.cells[1].innerHTML = ++i;  
		}
	}
	
	function aaaa(){
		//var a = $(this).html()
		var a = $('#aa').val()
		console.log(a);
	}
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		${vo }
		<h1>${person.name }님은${vo.endDate }까지 ${vo.seat }번자리 이용 가능합니다.</h1>
		<button onclick="extension()">기간연장</button>
		<%-- <button onclick="location.href='cancelRequest.do?id=${person.id}&type=library'">환불신청</button> --%>
		<button onclick="cancel()">환불신청</button>

		<div id="cancel">
			<table class="table">
				<thead>
					<tr>
						<th scope="col">구분</th>
						<th scope="col">기준</th>
						<th scope="col">환불금액</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>전액환불</td>
						<td>교습 시작 전</td>
						<td>결제 전액 환불</td>
					</tr>
					<tr>
						<td rowspan="2">부분환불</td>
						<td>교습기간 1/3 이내</td>
						<td>결제액의 2/3 환불</td>
					</tr>
					<tr>
						<td>교습기간 1/2 이내</td>
						<td>결제액의 1/2 환불</td>
					</tr>
					<tr>
						<td>환불불가</td>
						<td>환불불가</td>
						<td></td>
					</tr>
				</tbody>
			</table>

			<form action="cancelRequest.do">
				<input type="hidden" id="id" name="id" value="${person.id }"> 
				<input type="hidden" id="type" name="type" value="library"> 
				환불예정금액<input id="cost" name="cost" readonly><br>
				환불사유<textarea rows="" cols="" id="content" name="content"></textarea>
				<button>환불신청</button>
			</form>
		</div>

		<div id="extension">기간연장</div>

	</div>
	
	<!-- jQuery CDN --->
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		$('#extension').hide();
		$('#cancel').hide();
		
		function cancel(){
			$('#extension').hide();
			$('#cancel').show();
			let start = new Date('${vo.startDate}');
			let end = new Date('${vo.endDate}');
			let total = Math.round((end-start)/(1000*60*60*24));
			let other = Math.round((end-Date.now())/(1000*60*60*24));
			let a = other/total;
			console.log(a);
			
			
			if(a > 1){
				$('#cost').val('${vo.cost}')
			}else if(a>(2/3)){
				$('#cost').val(Math.round(Number('${vo.cost}')*2/3))
			}else if(a>(1/2)){
				$('#cost').val(Math.round(Number('${vo.cost}')/2))
			}else{
				$('#cost').val('환불 신청을 하실 수 없습니다.')
			}
		}
		
		function extension(){
			$('#cancel').hide();
			$('#extension').show();
		}
		
		
	</script>
</body>
</html>
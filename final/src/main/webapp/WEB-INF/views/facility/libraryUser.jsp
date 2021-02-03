<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
	<br><br>
		<%-- ${vo }
		<h1>${person.name }님은${vo.endDate }까지${vo.seat }번자리 이용 가능합니다.</h1>
		<button onclick="location.href='cancelRequest.do?id=${person.id}&type=library'">환불신청</button>
		<button onclick="extension()">기간연장</button>
		<button onclick="cancel()">환불신청</button> --%>

		<div class="jumbotron">
			<h1 class="display-4">독서실 이용중</h1>
			<br>
			<br>
			<p class="lead text-dark">
				<c:if test="${vo.cancel eq 'yes' }">
					${person.name }님께서는 환불신청 상태입니다.
				</c:if>
				<c:if test="${vo.cancel ne 'yes' }">
					${person.name }님께서는 ${vo.endDate }까지
					<c:if test="${not empty vo.seat }">
					${vo.seat }번자리
					</c:if>				
					이용 가능합니다.
				</c:if>
			</p>
			<hr class="my-4">
			<p>기간연장 및 환불은 아래 버튼을 눌러주세요</p>
			<br>
			<br>
			<p class="lead">
				<button class="btn btn-primary btn-lg" onclick="extension()">기간연장</button>
				<button class="btn btn-danger btn-lg" onclick="cancel()">환불안내</button>
			</p>
		</div>

		<div id="cancel">
			<table class="table table-bordered">
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
					<tr class="text-danger">
						<td rowspan="2">부분환불</td>
						<td>교습기간 1/3 이내</td>
						<td>결제액의 2/3 환불</td>
					</tr>
					<tr class="text-danger">
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
				<div class="input-group flex-nowrap">
					<div class="input-group-prepend">
						<span class="input-group-text" id="addon-wrapping">예정금액</span>
					</div>
					<input id="cost" hidden name="cost">
					<input id="cost2" readonly type="text" class="form-control"
						aria-label="Username" aria-describedby="addon-wrapping">
				</div>
				<div class="input-group flex-nowrap">
					<div class="input-group-prepend">
						<span class="input-group-text" id="addon-wrapping">환불사유</span>
					</div>
					<input id="content" name="content" type="text" class="form-control" placeholder="환불사유를 작성해주세요"
						aria-label="Username" aria-describedby="addon-wrapping">
				</div>
				<br>
				<button class="btn btn-danger btn-block" id="finalButton">환불신청</button>
				<br><br><br><br><br>
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
		

		function cancel() {
			$('#extension').hide();
			$('#cancel').show();
			let start = new Date('${vo.startDate}');
			let end = new Date('${vo.endDate}');
			let total = Math.round((end - start) / (1000 * 60 * 60 * 24));
			let other = Math.round((end - Date.now()) / (1000 * 60 * 60 * 24));
			let a = other / total;
			let str = '${vo.cost}';
			let cost = Number(str.replace('만원','0000'));
			
			if('${vo.cancel}'=='yes'){
				$('#cost2').val('이미 환불신청 중 입니다.');
				$('#content').attr('disabled','disabled').val('이미 환불신청 중 입니다.');
				$('#finalButton').attr('disabled','disabled');
			}else if (a > 1) {
				$('#cost2').val('전액 환불 가능합니다.'+ cost.toLocaleString()+'원 환불예정입니다.');
				$('#cost').val(Math.round(Number(cost)));
			} else if (a > (2 / 3)) {
				$('#cost2').val('교습기간의 1/3이내입니다. '+Math.round(Number(cost) * 2 / 3).toLocaleString()+'원 환불예정입니다.')
				$('#cost').val(Math.round(Number(cost) * 2 / 3));
			} else if (a > (1 / 2)) {
				$('#cost2').val('교습기간의 1/2이내입니다. '+Math.round(Number(cost) / 2).toLocaleString()+'원 환불예정입니다.')
				$('#cost').val(Math.round(Number(cost) / 2));
			} else {
				$('#cost2').val('교습기간의 1/2이 넘었습니다. 환불 신청을 하실 수 없습니다.');
				$('#content').attr('disabled','disabled').val('교습기간의 1/2이 넘었습니다. 환불 신청을 하실 수 없습니다.');
				$('#finalButton').attr('disabled','disabled');
			}
		}

		function extension() {
			$('#cancel').hide();
			$('#extension').show();
		}
	</script>
</body>
</html>
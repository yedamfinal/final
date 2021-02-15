<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class='row'>
			<div class='col-8'>
				<br>
				<h1>
				<c:if test="${faType eq 'library' }">
					독서실 관리
				</c:if>
				<c:if test="${faType ne 'library' }">
					헬스장 관리
				</c:if>
				</h1>
				<br>				
			</div>
		</div>
		<table class="table">
				<thead>
					<tr>
						<th scope="col">주소</th>
						<th scope="col">이름</th>
						<th scope="col">전화번호</th>
						<c:if test="${faType eq 'library' }">
						<th scope="col">좌석번호</th>
						</c:if>
						<th scope="col">시작일</th>
						<th scope="col">종료일</th>
						<th scope="col">환불</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${list }" var="vo">
					<tr>
						<th scope="row">${vo.address 	}</th>
						<td>${vo.name }</td>
						<td>${vo.phone }</td>
						<c:if test="${faType eq 'library' }">
						<td>${vo.seat }</td>
						</c:if>
						<td>${fn:substring(vo.startDate,0,10) }</td>
						<td>${fn:substring(vo.endDate,0,10) }</td>
						<c:if test="${vo.cancel eq 'yes' }">
							<td><button class="btn btn-danger cancelButton" 
										data-content="${vo.content }"
										data-name="${vo.name }"
										data-phone="${vo.phone }" 
										data-cost="${vo.cost }"
										data-payNo="${vo.payNo }"
										data-id="${vo.id }"
										data-type="${faType }">환불요청</button></td>
										
						</c:if>
						<c:if test="${vo.cancel ne 'yes' }">
							<td>No</td>
						</c:if>
						
					</tr>
				</c:forEach>
				</tbody>
			</table>
			
			<div align="center">
				<my:paging paging="${paging}" jsFunc="goList" />
				<form action="libraryManager.do" method="post" id='pageSearchForm'>
					<input name="search" value="${paging.search}"> 
					<input hidden name="page" id="page" value=""> 
					<input hidden name="type" value="${faType}"> 
					<input class="btn btn-outline-secondary btn-sm" type="submit" value="검색">
				</form>
				<br><br>
			</div>
	</div>
	<!-- Modal -->
		<div class="modal fade" id="cancelModal" data-backdrop="static"
			data-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="staticBackdropLabel">환불 요청 사항</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<h3>이   름 : <span id="cancelName">1000</span></h3> 
						<br>
						<h3>전화번호 : <span id="cancelPhone">합격함</span></h3>
						<br>
						<h3>환불금액 : <span id="cancelCost">1000</span></h3> 
						<br>
						<h3>환불사유 : <span id="cancelContent">합격함</span></h3>
						<br>
						
					</div>
					<div class="modal-footer">
						<form action="cancelManage" method="post">
							<input hidden name="cost" id="cancelCost2">
							<input hidden name="payNo" id="cancelPayNo">
							<input hidden name="id" id="cancelId">
							<input hidden name="type" id="cancelType">
						    <button class="btn btn-danger">환불</button>
						</form>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	<script>
	//onclick="location.href='cancelManage?payNo=${vo.payNo}&cost=${vo.cost }&id=${vo.id }&type=${faType }'"
		let cost,payNo,id,type;
			
		$('.cancelButton').on('click',function(){
			$('#cancelName').html($(this).data('name'));
			$('#cancelPhone').html($(this).data('phone'));
			$('#cancelCost').html($(this).data('cost'));
			$('#cancelContent').html($(this).data('content'));
			
			$('#cancelCost2').val($(this).data('cost'));
			$('#cancelPayNo').val($(this).data('payno'));
			$('#cancelId').val($(this).data('id'));
			$('#cancelType').val($(this).data('type'));
			
			$('#cancelModal').modal('show');
		})
		
		function goList(p) {
			//location.href = "communityList.do?page=" + p+"&type=${type}";
			$('#page').val(p);
			$('#pageSearchForm').submit();
		}
	</script>
</body>
</html>
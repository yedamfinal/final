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
						<th scope="col">ID</th>
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
						<th scope="row">${vo.id }</th>
						<td>${vo.name }</td>
						<td>${vo.phone }</td>
						<c:if test="${faType eq 'library' }">
						<td>${vo.seat }</td>
						</c:if>
						<td>${vo.startDate }</td>
						<td>${vo.endDate }</td>
						<c:if test="${vo.cancel eq 'yes' }">
							<td><button class="btn btn-danger" id="cancelButton">환불</button></td>
						</c:if>
						<c:if test="${vo.cancel ne 'yes' }">
							<td>No</td>
						</c:if>
					</tr>
				</c:forEach>
				</tbody>
			</table>
	</div>
	<script>
	//onclick="location.href='cancelManage?payNo=${vo.payNo}&cost=${vo.cost }&id=${vo.id }&type=${faType }'"
	</script>
</body>
</html>
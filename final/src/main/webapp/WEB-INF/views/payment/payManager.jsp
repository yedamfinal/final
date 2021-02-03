<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
				<h1>관리비 관리</h1>
			<br>				
		</div>
	</div>
	<table class="table" >
			<thead align="center">
				<tr>
					<th scope="col">주소</th>
					<th scope="col">납입상태</th>
					<th scope="col">납입날짜</th>
					<th scope="col">납입금액</th>
				</tr>
			</thead>
			<tbody align="center">
			<c:forEach items="${payList }" var="vo">
				<tr>
					<%-- <th scope="row">${vo.id }</th> --%>
					<td>${vo.dong }동 ${vo.ho }호</td>
					<td>${vo.status }</td>
					<td>${vo.payDate }</td>
					<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.cost }" />원</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap CSS -->

</head>
<body>
	<div class="container">
		<div>
		<h1>방문자차량등록</h1>
		</div>
	<div align="center">
		<table class="table">
		<thead>
			<tr>
				<!-- <th scope="col">no</th> -->
				<th scope="col">동</th>
				<th scope="col">호수</th>
				<th scope="col">차량번호</th>
				<th scope="col">방문목적</th>
				<th scope="col">시작일</th>
				<th scope="col">종료일</th>
				<th scope="col">승인여부</th>
			</tr>
		</thead>
		<tbody>
			
			<c:forEach var="vo" items="${visitList}">
			<tr onclick="location.href='visitCarRead.do?visitNo=${vo.visitNo}'">
				<%-- <th scope="col">${vo.visitNo}</th> --%>
				<th scope="col">${person.dong}</th>
				<th scope="col">${person.ho}</th>	
				<th scope="col">${vo.carNum}</th>
				<th scope="col">${vo.purpose}</th>
				<th scope="col">${vo.startDate}</th>
				<th scope="col">${vo.endDate}</th>
				<td scope="col"><c:if test = "${vo.vcget eq 'ming'}">처리중</c:if>
								<c:if test = "${vo.vcget eq 'ref'}">승인거부</c:if>
								<c:if test = "${vo.vcget eq 'cpl'}">승인완료</c:if>
					</td>
			</tr> 
			</c:forEach>
		</tbody>
		</table>

		<button class="btn btn-outline-secondary" onclick="location.href='visitInsert.do'">방문자차량 신청하기</button>
		</div>		
	</div>
</body>
</html>
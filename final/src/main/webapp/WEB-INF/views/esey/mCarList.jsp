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
		<h1>입주자차량조회</h1>
	</div>
		<button class="btn btn-outline-secondary" onclick="location.href='mCarList.do'">입자주차량</button>
		<button class="btn btn-outline-secondary" onclick="location.href='mVisitList.do'">방문자차량</button>
	<div align="center">
		<table class="table">
		<thead>
			<tr>
				<th scope="col">no</th>
				<th scope="col">동</th>
				<th scope="col">호수</th>
				<th scope="col">차량번호</th>
				<th scope="col">차종</th>
				<th scope="col">승인여부</th>
			</tr>
		</thead>
		<tbody>
			
			
			<c:forEach var="vo" items="${mCarList}">
			<tr  onclick="location.href='carRead.do?cno=${vo.cno }'">
				<td scope="col">${vo.cno}</td>
				<td scope="col">${vo.dong}</td>
				<td scope="col">${vo.ho}</td>	
				<td scope="col">${vo.carNum}</td>
				<td scope="col">
				 <c:if test = "${vo.carType eq 'S'}">소형</c:if>
				 <c:if test = "${vo.carType eq 'M'}">중형</c:if>
				 <c:if test = "${vo.carType eq 'L'}">대형</c:if>
				 </td>
				 <td scope="col" class = "stopevent"><select class="form-control getselect"
							name="get" onchange = "getselect('${vo.cno}')">
							<option value="cbefore" <c:if test="${vo.cget eq 'cbefore' }">selected</c:if>>승인처리중</option>
							<option value="cafter"<c:if test="${vo.cget eq 'cafter' }">selected</c:if>>승인완료</option>							
							</select></td>
			</tr> 
			</c:forEach>
		</tbody>
		</table>
		<button class="btn btn-outline-secondary" onclick="location.href='carInsertFrom.do?id=${person.id}'">차량 등록하기</button>
		</div>		
	</div>
</body>
</html>
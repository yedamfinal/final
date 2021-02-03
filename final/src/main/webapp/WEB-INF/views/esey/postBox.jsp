<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
	
	<div align="center">
		<table class="table">
		<thead>
			<tr>
				<th scope="col">동</th>
				<th scope="col">호수</th>
				<th scope="col">택배번호</th>
				<th scope="col">제품명</th>
				<th scope="col">도착시간</th>
				<th scope="col">수령시간</th>
				<th scope="col">수령여부</th>
			</tr>
		</thead>
		<tbody>
		
			<c:forEach var="vo" items="${postBoxList}">
			<tr>
				<th scope="col">${person.dong}</th>
				<th scope="col">${person.ho}</th>	
				<th scope="col">${vo.postNo}</th>
				<th scope="col">${vo.product}</th>
				<th scope="col">${vo.arriveDate}</th>
				<th scope="col">${vo.getTime}</th>
				<th scope="col">${vo.get}</th>
			</tr> 
			</c:forEach>
		</tbody>
		</table>

		<button class="btn btn-outline-secondary" onclick="location.href='mPostBoxInsForm.do'">등록하기</button>
		</div>		
	</div>
</body>
</html>
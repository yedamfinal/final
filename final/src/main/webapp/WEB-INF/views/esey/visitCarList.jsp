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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
</head>
<body>
	<div class="container">
	
	<div align="center">
		<table border="1" class="table">
		<thead>
			<tr>
				<th scope="col">동</th>
				<th scope="col">호수</th>
				<th scope="col">차량번호</th>
				<th scope="col">방문목적</th>
				<th scope="col">시작일</th>
				<th scope="col">종료일</th>
			</tr>
		</thead>
		<tbody>
			
			<tr>
				<th scope="col">${person.dong}</th>
				<th scope="col">${person.ho}</th>
			<tr/>
			<c:forEach var="vo" items="${visitList}">
			<tr>	
				<th scope="col">${vo.carNum}</th>
				<th scope="col">${vo.purpose}</th>
				<th scope="col">${vo.startDate}</th>
				<th scope="col">${vo.endDate}</th>
			</tr> 
			</c:forEach>
		</tbody>
		</table>

		<a href="visitInsert.do">등록하기</a>
		</div>		
	</div>
</body>
</html>
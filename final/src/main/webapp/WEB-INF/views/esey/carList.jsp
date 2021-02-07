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
	<div>
		<h1>입주자차량등록</h1>
	</div>
	<div align="center">
		<table class="table">
		<thead>
			<tr>
				<th scope="col">no</th>
				<th scope="col">동</th>
				<th scope="col">호수</th>
				<th scope="col">차량번호</th>
				<th scope="col">차종</th>
			</tr>
		</thead>
		<tbody>
			
			
			<c:forEach var="vo" items="${carList}">
			<tr  onclick="location.href='carRead.do?cno=${vo.cno }'">
				<th scope="col">${vo.cno}</th>
				<th scope="col">${person.dong}</th>
				<th scope="col">${person.ho}</th>	
				<th scope="col">${vo.carNum}</th>
				<th scope="col">
				 <c:if test = "${vo.carType eq 'S'}">소형</c:if>
				 <c:if test = "${vo.carType eq 'M'}">중형</c:if>
				 <c:if test = "${vo.carType eq 'L'}">대형</c:if>
				 </th>
			</tr> 
			</c:forEach>
		</tbody>
		</table>
		<button class="btn btn-outline-secondary" onclick="location.href='carInsertFrom.do?id=${person.id}'">차량 등록하기</button>
		</div>		
	</div>
	<script type="text/javascript">
		let error = '${vo.error}';
		if(error == 'no'){
			alert("등록개수가 초과되었습니다.");
		}
	</script>
</body>
</html>
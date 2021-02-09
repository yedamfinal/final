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
${vo},${vo.cget}
	<div class="container">
	<div>
		<h1>입주자차량신청</h1>
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
				<th scope="col">승인여부</th>	
			</tr>
		</thead>
		<tbody>
			
			<c:forEach var="vo" items="${carList}">
			<tr  onclick="location.href='carRead.do?cno=${vo.cno }'">
				<td scope="col">${vo.cno}</td>
				<td scope="col">${person.dong}</td>
				<td scope="col">${person.ho}</td>	
				<td scope="col">${vo.carNum}</td>
				<td scope="col">
				 <c:if test = "${vo.carType eq 'S'}">소형</c:if>
				 <c:if test = "${vo.carType eq 'M'}">중형</c:if>
				 <c:if test = "${vo.carType eq 'L'}">대형</c:if>
				</td>
				 <td scope="col"><c:if test = "${vo.cget eq 'cming'}">처리중</c:if>
								<c:if test = "${vo.cget eq 'cref'}">승인거부</c:if>
								<c:if test = "${vo.cget eq 'ccpl'}">승인완료</c:if>
								</td>
			</tr> 
			</c:forEach>
		</tbody>
		</table>
		<button class="btn btn-outline-secondary" onclick="location.href='carInsertFrom.do?id=${person.id}'">차량 신청하기</button>
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
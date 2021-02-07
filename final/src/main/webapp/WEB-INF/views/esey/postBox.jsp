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
	<div>
		<h1>택배조회</h1>
	</div>
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
			<tr onclick="location.href='postBoxRead.do?postNo=${vo.postNo }'">
				<td scope="col">${vo.dong}</td>
				<td scope="col">${vo.ho}</td>	
				<td scope="col">${vo.postNo}</td>
				<td scope="col">${vo.product}</td>
				<td scope="col">${vo.arriveDate}</td>
				<td scope="col">${vo.getTime}</td>
				<td scope="col"><c:if test = "${vo.get eq 'after'}">수령완료</c:if>
								<c:if test = "${vo.get eq 'before'}">수령전</c:if>
					</td>
			</tr> 
			</c:forEach>
		</tbody>
		</table>
		<c:if test ="${person.type eq 'm'}">
		<button class="btn btn-outline-secondary" onclick="location.href='mPostBoxInsForm.do'">등록하기</button>
		</c:if>
		</div>		
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>페이지 읽기</title>
</head>
<body>
${vo}ddd
	<div class="container">
		<div>
			<h1>조회</h1>
		</div>
		<div>	
				<input type="hidden" name="cno" value="${vo.cno}">
				
				<table class="table">

					<tr>
						<th width="100">동</th>
						<td width="100">${person.dong}</td>
				   </tr>
				   <tr>
						<th width="100">호수</th>
						<td width="300">${person.ho}</td>
					</tr>	
					<tr>
						<th width="100">차번호</th>
						<td width="300">${vo.carNum}</td>
					</tr>
					<tr>
						<th width="100">차종</th>
						<td width="300">
						<c:if test = "${vo.carType eq 'S'}">소형</c:if>
				 		<c:if test = "${vo.carType eq 'M'}">중형</c:if>
				 		<c:if test = "${vo.carType eq 'L'}">대형</c:if></td>
					</tr>

				</table>
				<div align="right">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" class="btn btn-outline-secondary"
						onclick="location.href='carList.do'">목록보기</button>
				</div>
			
		</div>
	</div>

</body>
</html>
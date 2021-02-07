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
				<input type="hidden" name="visitNo" value="${vo.visitNo}">
				
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
						<th width="100">차량번호</th>
						<td width="300">${vo.carNum}</td>
					</tr>
					<tr>
						<th width="100">방문목적</th>
						<td width="300">${vo.purpose}</td>
					</tr>
					<tr>
						<th width="100">시작일</th>
						<td width="300">${vo.startDate}</td>
					</tr>
					<tr>
						<th width="100">종료일</th>
						<td width="300">${vo.endDate}</td>
					</tr>
					

				</table>
				<div align="right">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" class="btn btn-outline-secondary"
						onclick="location.href='visitList.do'">목록보기</button>
				</div>
			
		</div>
	</div>

</body>
</html>
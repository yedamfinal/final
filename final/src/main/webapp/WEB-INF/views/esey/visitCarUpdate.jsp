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
			<h1>tnwjd</h1>
		</div>
		<div>	
				<form action="carUpdate.do" method="post">
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
						<th width="100">차번호</th>
						<td width="300"><input type="text" id="carNum" name="carNum" value="${vo.carNum}"/></td>
					</tr>
					<tr>
						<th width="100">방문목적</th>
						<td width="300"><input type="text" id="purpose" name="purpose" value="${vo.carNum}"/></td>
					</tr>
					<tr>
						<th width="100">시작일</th>
						<td width="300"><input type="date" id="carNum" name="startDate" value="${vo.startDate}"/></td>
					</tr>
					<tr>
						<th width="100">종료일</th>
						<td width="300"><input type="date" id="carNum" name="endDate" value="${vo.endDate}"/></td>
					</tr>

				</table>
				<div align="right">

				<button type="submit" class="btn btn-outline-secondary">수정완료</button>
				</div>
			</form>
		</div>
	</div>

</body>
</html>
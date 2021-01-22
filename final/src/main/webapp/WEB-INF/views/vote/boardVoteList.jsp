<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선거투표목록</title>
</head>
<body>
	<div class="container">
		<div>
			<h1>선거 투표</h1>
		</div>
		<div>
			<table class="table">
				<thead>
					<tr>
						<th scope="col" style="width: 10%">no</th>
						<th scope="col" style="width: 60%">선거제목</th>
						<th scope="col" style="width: 15%">투표 시작일</th>
						<th scope="col" style="width: 15%">투표 종료일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${boardVoteVo.seq}</td>
						<td>${boardVoteVo.title}</td>
						<td>${boardVoteVo.startDate}</td>
						<td>${boardVoteVo.endDate}</td>
					</tr>
				</tbody>			
			</table>
			<div align="right">
				<br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button class="btn btn-outline-secondary" onclick="">새로운 투표</button>
				
			</div>
		</div>
	</div>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</body>
</html>
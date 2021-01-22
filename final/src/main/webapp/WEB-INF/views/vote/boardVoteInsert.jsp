<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>새로운 투표 등록</title>
</head>
<body>
	<div class="container">
		<div>
			<h1>투표등록</h1>
		</div>
		<div>
			<table class="table">
				<tr>
					<th width="100">선거 제목</th>
					<td width="300"><input type="text" id="title" name="title">
					</td>
				</tr>
				<tr>
					<th width="100">후보자 등록</th>
					<td width="300">
						<input type="text" placeholder="후보자 id 입력" id="id">
						<button class="btn btn-outline-secondary btn-sm" type="button" onclick="location.href='candiRegister'">후보자 검색</button> </br> 
						<input readonly type="text" id="candidate" name="candidate">
						
				</tr>
				<tr>
					<th width="100">투표 시작일</th>
					<td width="300"><input type="date" id="startDate"
						name="startDate"></td>
				</tr>
				<tr>
					<th width="100">투표 종료일</th>
					<td width="300"><input type="date" id="endDate" name="endDate">
					</td>
				</tr>
			</table>
			<div align="right">
				<button class="btn btn-outline-secondary" onclick="#">등록하기</button>
				&nbsp;&nbsp;&nbsp;
				<button class="btn btn-outline-secondary"
					onclick="location.href='/final/boardVoteList.do'">목록보기</button>
				&nbsp;&nbsp;&nbsp;
			</div>
		</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
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
					<c:forEach var="vo" items="${boardVoteList }" varStatus="">
						<tr onclick="location.href='boardVoteRead.do?seq=${vo.seq }'">
							<td>${vo.seq}</td>
							<td>${vo.title}</td>
							<td>${vo.startDate}</td>
							<td>${vo.endDate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="row justify-content-center">
				<my:paging paging="${paging}" jsFunc="goList" />
			</div>

		</div>
		<div class="row justify-content-center" style="padding-left: 50px">
			<form action="voteStart.do" method="post" id="pageSearchForm">
				<input name="search" value="${paging.search}"> <input
					type="hidden" name="type" value="${type}"> <input
					type="hidden" name="page" id="page" value=""> <input
					class="btn btn-outline-secondary btn-sm" type="submit" value="검색">
			</form>
		</div>
	</div>
	<div align="right">
		<br />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button class="btn btn-outline-secondary"
			onclick="location.href='boardVoteInsertForm.do'">새로운 투표</button>
	</div>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</body>
<script>
	function goList(p) {
		$('#page').val(p);
		$('#pageSearchForm').submit();
	}
</script>
</html>
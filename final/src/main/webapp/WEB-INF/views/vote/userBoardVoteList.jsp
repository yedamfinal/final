<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
						<th scope="col" style="width: 50%">선거제목</th>
						<th scope="col" style="width: 10%">투표 시작일</th>
						<th scope="col" style="width: 10%">투표 종료일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="vo" items="${boardVoteList }">
						<tr
							onclick="location.href='userBoardVoteRead.do?seq=${vo.seq }&endDate=${vo.endDate} '">
							<td>${vo.seq}</td>
							<td>${vo.title}</td>
							<td>${vo.startDate}</td>
							<td>${vo.endDate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div align="right">
			<my:paging paging="${paging}" jsFunc="goList" />
			<form action="voteStart.do" method="post" id="pageSearchForm">
				<input name="search" value="${paging.search}"> <input
					type="hidden" name="type" value="${type}"> <input
					type="hidden" name="page" id="page" value=""> <input
					class="btn btn-outline-secondary btn-sm" type="submit" value="검색">
			</form>
		</div>
	</div>
</body>
<script
	src="https://cdn.jsdelivr.net/gh/ethereum/web3.js@1.0.0-beta.37/dist/web3.min.js"></script>
<script src="resources/js/vote/abi.js"></script>
<script src="resources/js/vote/index.js"></script>

<script>
	function goList(p) {
		$('#page').val(p);
		$('#pageSearchForm').submit();
	}
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
			<form action="boardVoteUpdate.do" method="post">
				<input type="hidden" name="seq" value="${vo.seq}">
				<table class="table">

					<tr>
						<th width="100">투표 이름</th>
						<td width="300"><input type="text" id="title" name="title"
							value="${vo.title}"></td>
					</tr>

					<tr>
						<th width="100">후보자</th>
						<td width="300">
						<c:forEach var="vo" items="${clist}">				
								<span>후보 ${vo.voteNum}번 ${vo.name}</span>
								<button type="button"
									onclick="location.href='editCandidate.do?seq=${vo.seq}&id=${vo.id}&name=${vo.name}'"
									class="btn btn-outline-secondary btn-sm">수정</button>
								<button type="button" id="candiDelete"
									onclick="location.href='deleteCandidate.do?seq=${vo.seq}&id=${vo.id }'"
									class="btn btn-outline-secondary btn-sm">삭제</button>
								</br>
						</c:forEach>
						</td>
					</tr>


					<tr>
						<th width="100">투표 시작일</th>
						<td width="300"><input type="date" id="startDate"
							name="startDate" value="${vo.startDate}"></td>
					</tr>
					<tr>
						<th width="100">투표 종료일</th>
						<td width="300"><input type="date" id="endDate"
							name="endDate" value="${vo.endDate}"></td>
					</tr>
				</table>
				<div align="right">
					<button type="button" id="inPerson"
						onclick="location.href='candiRegister.do?seq=${vo.seq}'"
						class="btn btn-outline-secondary">후보자 등록</button>
					&nbsp;&nbsp;&nbsp;
					<button type="button" class="btn btn-outline-secondary"
						onclick="location.href='boardVoteList.do'">목록보기</button>
					&nbsp;&nbsp;&nbsp;
					<button type="button"
						onclick="location.href='boardVoteDelete.do?seq=${vo.seq}'"
						class="btn btn-outline-secondary">삭제하기</button>
					&nbsp;&nbsp;&nbsp;
					<button type="submit" class="btn btn-outline-secondary">수정완료</button>
				</div>
			</form>
		</div>
	</div>

</body>
</html>
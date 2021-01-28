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
			<form action="boardVoteUpdate.do" method="post">
				<input type="hidden" name="seq" value="${vo.seq}">
				<table class="table">
					
					<tr>
						<th width="100">투표 이름</th>
						<td width="300"><input type="text" id="title" name="title"
							value="${vo.title}"></td>
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
					<button type="button" class="btn btn-outline-secondary">후보자 등록</button>
					&nbsp;&nbsp;&nbsp;
					<button type="submit" class="btn btn-outline-secondary">수정하기</button>
					&nbsp;&nbsp;&nbsp;
					<button type="button" onclick="location.href='boardVoteDelete.do?seq=${vo.seq}'"class="btn btn-outline-secondary">삭제하기</button>
					&nbsp;&nbsp;&nbsp;
					<button type="button" class="btn btn-outline-secondary" onclick="location.href='boardVoteList.do'">목록보기</button>
					&nbsp;&nbsp;&nbsp;
				</div>
			</form>
		</div>
	</div>

	<script>
		var id = sessionStorage.getItem("id");
		$('#RegisterCandidate').val(id);
	</script>
</body>
</html>
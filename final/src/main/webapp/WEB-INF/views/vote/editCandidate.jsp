<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
	function check() {
		if ($("#id").val() == "" || $("#job").val() == ""
				|| $("#gender").val() == "" || $("#content").val() == ""
				|| $("#phone").val() == "" || $("#parentPhone").val() == ""
				|| $("#registerDate").val() == "") {
			alert("모든 사항을 입력해주세요.");
			return false;
		}

		return true;
	}

	//사용자 조회 응답
	function userSelectResult(list) {
		$('#searchResult').empty();
		for (i = 0; i < list.length; i++) {
			$('#searchResult')
					.append(list[i].name)
					.append(list[i].dong + "동 ")
					.append(list[i].ho + "호")
					.append(
							'<button type="button" class="btn btn-outline-secondary btn-sm" onclick="userInsert(\''
									+ list[i].id
									+ '\')" id=\'btnSelect\'>선택</button></br>');
		}
	}//userSelectResult

	function userInsert(id) {
		$('#id').val(id);
		$('#searchResult').hide();
	}
</script>

<title>후보자 등록</title>
</head>
<body>
	<div class="container">
		<div>
			<h1>후보자 정보 수정</h1>
		</div>
		<div>
			<form action="updateCandidate.do" method="post">
					<input type="hidden" id="seq" name="seq" value="${vo.seq}">
					<input type="hidden" name="id" value="${vo.id}">
					<input type="hidden" name="name" value="${vo.name}">
					
				<table class="table">
					<tr>
						<th width="100">후보자 ID</th>
						<td width="300"><span>${vo.id }</span>
					</tr>
					<tr	>
						<th width="100">후보자 이름</th>
						<td width="300"><span>${vo.name }</span>
					</tr>
					<tr>
						<th width="100">직업</th>
						<td width="300"><input type="text" id="job" name="job"
							value="${vo.job }"></td>
					</tr>
					<tr>
						<th width="100">성별</th>
						<td width="300"><select id="gender" name="gender">
								<option value="남자"
									<c:if test="${vo.gender eq '남자' }">selected</c:if>>남자</option>
								<option value="여자"
									<c:if test="${vo.gender eq '여자' }">selected</c:if>>여자</option>

						</select></td>
					</tr>
					<tr>
						<th width="100">공약 및 약력</th>
						<td width="300"><textarea id="content" name="content"
								style="width: 80%; height: 300px;">${vo.content }</textarea></td>
					</tr>
				</table>
				<div align="right">
					<button type="button" class="btn btn-outline-secondary"
						onclick="location.href='boardVoteList.do'">목록보기</button>
					&nbsp;&nbsp;&nbsp;
					<button type="submit" class="btn btn-outline-secondary">수정
						완료</button>

					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</div>
			</form>
		</div>
	</div>
</body>

</html>
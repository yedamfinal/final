<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
	$(function() {
		userSelect();
	});
	//사용자 조회 요청
	function userSelect() {
		//조회 버튼 클릭
		$('#searchName').on('click', function() {
			$('#searchResult').show();
			var name = $('#name').val();
			//특정 사용자 조회
			$.ajax({
				url : 'searchName.do',
				type : 'POST',
				dataType : 'json',
				data : {
					name : name
				},
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg)
				},
				success : userSelectResult
			});
		}); //조회 버튼 클릭
	}//userSelect

	//사용자 조회 응답
	function userSelectResult(list) {
		$('#searchResult').empty();
		for (i = 0; i < list.length; i++) {
			$('#searchResult').append(list[i].name).append(list[i].dong + "동 ")
					.append(list[i].ho + "호").append(
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
			<h1>후보자 검색</h1>
		</div>
		<div>
			<form action="register.do" method="post">
					<input type="hidden" name="voteNum" value="${vo.voteNum }">
					<input type="hidden" id="seq" name="seq" value="${vo.seq}">
				<table class="table">
					<tr>
						<th width="100">후보자 ID</th>
						<td width="300">
						<input readonly type="text" placeholder="후보자 id" name="id" id="id"> 
						<input type="text" placeholder="후보자 이름 입력" id="name">
							<button id="searchName" class="btn btn-outline-secondary btn-sm" type="button" >후보자 검색</button> 
							</br>
							<div id="searchResult"></div>
					</tr>
					<tr>
						<th width="100">직업</th>
						<td width="300"><input type="text" placeholder="직업 입력"
							id="job" name="job"></td>
					</tr>
					<tr>
						<th width="100">성별</th>
						<td width="300">
							<select id="gender" name="gender">
									<option>남자</option>
									<option>여자</option>
							</select>
						</td>
					</tr>
					<tr>
						<th width="100">공약 및 약력</th>
						<td width="300"><textarea id="content" name="content"
								style="width: 80%; height: 300px;"></textarea></td>
					</tr>
				</table>
				<div align="right">
					<button type="button" class="btn btn-outline-secondary" onclick="location.href='boardVoteList.do'">목록보기</button>
					&nbsp;&nbsp;&nbsp;
					<button type="submit" class="btn btn-outline-secondary">등록하기</button>

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
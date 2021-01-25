<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	$(function() {
		userSelect();
	});
	//사용자 조회 요청
	function userSelect() {
		//조회 버튼 클릭
		$('#searchName').on('click', function() {
			var name = $('#name').val();
			//특정 사용자 조회
			$.ajax({
				url : 'searchName.do',
				type : 'POST',

				dataType : 'json',
				data : {
					id : id
				},
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				},
				success : userSelectResult
			});
		}); //조회 버튼 클릭
	}//userSelect

	//사용자 조회 응답
	function userSelectResult(vo) {
		$('#candidate').val(vo.name + " " + vo.dong + "동 " + vo.ho + "호");

	}//userSelectResult

	function userInsert() {
		//등록 버튼 클릭
		$('#register').on('click', function() {
			$.ajax({
				url : "users.do",
				type : 'POST',
				dataType : 'json', //@ResponseBody
				data : JSON.stringify($("#form1").serializeObject()),
				contentType : 'application/json', //@RequestBody
				success : function(response) {
					//if(response.result == true) {
					userList();
					//}
				},
				error : function(xhr, status, message) {
					alert(" status: " + status + " er:" + message);
				}
			});
		});//등록 버튼 클릭
	}//userInsert
</script>

<title>새로운 투표 등록</title>
</head>
<body>
	<div class="container">
		<div>
			<h1>후보자 검색</h1>
		</div>
		<div>
			<table class="table">
				<tr>
					<th width="100">후보자 ID</th>
					<td width="300">
						<input type="text" placeholder="후보자 id 입력" id="id">
						<button id="searchName" class="btn btn-outline-secondary btn-sm" type="button">후보자 검색</button> </br> 
						
						
				</tr>
				<tr>
					<th width="100">직업</th>
					<td width="300"><input type="text" placeholder="직업 입력" id="job" name="job"></td>
				</tr>
				<tr>
					<th width="100">성별</th>
					<td width="300"><input type="text" placeholder="성별 입력" id="gender" name="gender">
					</td>
				</tr>
				<tr>
					<th width="100">공약 및 약력</th>
					<td width="300"><textarea id="content" name="content" style="width:80%; height: 300px;"></textarea>
					</td>
				</tr>
			</table>
			<div align="right">
				<button class="btn btn-outline-secondary" onclick="location.href='#'">등록하기</button>
				&nbsp;&nbsp;&nbsp;
				<button class="btn btn-outline-secondary" onclick="location.href='/final/boardVoteList.do'">목록보기</button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</div>
		</div>
	</div>
</body>
</html>
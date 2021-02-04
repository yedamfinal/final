<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="container">
		<div class="form-group">
			<form action="replyInsert.do" method="post"
				encType="multipart/form-data">
				<h3>답변하기</h3>
				<input class="orm-control mt-4 mb-2" type="text" name="title"
					size="148" placeholder="제목을 입력해주세요." required>

				<textarea class="form-control" rows="10" name="content"
					placeholder="내용을 입력해주세요." required></textarea>
				<input type="hidden" name="writer" value="${person.id }">
				<input type="hidden" name="originno" value="${vo.originno }">
				<input type="hidden" name="groupord" value="${vo.groupord }">
				<input type="hidden" name="grouplayer" value="${vo.grouplayer }">				
				<div align="right">
				<button type="submit" class="btn btn-secondary mb-3">제출하기</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
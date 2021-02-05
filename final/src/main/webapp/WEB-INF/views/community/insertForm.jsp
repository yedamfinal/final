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
			<form action="communityInsert.do" method="post"
				encType="multipart/form-data">

				<input class="orm-control mt-4 mb-2" type="text" name="title"
					size="148" placeholder="제목을 입력해주세요." required>

				<textarea class="form-control" rows="10" name="content"
					placeholder="내용을 입력해주세요." required></textarea>
				<input type="hidden" name="writer" value="${person.id }"> 
				<input type="hidden" name="type" value="${type }"><br>
				<div class="custom-file mb-3">
					<input type="file" class="custom-file-input" name="uploadFile"
						id="validatedCustomFile"> <label
						class="custom-file-label" for="validatedCustomFile">파일첨부...</label>
				<div class="invalid-feedback">첨부파일</div>
				</div>
				<!-- 첨부파일<input type="file" name="uploadFile" /><br /> -->
				<div align="right">
				<button type="submit" class="btn btn-secondary mb-3">글쓰기</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
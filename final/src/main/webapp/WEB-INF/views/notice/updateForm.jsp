<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- <form action="noticeUpdate.do" method="post">
		title <input name="title" value="${vo.title }">
		content <input name="content" value="${vo.content }">
		<input type="hidden" name="defno" value="${vo.defno }">
		<input type="hidden" name="type" value="notice">	<!-- .do?type=notice를 하기위해서 -->
		<button>수정완료</button> 
	</form> --%>
	<div class="container">
		<div class="form-group">
			<form action="noticeUpdate.do" method="post" encType="multipart/form-data">
				
				<input class="orm-control mt-4 mb-2" type="text" value="${vo.title }"
					name="title" size="152" placeholder="제목을 입력해주세요." required>
				
				<input class="form-control" name="content" value="${vo.content }"
					placeholder="내용을 입력해주세요." required>
				<input type="hidden" name="writer" value="${person.id }">
				<input type="hidden" name="defno" value="${vo.defno }"> 
				<input type="hidden" name="type" value="notice"><br>
				첨부파일<input type="file" name="uploadFile"/><br/>	
				<button type="submit" class="btn btn-secondary mb-3">수정완료</button>	
			</form>
		</div>
	</div>
</body>
</html>
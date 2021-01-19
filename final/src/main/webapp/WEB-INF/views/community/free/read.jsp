<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h1>제목 : ${vo.title }</h1>
		<h4>작성시간 : ${vo.defdate }</h4>
		<h4>첨부파일 : ${vo.deffile }</h4>
		<h4>글쓴이 : ${vo.writer }</h4>
		<p>
			${vo.content }
		</p>
		<a href="freeList.do?type=free">목록으로</a>
		<a href="freeUpdateForm.do?defno=${vo.defno }">글수정</a>
		<a href="freeDelete.do?defno=${vo.defno }">글삭제</a>
	</div>
</body>
</html>

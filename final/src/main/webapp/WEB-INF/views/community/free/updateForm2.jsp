<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="freeUpdate.do" method="post">
		<p>제목 : <input name="title" value="${vo.title }"></p>
		<p>내용 : <input name="content" value="${vo.content }"></p>
		<p>첨부파일 :  <input type="file" name="deffile" value="${vo.deffile }"></p>
		<input type="hidden"  name="defno" value="${vo.defno}">
		<button>글수정</button>
	</form>
</body>
</html>
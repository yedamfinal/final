<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="noticeInsert.do" method="post">
		제목 : <input name="title" ><br>
		내용	: <input name="content" ><br>
		파일 : <input type="file" name="deffile" ><br>
		<input type="hidden" name="writer" value="${person.id }">
		<input type="hidden" name="type" value="notice"><br>
		<button>글쓰기</button>
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="noticeUpdate.do" method="post">
		title <input name="title" value="${vo.title }">
		content <input name="content" value="${vo.content }">
		<input type="hidden" name="defno" value="${vo.defno }">
		<input type="hidden" name="type" value="notice">	<!-- .do?type=notice를 하기위해서 -->
		<button>수정완료</button> 
	</form>
</body>
</html>
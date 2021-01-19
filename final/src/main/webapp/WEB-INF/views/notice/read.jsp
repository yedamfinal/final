<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<h1>${vo.defno}</h1>
		<h4>${vo.title}</h4>
		<h4>${vo.content}</h4>
		<h4>${vo.defdate}</h4>
		<h4>${vo.writer}</h4>
		<h4>${vo.type}</h4>
		
		<a href="noticeList.do?type=notice">목록으로</a>
		<a href="noticeUpdateForm.do?defno=${vo.defno}">글수정</a>
		<a href="noticeDelete.do?defno=${vo.defno}">글삭제</a>
	
	</div>
</body>
</html>
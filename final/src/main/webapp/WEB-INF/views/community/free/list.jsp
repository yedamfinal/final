<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<table border="1">
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성시간</th>
				<th>파일첨부</th>
			</tr>
			<c:forEach var="vo" items="${boardList}">
			<tr onclick="location.href='freeRead.do?defno=${vo.defno}'">
				<th>${vo.defno}</th>
				<th>${vo.title}</th>
				<th>${vo.wirter}</th>
				<th>${vo.defdate}</th>
				<c:if test="${vo.deffile eq null }">
					<th>N</th>
				</c:if>
				<c:if test="${vo.deffile ne null }">
					<th>Y</th>
				</c:if>
			</tr> 
			</c:forEach>
		</table>
		<a href="freeInsertForm.do">글쓰기</a>
	</div>
</body>
</html>
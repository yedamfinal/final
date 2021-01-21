<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
</head>
<body>
	<div align="center">
		<table border="1" class="table">
		<thead>
			<tr>
				<th scope="col">글번호</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">작성시간</th>
				<th scope="col">파일첨부</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${noticeList}">
			<tr onclick="location.href='noticeRead.do?defno=${vo.defno}'">
				<th scope="col">${vo.defno}</th>
				<th scope="col">${vo.title}</th>
				<th scope="col">${vo.writer}</th>
				<th scope="col">${vo.defdate}</th>
				<c:if test="${vo.deffile eq null }">
					<th scope="col">N</th>
				</c:if>
				<c:if test="${vo.deffile ne null }">
					<th scope="col">Y</th>
				</c:if>
			</tr> 
			</c:forEach>
		</tbody>
		</table>
		<my:paging paging="${paging}"/>	
		<script>
		function goList{
			location.href="memberList.do?page=notice";
		}
		
		</script>
		
		<a href="noticeInsertForm.do">글쓰기</a>
				
	</div>
</body>
</html>
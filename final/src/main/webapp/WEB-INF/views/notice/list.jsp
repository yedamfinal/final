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
	<div class="container">
		<div align="right">
		<a href="noticeInsertForm.do">글쓰기</a>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">글번호</th>
					<th scope="col" width="720">제목</th>
					<th scope="col">작성자</th>
					<th scope="col">작성시간</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="vo" items="${noticeList}">
					<tr onclick="location.href='noticeRead.do?defno=${vo.defno}'">
						<td scope="col">${vo.defno}</td>
						<td scope="col">${vo.title}</td>
						<td scope="col">${vo.writer}</td>
						<td scope="col">${vo.defdate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<my:paging paging="${paging}" jsFunc="goList" />
		<script>
			function goList(p) {
				location.href = "noticeList.do?page=" + p;
			}
		</script>
		
		<div align="right">
			<form action="noticeList.do" method="post">
				<select name="searchType" size="1">
					<option value="title" <c:if test="${paging.searchType == 'title'}">selected</c:if>>제목</option>
					<option value="content" <c:if test="${paging.searchType == 'content'}">selected</c:if>>내용</option>
					<option value="writer" <c:if test="${paging.searchType == 'writer'}">selected</c:if>>작성자</option>
					<option value="all" <c:if test="${paging.searchType == 'all'}">selected</c:if>>제목+내용+작성자</option>
				</select>
				<input name="search" value="${paging.search}"> 
				<input type="submit" value="검색">
				
			</form>
		</div>
	</div>
	</body>
</html>
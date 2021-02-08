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
		<a href="qnaInsertForm.do">글쓰기</a>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">글번호</th>
					<th scope="col" width="700">제목</th>
					<th scope="col">작성자</th>
					<th scope="col">작성시간</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="vo" items="${qnaList}">
					<tr onclick="location.href='qnaRead.do?qnano=${vo.qnano}'">
						<td scope="col">${vo.qnano}</td>
						<td>
						<c:choose>

							<c:when test="${vo.grouplayer eq 0}">${vo.title}</c:when>
							
							<c:when test="${vo.grouplayer ne 0}">
								<c:forEach begin="1" end="${vo.grouplayer}">
								&nbsp;&nbsp;&nbsp;&nbsp;
								</c:forEach>
								<img src="resources/img/right.png" width="20px" height="20px">[답변] : ${vo.title}
							</c:when>
							
							
						</c:choose>
						</td>
						<td scope="col">${vo.writer}</td>
						<td scope="col">${vo.qnadate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		
		
		<div align="right">
			<my:paging paging="${paging}" jsFunc="goList" />
			<form action="qnaList.do" method="post" id='pageSearchForm'>
				<select name="searchType" size="1">
					<option value="title" <c:if test="${paging.searchType == 'title'}">selected</c:if>>제목</option>
					<option value="content" <c:if test="${paging.searchType == 'content'}">selected</c:if>>내용</option>
					<option value="writer" <c:if test="${paging.searchType == 'writer'}">selected</c:if>>작성자</option>
					<option value="all" <c:if test="${paging.searchType == 'all'}">selected</c:if>>제목+내용+작성자</option>
				</select>
				<input name="search" value="${paging.search}">
				<input type="hidden" name="type" value="${type}"> 
				<input type="hidden" name="page" id="page" value="">  
				<input type="submit" value="검색">
				
			</form>
		</div>
	</div>
	</body>
	<script>
			function goList(p) {
				$('#page').val(p);
				$('#pageSearchForm').submit();
			}
		</script>
</html>
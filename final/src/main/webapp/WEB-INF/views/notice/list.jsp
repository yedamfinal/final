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
<style type="text/css">
table {
table-layout: fixed; /*테이블 내에서 <td>의 넓이,높이를 고정한다.*/
}
table td {
	line-height : 20px;
    width:100%; /* width값을 주어야 ...(말줄임)가 적용된다. */
    overflow: hidden;
    text-overflow:ellipsis; /*overflow: hidden; 속성과 같이 써줘야 말줄임 기능이 적용된다.*/
    white-space:nowrap; /*<td>보다 내용이 길경우 줄바꿈 되는것을 막아준다.*/
}
</style>
</head>
<body>
	<div class="container" >
		<div align="right">
		<c:if test="${person.type=='m' or person.auth=='yes'}">
			<a href="noticeInsertForm.do">글쓰기</a>
		</c:if>
				
		</div>
		<div>
		<table class="table">
			<thead>
				<tr>
					<th scope="col" width="10%">글번호</th>
					<th scope="col" width="70%">제목</th>
					<th scope="col" width="10%">작성자</th>
					<th scope="col" width="10%">작성시간</th>
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
		</div>		
		<div align="right">
			<my:paging paging="${paging}" jsFunc="goList" />
			<form action="noticeList.do" method="post" id="pageSearchForm">
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
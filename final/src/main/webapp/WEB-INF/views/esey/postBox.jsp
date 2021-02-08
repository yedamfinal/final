<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
	<div>
		<h1>택배조회</h1>
	</div>
	<div align="center">
		<table class="table">
		<thead>
			<tr>
				<th scope="col">동</th>
				<th scope="col">호수</th>
				<th scope="col">택배번호</th>
				<th scope="col">제품명</th>
				<th scope="col">도착시간</th>
				<th scope="col">수령시간</th>
				<th scope="col">수령여부</th>
			</tr>
		</thead>
		<tbody>
		
			<c:forEach var="vo" items="${postBoxList}">
			<tr onclick="location.href='postBoxRead.do?postNo=${vo.postNo }'">
				<td scope="col">${vo.dong}</td>
				<td scope="col">${vo.ho}</td>	
				<td scope="col">${vo.postNo}</td>
				<td scope="col">${vo.product}</td>
				<td scope="col">${vo.arriveDate}</td>
				<td scope="col">${vo.getTime}</td>
				<td scope="col"><c:if test = "${vo.get eq 'after'}">수령완료</c:if>
								<c:if test = "${vo.get eq 'before'}">수령전</c:if>
					</td>
			</tr> 
			</c:forEach>
		</tbody>
		</table>
		<my:paging paging="${paging}" jsFunc="goList" /> <!-- 페이징 구현기능 -->
		
		<form action="postBoxList.do" method="post" id='pageSearchForm'>
				<select name="searchType" id="searchType" size="1">
					<option value="product" <c:if test="${paging.searchType == 'product'}">selected</c:if>>제품명</option>
						</select>
				<input name="search" value="${paging.search}"> 
				<input hidden name="page" id="page" value=""> 
				<input type="submit" value="검색">
			</form>
		
		<div align="right">
				<button class="btn btn-outline-secondary" onclick="location.href='test.do'">운송장 조회</button>
				</div>
		
		
		</div>		
	</div>
	
	<script type="text/javascript">
	$(".stopevent").on("click",function(event){
		event.stopPropagation();
		
	}) 
	function getselect(postNo) {
		/* console.log(postNo,event.target.value) */
		$("#postNo").val(postNo);
		$("#get").val(event.target.value); 
		$("#mget").submit();
	}
		
	function goList(p) {
		//location.href = "mPostBox.do?page=" + p;
		$('#page').val(p);
		$ ('#pageSearchForm').submit();
	}
	
	</script>
	
</body>
</html>
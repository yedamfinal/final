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
		
			<c:forEach var="vo" items="${mPostBox}">
			<tr onclick="location.href='postBoxRead.do?postNo=${vo.postNo }'">
				<th scope="col">${vo.dong}</th>
				<th scope="col">${vo.ho}</th>	
				<th scope="col">${vo.rn}</th>
				<th scope="col">${vo.product}</th>
				<th scope="col">${vo.arriveDate}</th>
				<th scope="col">${vo.getTime}</th>
				<th scope="col"><select class="form-control getselect"
							name="get" onchange = "getselect('${vo.postNo}')">
							<option value="before" <c:if test="${vo.get eq 'before' }">selected</c:if>>수령전</option>
							<option value="after"<c:if test="${vo.get eq 'after' }">selected</c:if>>수령완료</option>							
							
							</select></th>
			</tr> 
			</c:forEach>
			
		</tbody>
		</table>
		<form  hidden="hidden" action = "mget.do" method ="post" id="mget"> 
		<input name="postNo" id="postNo" />
		<input name="get" id="get" />
		</form>
		
		<button class="btn btn-outline-secondary" onclick="location.href='mPostBoxInsForm.do'">등록하기</button>
		<%-- <c:if test ="${person.type eq 'm'}">
		</c:if> --%>
		</div>		
	</div>
	
	<script type="text/javascript">
	$(".getselect").on("click",function(event){
		event.stopPropagation();
		
	}) 
	function getselect(postNo) {
		/* console.log(postNo,event.target.value) */
		$("#postNo").val(postNo);
		$("#get").val(event.target.value); 
		$("#mget").submit();
	}
		
	
	
	</script>
</body>
</html>
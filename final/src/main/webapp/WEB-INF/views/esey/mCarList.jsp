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
</head>
<body>
	<div class="container">
	<div>
		<h1>입주자차량조회</h1>
	</div>
		<button class="btn btn-outline-secondary" onclick="location.href='mCarList.do'">입자주차량</button>
		<button class="btn btn-outline-secondary" onclick="location.href='mVisitList.do'">방문자차량</button>
	<div align="center">
		<table class="table">
		<thead>
			<tr>
				<th scope="col">no</th>
				<th scope="col">동</th>
				<th scope="col">호수</th>
				<th scope="col">차량번호</th>
				<th scope="col">차종</th>
				<th scope="col">승인여부</th>
			</tr>
		</thead>
		<tbody>
			
			
			<c:forEach var="vo" items="${mCarList}">
			<tr>
				<td scope="col">${vo.cno}</td>
				<td scope="col">${vo.dong}</td>
				<td scope="col">${vo.ho}</td>	
				<td scope="col">${vo.carNum}</td>
				<td scope="col">
				 <c:if test = "${vo.carType eq 'S'}">소형</c:if>
				 <c:if test = "${vo.carType eq 'M'}">중형</c:if>
				 <c:if test = "${vo.carType eq 'L'}">대형</c:if>
				 </td>
				 <td scope="col" class = "stopevent"><select class="form-control getselect"
							name="cget" onchange = "getselect('${vo.cno}')">
							<option value="cming"<c:if test="${vo.cget eq 'cming' }">selected</c:if>>처리중</option>
							<option value="cref"<c:if test="${vo.cget eq 'cref' }">selected</c:if>>승인거부</option>
							<option value="ccpl"<c:if test="${vo.cget eq 'ccpl' }">selected</c:if>>승인완료</option>							
							</select></td>
			</tr> 
			</c:forEach>
		</tbody>
		</table>
		<form  hidden="hidden" action = "cmget.do" method ="post" id="cmget"> 
		<input name="cno" id="cno" />
		<input name="cget" id="cget" />
		</form>
		
		
		</div>		
	</div>
	
	
	<script type="text/javascript">
	$(".stopevent").on("click",function(event){
		event.stopPropagation();
		
	})
	
	function getselect(visitNo) {
		/* console.log(postNo,event.target.value) */
		$("#cno").val(visitNo);
		$("#cget").val(event.target.value); 
		$("#cmget").submit();
	}
	</script>
</body>
</html>
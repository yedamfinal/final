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
		<h1>방문자차량등록</h1>
		</div>
		<button class="btn btn-outline-secondary" onclick="location.href='mCarList.do'">입자주차량</button>
		<button class="btn btn-outline-secondary" onclick="location.href='mVisitList.do'">방문자차량</button>
	<div align="center">
		<table class="table">
		<thead>
			<tr>
				<!-- <th scope="col">no</th> -->
				<th scope="col">동</th>
				<th scope="col">호수</th>
				<th scope="col">차량번호</th>
				<th scope="col">방문목적</th>
				<th scope="col">시작일</th>
				<th scope="col">종료일</th>
				<th scope="col">승인여부</th>
			</tr>
		</thead>
		<tbody>
			
			<c:forEach var="vo" items="${mVisitList}">
			<tr >
				<%-- <td scope="col">${vo.visitNo}</td> --%>
				<td scope="col">${vo.dong}</td>
				<td scope="col">${vo.ho}</td>	
				<td scope="col">${vo.carNum}</td>
				<td scope="col">${vo.purpose}</td>
				<td scope="col">${vo.startDate}</td>
				<td scope="col">${vo.endDate}</td>
				<td scope="col" class = "stopevent"><select class="form-control getselect"
							name="vcget" onchange = "getselect('${vo.visitNo}')">
							<option value="ming" <c:if test="${vo.vcget eq 'ming' }">selected</c:if>>처리중</option>
							<option value="ref"<c:if test="${vo.vcget eq 'ref' }">selected</c:if>>승인거부</option>
							<option value="cpl"<c:if test="${vo.vcget eq 'cpl' }">selected</c:if>>승인완료</option>							
							</select></td>
			</tr> 
			</c:forEach>
		</tbody>
		</table>
		
		<form  hidden="hidden" action = "mvcget.do" method ="post" id="mvcget"> 
		<input name="visitNo" id="visitNo" />
		<input name="vcget" id="vcget" />
		</form>

	
		</div>		
	</div>
	<script type="text/javascript">
	$(".stopevent").on("click",function(event){
		event.stopPropagation();
		
	})
	
	function getselect(visitNo) {
		/* console.log(postNo,event.target.value) */
		$("#visitNo").val(visitNo);
		$("#vcget").val(event.target.value); 
		$("#mvcget").submit();
	}
	</script>
</body>
</html>
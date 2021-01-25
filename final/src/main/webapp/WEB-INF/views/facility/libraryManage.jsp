<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<c:forEach items="${list }" var="vo">
		${vo }
		<table class="table">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">First</th>
						<th scope="col">Last</th>
						<th scope="col">환불</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">1</th>
						<td>Mark</td>
						<td>Otto</td>
						<c:if test="${vo.cancel eq 'yes' }">
							<td><button onclick="cancle()">환불</button></td>
						</c:if>
						<c:if test="${vo.cancel ne 'yes' }">
							<td>No</td>
						</c:if>
					</tr>
				</tbody>
			</table>
		</c:forEach>
	</div>
	<script>
		function cancle() {
			
		}
	</script>
</body>
</html>
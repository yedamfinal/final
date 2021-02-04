<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>페이지수정</title>
</head>
<body>
${vo}ddd
	<div class="container">
		<div>
			<h1>수정</h1>
		</div>
		<div>	
				<form action="mPostBoxUpdate.do" method="post">
				<input type="hidden" name="postNo" value="${vo.postNo}">
				<table class="table">

					<tr>
						<th width="100">동</th>
						<td width="100"> <select class="form-control" onchange="hoisted(this)" id="dong" name="dong"> 
							<option value="">동선택</option>
							<option value="101">101동</option>
							<option value="102">102동</option>
							<option value="103">103동</option>
							<option value="104">104동</option>
							<option value="105">105동</option>
							<option value="106">106동</option>
							<option value="107">107동</option>
							<option value="108">108동</option>
							<option value="109">109동</option>
						</select></td>
				   </tr>
				   <tr>
						<th width="100">호수</th>
						<td width="300">
						<select
						class="form-control" onchange="hoisted(this)" id="ho"name="ho">
						<option value="">호선택</option>
						<option value="101">101호</option>
						<option value="102">102호</option>
						<option value="103">103호</option>
						<option value="104">104호</option>

				</select></td>
					</tr>	
					<tr>
						<th width="100">제품명</th>
						<td width="300">${vo.product}</td>
					</tr>	
					<tr>
						<th width="100">도착일</th>
						<td width="300">${vo.arriveDate}</td>
					</tr>
					<tr>
						<th width="100">수령일</th>
						<td width="300">${vo.getTime}</td>
					</tr>
					<tr>
						<th width="100">수령여부</th>
						<td width="300"><select
						class="form-control" onchange="hoisted(this)" id="get" name="get">
						<option value="">수령여부</option>
						<option value="bef">수령전</option>
						<option value="af">수령완료</option>

				</select></td>
					</tr>
				</table>
				<div align="right">
					&nbsp;&nbsp;&nbsp;
					<button type="submit" class="btn btn-outline-secondary" >수정완료</button>
				</div>
			</form>
		</div>
	</div>

</body>
</html>
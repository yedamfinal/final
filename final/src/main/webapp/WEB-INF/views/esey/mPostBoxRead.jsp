<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>페이지 읽기</title>
</head>
<body>
${vo}ddd
	<div class="container">
		<div>
			<h1>조회</h1>
		</div>
		<div>	
				<input type="hidden" name="postNo" value="${vo.postNo}">
				<table class="table">

					<tr>
						<th width="100">동</th>
						<td width="100">${vo.ho}</td>
				   </tr>
				   <tr>
						<th width="100">호수</th>
						<td width="300">${vo.dong}</td>
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
						<td width="300">
								<c:if test = "${vo.get eq 'after'}">수령완료</c:if>
								<c:if test = "${vo.get eq 'before'}">수령전</c:if>
						</td>
					</tr>
				</table>
				<div align="right">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" class="btn btn-outline-secondary"
						onclick="location.href='mPostBox.do'">목록보기</button>
						&nbsp;&nbsp;&nbsp;
					<button type="button"
						onclick="location.href='mPostBoxDelete.do?postNo=${vo.postNo}'"
						class="btn btn-outline-secondary">삭제하기</button>
					&nbsp;&nbsp;&nbsp;
					<button type="button" class="btn btn-outline-secondary" onclick="location.href='mPostBoxUpdateForm.do?postNo=${vo.postNo}'">수정하기</button>
				</div>
			
		</div>
	</div>

</body>
</html>
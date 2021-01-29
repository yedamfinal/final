<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>새로운 투표 등록</title>
</head>
<body>
	<div class="container">
		<div>
			<h1>투표등록</h1>
		</div>
		<div>
			<form action="" method="post" onsubmit="return false">
				<input type="hidden" name="seq" value="${vo.seq}">
				<table class="table">

					<tr>
						<th width="100">투표 이름</th>
						<td width="300"><input type="hidden" id="title" name="title"
							value="${vo.title}">
							<span>${vo.title }</span>	
						</td>
					</tr>
					<tr>
						<th width="100">후보자</th>

						<td width="300"><c:forEach var="vo" items="${clist}"
								varStatus="i">
								<input type="radio" name="name"><label>${i.count}번 후보 ${vo.name}</label>
								
								<button type="button"
									onclick="location.href='profile.do?seq=${vo.seq}&id=${vo.id}&name=${vo.name}'"
									class="btn btn-outline-secondary btn-sm">약력 및 공약 보기</button>
									</br>
								
							</c:forEach></td>
					</tr>
				</table>
				<div align="right">
					&nbsp;&nbsp;&nbsp;
					<button type="button" class="btn btn-outline-secondary"
						onclick="location.href='boardVoteList.do'">목록보기</button>
					&nbsp;&nbsp;&nbsp;
					<button type="submit"  class="btn btn-outline-secondary">투표하기</button>
				</div>
			</form>
		</div>
	</div>

</body>
</html>
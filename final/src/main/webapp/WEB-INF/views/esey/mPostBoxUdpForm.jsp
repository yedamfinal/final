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
						<td width="100"><select class="form-control" id="dong"
							name="dong">
								<option value="101"
									<c:if test="${vo.ho eq '101' }">selected</c:if>>101동</option>
								<option value="102"
									<c:if test="${vo.ho eq '102' }">selected</c:if>>102동</option>
								<option value="103"
									<c:if test="${vo.ho eq '103' }">selected</c:if>>103동</option>
								<option value="104"
									<c:if test="${vo.ho eq '104' }">selected</c:if>>104동</option>
								<option value="105"
									<c:if test="${vo.ho eq '105' }">selected</c:if>>105동</option>
								<option value="106"
									<c:if test="${vo.ho eq '106' }">selected</c:if>>106동</option>
								<option value="107"
									<c:if test="${vo.ho eq '107' }">selected</c:if>>107동</option>
								<option value="108"
									<c:if test="${vo.ho eq '108' }">selected</c:if>>108동</option>
								<option value="109"
									<c:if test="${vo.ho eq '109' }">selected</c:if>>109동</option>
						</select></td>
					</tr>
					<tr>
						<th width="100">호수</th>
						<td width="300"><select class="form-control" id="ho"
							name="ho">

								<option value="101"
									<c:if test="${vo.ho eq '101' }">selected</c:if>>101호</option>
								<option value="102"
									<c:if test="${vo.ho eq '102' }">selected</c:if>>102호</option>
								<option value="103"
									<c:if test="${vo.ho eq '103' }">selected</c:if>>103호</option>
								<option value="104"
									<c:if test="${vo.ho eq '104' }">selected</c:if>>104호</option>

						</select></td>
					</tr>
					<tr>
						<th width="100">제품명</th>
						<td width="300"><input type="text" id="product"
							name="product" value="${vo.product}" /></td>
					</tr>
					<tr>
						<th width="100">도착일</th>
						<td width="300"><input type="date" id="arriveDate"
							name="arriveDate" value="${vo.arriveDate}" /></td>
					</tr>
					<tr>
						<th width="100">수령일</th>
						<td width="300"><input type="date" id="getTime"
							name="getTime" value="${vo.getTime}" /></td>
					</tr>
					<tr>
						<th width="100">수령여부</th>
						<td width="300"><select class="form-control" id="get" name="get">
								<option value="brfore">수령전</option>
								<option value="after">수령완료</option>

						</select></td>
					</tr>
				</table>
				<div align="right">
					&nbsp;&nbsp;&nbsp;
					<button type="submit" class="btn btn-outline-secondary">수정완료</button>
				</div>
			</form>
		</div>
	</div>

</body>
<script type="text/javascript">
	$('#dong').val('${vo.dong}');
</script>
</html>
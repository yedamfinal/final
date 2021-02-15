<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<div class='row'>
		<div class='col-8'>
			<br>
				<h1>관리비 관리</h1>
			<br>				
		</div>
	</div>
	관리비 엑셀 등록 : <br/>
	<form name="excelUpForm" id="excelUpForm" enctype="multipart/form-data" method="POST" action="payExcelUpload.do">
	    <input type="file" id="excelFile" name="excelFile" value="엑셀 업로드" />
	    <button class="btn btn-outline-secondary btn-sm">등록</button>
	</form>
	<div class="btn-group pull-right" style="padding-bottom: 20px;">
		<button class="btn btn-outline-secondary btn-sm" onclick='status("all")'>모두</button>
		<button class="btn btn-outline-secondary btn-sm" onclick='status("ing")'>납입전</button>
		<button class="btn btn-outline-secondary btn-sm" onclick='status("no")'>연체중</button>
		<button class="btn btn-outline-secondary btn-sm" onclick='status("yes")'>납입완</button>
	</div>
	<table class="table" >
			<thead align="center">
				<tr>
					<th scope="col">주소</th>
					<th scope="col">납입상태</th>
					<th scope="col">납입날짜</th>
					<th scope="col">납입금액</th>
				</tr>
			</thead>
			<tbody align="center">
			<c:forEach items="${payList }" var="vo">
				<tr onclick="location.href='managerRead.do?dong=${vo.dong}&ho=${vo.ho }'">
					<%-- <th scope="row">${vo.id }</th> --%>
					<td>${vo.dong }동 ${vo.ho }호</td>
					<td>${vo.status }</td>
					<td>${vo.payDate }</td>
					<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.cost }" />원</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		</div>
		<div align="center">
			<my:paging paging="${paging}" jsFunc="goList" />
			<form action="payRead.do" method="post" id='pageSearchForm'>
				<input name="dong" value="${payVo.dong}" placeholder="동">
				<input name="ho" value="${payVo.ho}" placeholder="호">
				<input hidden name="page" id="page" value="">
				<input hidden name="status" id="status" value="${payVo.status }">
				<input class="btn btn-outline-secondary btn-sm" type="submit" value="검색">
			</form>
			<br><br>
		</div>
</div>
<script>
		
		function goList(p) {
			//location.href = "communityList.do?page=" + p+"&type=${type}";
			$('#page').val(p);
			$('#pageSearchForm').submit();
		}
		
		function status(s){
			$('#status').val(s);
			$('#pageSearchForm').submit();
		}
</script>
</body>
</html>
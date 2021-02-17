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
							data-carnum="${vo.carNum }"
							data-purpose="${vo.purpose }" 
							data-visitNo="${vo.visitNo }"
							data-vcget="${vo.vcget }"
							data-dong="${vo.dong }" 
							data-ho="${vo.ho }"
							data-startdate="${vo.startDate }"
							data-enddate="${vo.endDate }"
							name="vcget" onchange = "getselect('${vo.visitNo}')">
							<option value="ming" <c:if test="${vo.vcget eq 'ming' }">selected</c:if>>처리중</option>
							<option value="ref"<c:if test="${vo.vcget eq 'ref' }">selected</c:if>>승인거부</option>
							<option value="cpl"<c:if test="${vo.vcget eq 'cpl' }">selected</c:if>>승인완료</option>							
							</select></td>
			</tr> 
			</c:forEach>
		</tbody>
		</table>
		
				<!-- Modal -->
		<div class="modal fade" id="vcancelModal" data-backdrop="static"
			data-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="staticBackdropLabel">차량거절</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
				<form action="mccancel.do" method="post">
				<input hidden name="visitNo" id="modalvisitNo" value="">
					<div class="modal-body">
						<div class="input-group flex-nowrap">
							<div class="input-group-prepend">
								<span class="input-group-text" id="dong">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;동&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
							</div>
							<input id="modaldong" name="dong" type="text" value="" class="form-control" 
								aria-label="Username" aria-describedby="addon-wrapping">
						</div>
						<br>
						<div class="input-group flex-nowrap">
							<div class="input-group-prepend">
								<span class="input-group-text" id="addon-wrapping">&nbsp;&nbsp;&nbsp;호수&nbsp;&nbsp;&nbsp;&nbsp;</span>
							</div>
							<input id="modalho" name="ho" type="text" value="" class="form-control" 
								aria-label="Username" aria-describedby="addon-wrapping">
						</div>
						<br>
						<div class="input-group flex-nowrap">
							<div class="input-group-prepend">
								<span class="input-group-text" id="addon-wrapping">차량번호</span>
							</div>
							<input id="modalcarNum" name="carNum" type="text" value="" class="form-control" 
								aria-label="Username" aria-describedby="addon-wrapping">
						</div>
						<br>
						<div class="input-group flex-nowrap">
							<div class="input-group-prepend">
								<span class="input-group-text" id="addon-wrapping">거절사유</span>
							</div>
							<input id="modalcontnet" name="cancel" type="text" class="form-control" placeholder="거절사유를 작성해주세요"
								aria-label="Username" aria-describedby="addon-wrapping">
						</div>
						
						
					</div>
					<div class="modal-footer">

						    <button class="btn btn-danger">거부</button>
						   
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">닫기</button>
					</div>
				</form>
				</div>
			</div>
		</div>
		
		<form  hidden="hidden" action = "mvcget.do" method ="post" id="mvcget"> 
		<input name="visitNo" id="visitNo" />
		<input name="vcget" id="vcget" />
		</form>
		
		<my:paging paging="${paging}" jsFunc="goList" /> <!-- 페이징 구현기능 --> 
		
		<form action="mVisitList.do" method="post" id='pageSearchForm'>
				<select name="searchType" id="searchType" size="1">
					<option value="carNum" <c:if test="${paging.searchType == 'carNum'}">selected</c:if>>차량번호</option>
					<option value="dong" <c:if test="${paging.searchType == 'dong'}">selected</c:if>>동/호수</option>
						</select>
				<input name="search" value="${paging.search}"> 
				<input hidden name="page" id="page" value=""> 
				<input type="submit" value="검색">
				
			</form>

		</div>		
	</div>
	<script type="text/javascript">
	$(".stopevent").on("click",function(event){
		event.stopPropagation();
		
	})
	
	function getselect(visitNo) {
		console.log(visitNo);
		
		if(event.target.value == 'ref') {
			$('#modalvisitNo').val(visitNo);
			$('#modaldong').val($(event.target).data('dong'));
			$('#modalho').val($(event.target).data('ho'));
			$('#modalcarNum').val($(event.target).data('carnum'));
			$('#vcancelModal').modal('show');
		}else
		{
		//console.log(visitNo,event.target.value) 
		$("#visitNo").val(visitNo);
		$("#vcget").val(event.target.value); 
		$("#mvcget").submit();
		
		/* let select = $(event.target)
		$.ajax({
			url : 'mvcget.do',
			type : 'post',
			data : {
				visitNo : visitNo,
				mvcget : event.target.value
				
			},
			success : function(data) {
				$(select).parent().parent().find('td')
			} 
		})
			 */
	}
}		
	
	function goList(p) {
		//location.href = "mPostBox.do?page=" + p;
		$('#page').val(p);
		$ ('#pageSearchForm').submit();
	}
	</script>
</body>
</html>
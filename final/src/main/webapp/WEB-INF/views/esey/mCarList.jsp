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
				<!-- <th scope="col">no</th> -->
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
				<%-- <td scope="col">${vo.cno}</td> --%>
				<td scope="col">${vo.dong}</td>
				<td scope="col">${vo.ho}</td>	
				<td scope="col">${vo.carNum}</td>
				<td scope="col">
				 <c:if test = "${vo.carType eq 'S'}">소형</c:if>
				 <c:if test = "${vo.carType eq 'M'}">중형</c:if>
				 <c:if test = "${vo.carType eq 'L'}">대형</c:if>
				 </td>
				 <td scope="col" class = "stopevent">
				 <select class="form-control getselect"
				 			data-carnum="${vo.carNum }"
							data-carType="${vo.carType }" 
							data-cno="${vo.cno }"
							data-cget="${vo.cget }"
							data-dong="${vo.dong }" 
							data-ho="${vo.ho }"
							name="cget" onchange = "getselect('${vo.cno}')">
							<option value="cming"<c:if test="${vo.cget eq 'cming' }">selected</c:if>>처리중</option>
							<option value="cref" <c:if test="${vo.cget eq 'cref' }">selected</c:if>>승인거부</option>
							
							<option value="ccpl"<c:if test="${vo.cget eq 'ccpl' }">selected</c:if>>승인완료</option>							
							</select></td>
		
			
			</tr> 
			</c:forEach>
		</tbody>
		</table>
		
		<!-- Modal -->
		<div class="modal fade" id="cancelModal" data-backdrop="static"
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
				<form action="mCancel.do" method="post">
				<input hidden name="cno" id="modalcno" value="${vo.cno }">
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
		
		<form  hidden="hidden" action = "cmget.do" method ="post" id="cmget"> 
		<input name="cno" id="cno" />
		<input name="cget" id="cget" />
		</form>
		
		
		</div>		
	</div>
	
	
	<script type="text/javascript">
	$('#cancel').hide();
	
	$(".stopevent").on("click",function(event){
		event.stopPropagation();
	
	})
	
	function getselect(cno) {
		/* console.log(postNo,event.target.value) */
		if(event.target.value == 'cref') {
			
			$('#modalcno').val($(event.target).data('cno'));
			$('#modaldong').val($(event.target).data('dong'));
			$('#modalho').val($(event.target).data('ho'));
			$('#modalcarNum').val($(event.target).data('carnum'));
			//$('#cancelContent').val($(event.target).data('content'));
			
			$('#cancelModal').modal('show');
			
		}else{
			
		
		$("#cno").val(cno);
		$("#cget").val(event.target.value); 
		$("#cmget").submit();
		}
	}
	
	
	
	
	</script>
</body>
</html>
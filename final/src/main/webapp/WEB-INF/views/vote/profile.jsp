<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row">
		<div class="col-xl-6">
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-chart-area mr-1"></i> 후보자 사진
				</div>
				<div align="center" class="card-body" style="min-height: 280px">
					<img src="resources/img/candidate/${vo.picture }"
						style="height: 245px">
				</div>
			</div>
		</div>
		<div class="col-xl-6">
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-chart-bar mr-1"></i> 후보자 정보
				</div>
				<div class="card-body">
					<table class="table">
						<tr>
							<th width="100">후보자 이름</th>
							<td width="300">${vo.name }</td>
						</tr>
						<tr>
							<th width="100">후보자 동</th>
							<td width="300">${vo.dong }</td>
						</tr>
						<tr>
							<th width="100">후보자 호</th>
							<td width="300">${vo.ho }</td>
						</tr>
						<tr>
							<th width="100">후보자 직업</th>
							<td width="300">${vo.job }</td>
						</tr>
						<tr>
							<th width="100">후보자 성별</th>
							<td width="300">${vo.gender }</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	<div class="card mb-4">
		<div class="card-header">
			<i class="fas fa-table mr-1"></i> 후보자 공약
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<tr>
						<td width="300">${vo.content }</td>
					</tr>
				</table>
			</div>
		</div>
		<div align="right">
			<a class="btn btn-outline-secondary" href="javascript:history.back();">뒤로가기</a>
			&nbsp;&nbsp;&nbsp;
		</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="sub_menu">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-sm-12 col-md-6">
				<div class="sub_menu_right_content">
					<span>Apt 4 U Homepage</span>

				</div>
			</div>

			<div class="col-lg-6 col-sm-12 col-md-6">
				<div class="sub_menu_social_icon">
					
					<c:if test="${empty person  }">
						<span><a data-toggle="modal" data-target="#login">Login
						</a></span>
					</c:if>
					<c:if test="${not empty person }">
						<span>${person.name }님 환영합니다</span>
						<c:if test="${person.type == 'm'}">
							<span><a href="register">Register </a></span>
						</c:if>
						<span><a href="logout.do">Logout</a></span>
					</c:if>

				</div>
			</div>
		</div>
	</div>
</div>
<div class="main_menu_iner">
	<div class="container">
		<div class="row align-items-center ">
			<div class="col-lg-12">
				<nav
					class="navbar navbar-expand-lg navbar-light justify-content-between">
					<a class="navbar-brand" href="home"> <img
						src="resources/img/apart.JPG" alt="logo" style="width: 100px">
					</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>

					<div
						class="collapse navbar-collapse main-menu-item justify-content-center"
						id="navbarSupportedContent">
						<ul class="navbar-nav">
							<li class="nav-item"><a class="nav-link" href="introduece.do">아파트소개</a>
							</li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="blog.html"
								id="navbarDropdown" role="button" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> 공지사항 </a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<a class="dropdown-item" href="calendar.do">일정표</a> <a
										class="dropdown-item" href="noticeList.do?type=notice">공지사항</a>
									<a class="dropdown-item" href="qnaList.do">Q&A</a>
								</div></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="blog.html"
								id="navbarDropdown" role="button" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> 커뮤니티 </a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<a class="dropdown-item" href="communityList?type=free">자유게시판</a> <a
										class="dropdown-item" href="communityList?type=ana">아나바다</a> <a
										class="dropdown-item" href="communityList?type=def">하자보수</a>
								</div></li>
							<li class="nav-item"><a class="nav-link" href="payRead.do">관리비조회</a>
							</li>
							<li class="nav-item"><a class="nav-link"
								href="voteStart.do">전자투표</a></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="blog.html"
								id="navbarDropdown" role="button" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false">근린시설</a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<a class="dropdown-item" href="libraryInForm.do">독서실</a> 
									<a class="dropdown-item" href="fitnessInForm.do">헬스장</a>
								</div></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="blog.html"
								id="navbarDropdown" role="button" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false">편의기능</a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<a class="dropdown-item" href="postBoxList.do">택배조회</a> <a
										class="dropdown-item" href="carList.do">입주자 차량등록</a> <a
										class="dropdown-item" href="visitList.do">방문자 차량등록</a> <a
										class="dropdown-item" href="cctv.do">CCTV</a> <a
										class="dropdown-item" href="#">관리자 차량관리</a> <a
										class="dropdown-item" href="#">관리자 택배관리</a> 
										
								</div></li>
						</ul>
					</div>

				</nav>
			</div>
		</div>
	</div>
</div>

<!-- 로그인 모달 -->
<div class="modal fade" id="login" data-backdrop="static"
	data-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="staticBackdropLabel">로 그 인</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form action="login.do">
					<div class="mb-3 row">
						<label for="id" class="col-sm-3 col-form-label">아이디</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="mid" name="id" >
						</div>
					</div>
					<div class="mb-3 row">
						<label for="password" class="col-sm-3 col-form-label">비밀번호</label>
						<div class="col-sm-9">
							<input type="password" class="form-control" id="mpassword" name="password">
						</div>
					</div>
					<button type="submit" id="loginButton" class="btn btn-primary btn-block">로 그 인</button>
				</form>
			</div>
			<div class="modal-footer" id="fail">
			</div>
		</div>
	</div>
</div>
<script>
	/* //로그인 버튼
	$("#loginButton").on('click',login);
	
	//로그인 이벤트
	function login(){
		let id = $("#mid").val();
		let pw = $("#mpassword").val();
		$.ajax({
			url : 'ajaxlogin.do',
			type : 'POST',
			data : {
				id : id,
				password : pw
			},
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : function(result){
				if(result=='fail'){
					$('#fail').html("로그인에 실패하셨습니다. <br> 아이디와 비밀번호를 확인해주세요.")
				}else{
					$('#login').modal('hide');
				}
			}
		});	
	} */
	
</script>
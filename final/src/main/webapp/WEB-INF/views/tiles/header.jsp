<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
								<span><a href="#">Login </a></span>
							</c:if>
							<c:if test="${not empty person }">
								<c:if test="${person.type == 'm'}">
									<span><a href="#">Register </a></span>
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
							<button class="navbar-toggler" type="button"
								data-toggle="collapse" data-target="#navbarSupportedContent"
								aria-controls="navbarSupportedContent" aria-expanded="false"
								aria-label="Toggle navigation">
								<span class="navbar-toggler-icon"></span>
							</button>

							<div
								class="collapse navbar-collapse main-menu-item justify-content-center"
								id="navbarSupportedContent">
								<ul class="navbar-nav">
									<li class="nav-item"><a class="nav-link" href="#">아파트소개</a>
									</li>
									<li class="nav-item dropdown"><a
										class="nav-link dropdown-toggle" href="blog.html"
										id="navbarDropdown" role="button" data-toggle="dropdown"
										aria-haspopup="true" aria-expanded="false"> 공지사항 </a>
										<div class="dropdown-menu" aria-labelledby="navbarDropdown">
											<a class="dropdown-item" href="#">일정표</a> <a
												class="dropdown-item" href="noticeList.do?type=notice">공지사항</a>
											<a class="dropdown-item" href="#">Q&A</a>
										</div></li>
									<li class="nav-item dropdown"><a
										class="nav-link dropdown-toggle" href="blog.html"
										id="navbarDropdown" role="button" data-toggle="dropdown"
										aria-haspopup="true" aria-expanded="false"> 커뮤니티 </a>
										<div class="dropdown-menu" aria-labelledby="navbarDropdown">
											<a class="dropdown-item" href="#">자유게시판</a> <a
												class="dropdown-item" href="#">하자보수</a> <a
												class="dropdown-item" href="#">아나바다</a>
										</div></li>
									<li class="nav-item"><a class="nav-link" href="#">관리비조회</a>
									</li>
									<li class="nav-item"><a class="nav-link" href="boardVoteList.do">전자투표</a>
									</li>
									<li class="nav-item dropdown"><a
										class="nav-link dropdown-toggle" href="blog.html"
										id="navbarDropdown" role="button" data-toggle="dropdown"
										aria-haspopup="true" aria-expanded="false">근린시설</a>
										<div class="dropdown-menu" aria-labelledby="navbarDropdown">
											<a class="dropdown-item" href="#">헬스장</a> <a
												class="dropdown-item" href="#">독서실</a>		
										</div></li>
									<li class="nav-item dropdown"><a
										class="nav-link dropdown-toggle" href="blog.html"
										id="navbarDropdown" role="button" data-toggle="dropdown"
										aria-haspopup="true" aria-expanded="false">편의기능</a>
										<div class="dropdown-menu" aria-labelledby="navbarDropdown">
											<a class="dropdown-item" href="#">택배조회</a> <a
												class="dropdown-item" href="#">관리자 택배관리</a> <a
												class="dropdown-item" href="#">입주자 차량등록</a> <a
												class="dropdown-item" href="visitList.do">방문자 차량등록</a> <a
												class="dropdown-item" href="#">관리자 차량관리</a> <a
												class="dropdown-item" href="#">CCTV</a>
										</div></li>
								</ul>
							</div>

						</nav>
					</div>
				</div>
			</div>
		</div>

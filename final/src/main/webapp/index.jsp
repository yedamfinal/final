
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>APT 4 U 홈페이지입니다.</title>
<link rel="icon" href="resources/img/favicon.png">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<!-- animate CSS -->
<link rel="stylesheet" href="resources/css/animate.css">
<!-- owl carousel CSS -->
<link rel="stylesheet" href="resources/css/owl.carousel.min.css">
<!-- themify CSS -->
<link rel="stylesheet" href="resources/css/themify-icons.css">
<!-- flaticon CSS -->
<link rel="stylesheet" href="resources/css/flaticon.css">
<!-- fontawesome CSS -->
<link rel="stylesheet" href="resources/fontawesome/css/all.min.css">
<!-- magnific CSS -->
<link rel="stylesheet" href="resources/css/magnific-popup.css">
<link rel="stylesheet" href="resources/css/gijgo.min.css">
<!-- niceselect CSS -->
<link rel="stylesheet" href="resources/css/nice-select.css">
<!-- slick CSS -->
<link rel="stylesheet" href="resources/css/slick.css">
<!-- style CSS -->
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" type="text/css" href="resources/css/style2.css">
<!-- jquery plugins here-->
<script src="resources/js/jquery-1.12.1.min.js"></script>
<!-- popper js -->
<script src="resources/js/popper.min.js"></script>
<!-- bootstrap js -->
<script src="resources/js/bootstrap.min.js"></script>
<!-- magnific js -->
<script src="resources/js/jquery.magnific-popup.js"></script>
<!-- swiper js -->
<script src="resources/js/owl.carousel.min.js"></script>
<!-- masonry js -->
<script src="resources/js/masonry.pkgd.js"></script>
<!-- masonry js -->
<script src="resources/js/jquery.nice-select.min.js"></script>
<script src="resources/js/gijgo.min.js"></script>
<!-- contact js -->
<script src="resources/js/jquery.ajaxchimp.min.js"></script>
<script src="resources/js/jquery.form.js"></script>
<script src="resources/js/jquery.validate.min.js"></script>
<script src="resources/js/mail-script.js"></script>
<script src="resources/js/contact.js"></script>
<!-- custom js -->
<script src="resources/js/custom.js"></script>

</head>

<body>
	<!--::header part start::-->
	<header class="main_menu">
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
							<a class="navbar-brand" href="index.jsp"> <img
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
										aria-haspopup="true" aria-expanded="false"> 근린시설</a>
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
												class="dropdown-item" href="#">방문자 차량등록</a> <a
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
	</header>


	<!-- Header part end-->
	<section class="top_place section_padding">
		<div class="container">
			<div class="row">
				<div class="col-sm-8">
					<img src="resources/img/main2.JPG" alt="logo" style="width: 100%">
				</div>

				<c:if test="${person != null }">
					<p class="loginGreetingt">
						<span>${person.name }님 환영합니다.</span>
					</p>
				</c:if>
				<c:if test="${person == null }">

					<div class="col-sm-4">
						<div class="mLogin_box mLogout">
							<p class="loginGreetingt">
								<span>APT4U 에 오신 것을 환영합니다.</span>
							</p>
							<form class="loginBox" action="login.do" method="post">
								<p>
									<input type="text" class="login_input_text" id="id" name="id"
										value="" placeholder="아이디" style="width: 100%">
								</p>
								<p>
									<input type="password" class="login_input_text" id="password"
										name="password" value="" placeholder="비밀번호"
										style="width: 100%">

								</p>

								<button type="submit" class="loginBtn" style="width: 100%">로그인</button>
							</form>
							<div class="loginHelp">
								<ul>
									<li><span>아이디또는 비밀번호를 잊으셨나요?</span> <a
										href="/login/lost_id/" class="ldSearch_btn blind_txt">찾아보기</a>
									</li>
									<li><span>아직 아파트너 회원이 아니신가요?</span> <a href="/join/term/"
										class="join_btn blind_txt">회원가입하기</a></li>
								</ul>
							</div>
						</div>

					</div>

				</c:if>



			</div>
			<div class="mBoard_box">
				<div class="mBoard noti_board" style="width: 500px">
					<p class="title">
						공지사항 <span>아파트 새 소식을 확인해주세요!</span>
					</p>
					<div class="tab_board_wrap">
						<ul class="tab_cate" id="notice_ul">
							<li class="on" id="li_inform"><a
								href="javascript:board_latest_list('inform','notice')">아파트
									공지사항</a></li>
						</ul>
						<div class="tab_noti_list m_noti_list">
							<ul id="notice_latest_ul1">

								<li><a
									href="javascript:post_to_url('/board/view/inform/',{'wr_id':'784323'})">로그인을
										하셔야 확인 가능합니다. <small title="작성일">2021-01-17</small>
								</a></li>
								<li><a
									href="javascript:post_to_url('/board/view/inform/',{'wr_id':'783661'})">로그인을
										하셔야 확인 가능합니다. <small title="작성일">2021-01-16</small>
								</a></li>
								<li><a
									href="javascript:post_to_url('/board/view/inform/',{'wr_id':'777544'})">로그인을
										하셔야 확인 가능합니다. <small title="작성일">2021-01-11</small>
								</a></li>
								<li><a
									href="javascript:post_to_url('/board/view/inform/',{'wr_id':'777543'})">로그인을
										하셔야 확인 가능합니다. <small title="작성일">2021-01-11</small>
								</a></li>
							</ul>

						</div>
						<a href="/board/lists/inform" class="tab_more blind_txt"
							id="notice_more">더보기</a>
					</div>
				</div>
				<div class="mBoard comu_board">
					<p class="title">
						커뮤니티 <span> 입주민간 자유로운 소통 공간!</span>
					</p>
					<div class="tab_board_wrap">
						<ul class="tab_cate" id="community_ul">
							<li class="on" id="li_free"><a
								href="javascript:board_latest_list('free','community')">자유게시판</a></li>
							<li id="li_suggest"><a
								href="javascript:board_latest_list('suggest','community')">하자보수</a></li>
						</ul>
						<div class="tab_noti_list m_cumu_list">
							<ul id="community_latest_ul">

								<li><a
									href="javascript:post_to_url('/board/view/free/',{'wr_id':'780935'})">로그인을
										하셔야 확인 가능합니다. <small title="작성일">2021-01-14</small>
								</a></li>
								<li><a
									href="javascript:post_to_url('/board/view/free/',{'wr_id':'772216'})">로그인을
										하셔야 확인 가능합니다. <small title="작성일">2021-01-07</small>
								</a></li>
								<li><a
									href="javascript:post_to_url('/board/view/free/',{'wr_id':'760761'})">로그인을
										하셔야 확인 가능합니다. <small title="작성일">2020-12-27</small>
								</a></li>
								<li><a
									href="javascript:post_to_url('/board/view/free/',{'wr_id':'751598'})">로그인을
										하셔야 확인 가능합니다. <small title="작성일">2020-12-18</small>
								</a></li>
							</ul>
						</div>
						<a href="/board/lists/free" class="tab_more blind_txt"
							id="community_more">더보기</a>
					</div>
				</div>
			</div>



			<div class="quick">
				<p class="title">자주찾는 서비스</p>
				<div class="quick_icon">
					<ul>
						<li class='qu_01'><a href=/board/lists/free>자유게시판</a></li>
						<li class='qu_02'><a href=/board/lists/free>일정표</a></li>
						<li class='qu_03'><a href=javascript:checkApti()>관리비조회</a></li>
					</ul>
				</div>
				<div class="call_num">
					<ul>
						<li>
							<p class="s_tit">관리사무소 전화번호</p>

							<p class="num">053-111-1111</p>
						</li>
						<li>
							<p class="s_tit">팩스번호</p>
							<p class="fax">053-333-3333</p>
						</li>
					</ul>
					<p class="time">09:00 ~ 18:00 (주말/ 공휴일 휴무)</p>
				</div>
			</div>
		</div>

	</section>


	<!-- footer part start-->
	<footer class="footer-area">
		<div class="container">
			<div class="row justify-content-between">
				<div class="col-sm-6 col-md-5">
					<div class="single-footer-widget">
						<h4>Apt 4 U</h4>
						<ul>

							<li><a href="#">Mount Everast, India</a></li>
							<li><a href="#">Sidney, Australia</a></li>
							<li><a href="#">Miami, USA</a></li>
							<li><a href="#">California, USA</a></li>
							<li><a href="#">London, UK</a></li>
							<li><a href="#">Saintmartine, Bangladesh</a></li>
							<li><a href="#">Mount Everast, India</a></li>
							<li><a href="#">Sidney, Australia</a></li>
						</ul>

					</div>
				</div>
				<div class="col-sm-6 col-md-4">
					<div class="single-footer-widget">
						<h4>Subscribe Newsletter</h4>
						<div class="form-wrap" id="mc_embed_signup">
							<form target="_blank"
								action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
								method="get" class="form-inline">
								<input class="form-control" name="EMAIL"
									placeholder="Your Email Address"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'Your Email Address '" required=""
									type="email">
								<button class="click-btn btn btn-default text-uppercase">
									<i class="far fa-paper-plane"></i>
								</button>
								<div style="position: absolute; left: -5000px;">
									<input name="b_36c4fd991d266f23781ded980_aefe40901a"
										tabindex="-1" value="" type="text">
								</div>

								<div class="info"></div>
							</form>
						</div>
						<p>Subscribe our newsletter to get update news and offers</p>
					</div>
				</div>
				<div class="col-sm-6 col-md-3">
					<div class="single-footer-widget footer_icon">
						<h4>Contact Us</h4>
						<p>4156, New garden, New York, USA +880 362 352 783</p>
						<span>contact@martine.com</span>
						<div class="social-icons">
							<a href="#"><i class="ti-facebook"></i></a> <a href="#"><i
								class="ti-twitter-alt"></i></a> <a href="#"><i
								class="ti-pinterest"></i></a> <a href="#"><i
								class="ti-instagram"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container-fluid">
			<div class="row justify-content-center">
				<div class="col-lg-12">
					<div class="copyright_part_text text-center">
						<p class="footer-text m-0">
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							Copyright &copy;
							<script>
								document.write(new Date().getFullYear());
							</script>
							All rights reserved | This template is made with <i
								class="ti-heart" aria-hidden="true"></i> by <a
								href="https://colorlib.com" target="_blank">Colorlib</a>
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						</p>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- footer part end-->


</body>

</html>
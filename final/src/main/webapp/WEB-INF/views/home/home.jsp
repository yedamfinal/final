<%@page contentType="text/html; charset=utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>


<div class="top_place section_padding">
	<div class="container">
			<div class="row">
				<div class="col-sm-8">
					<img src="resources/img/main2.JPG" alt="logo" style="width: 100%">
				</div>

				<c:if test="${not empty person  }">
					<p class="loginGreetingt">
						<span>${person.name }님 환영합니다.</span>
					</p>
				</c:if>
				<c:if test="${empty person  }">

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

								<%-- <c:forEach var="vo" items="${noticeList}">
								<li onclick="location.href='noticeRead.do?defno=${vo.defno}'">
									<li><a>${vo.title}
									<small title="작성일">${vo.defdate}</small>
									</a>
									
								</c:forEach> --%>
								
								
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
</div>


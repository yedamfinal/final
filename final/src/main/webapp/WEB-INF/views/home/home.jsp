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
				<div class="mBoard noti_board" style="width: 350px">
					<p class="title">
						공지사항 <span>아파트 새 소식을 확인해주세요!</span>
					</p>
					<div class="tab_board_wrap">
						<ul class="tab_cate" id="notice_ul">
							<li class="on" id="li_inform"><a>아파트
									공지사항</a></li>
						</ul>
						<div class="tab_noti_list m_noti_list">
							<c:forEach var="vo" items="${noticeList}">
							<ul id="community_latest_ul" >
								<li title="${vo.title}"><a
									href="noticeRead.do?defno=${vo.defno}">${vo.title}
									<small title="작성일">${vo.defdate}</small>
								</a></li>
							</ul>
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="mBoard noti_board" style="width: 350px">
					<p class="title">
						커뮤니티 <span> 입주민간 자유로운 소통 공간!</span>
					</p>
					
					<div class="tab_board_wrap">
						<ul class="tab_cate" id="community_ul" role="tablist">
							<li class="on" id="li_free" role="presentation"><a
								onclick="free();">자유게시판</a></li>
							<li class="on" id="li_suggest" role="presentation"><a
								onclick="def();">하자보수</a></li>
						</ul>
						<div class="tab_noti_list m_cumu_list">
						<div id="free">
							<c:forEach var="vo" items="${freeList}">
							<ul id="free">
								<li title="${vo.title}"><a
									href="communityRead.do?defno=${vo.defno}&type=${type }">${vo.title}
									<small title="작성일">${vo.defdate}</small>
								</a></li>
							</ul>
							</c:forEach>
						</div>
						<div id="def">
							<c:forEach var="vo" items="${defList}">
							<ul id="def">
								<li title="${vo.title}"><a
									href="communityRead.do?defno=${vo.defno}&type=${type }">${vo.title}
									<small title="작성일">${vo.defdate}</small>
								</a></li>
							</ul>
							</c:forEach>
						</div>	
						</div>
					</div>
					</div>
					
					<div class="mBoard noti_board" style="width: 350px">
					<p class="title">
						전자투표 <span>입주민의 권리! 많은 참여바랍니다!</span>
					</p>
					<div class="tab_board_wrap">
						<ul class="tab_cate" id="notice_ul">
							<li class="on" id="li_inform"><a>전자투표</a></li>
						</ul>
						<div class="tab_noti_list m_noti_list">
							<c:forEach var="vo" items="${boardVoteList}">
							<ul id="community_latest_ul" >
								<li title="${vo.title}"><a
									href="userBoardVoteRead.do?seq=${vo.seq}&endDate=${vo.endDate}">${vo.title}
									<small title="작성일">~${vo.endDate}</small>
								</a></li>
							</ul>
							</c:forEach>
						</div>
					</div>
				</div>
					
					
				</div>
			</div>



			<div class="quick">
				<p class="title">자주찾는 서비스</p>
				<div class="quick_icon">
					<ul>
						<li class='qu_01'><a style="background:url(resources/img/quick_01.jpg) 0 0 no-repeat;" href=noticeList.do?type=notice>자유게시판</a></li>
						<li class='qu_02'><a style="background:url(resources/img/quick_02.jpg) 0 0 no-repeat;" href=calendar.do>일정표</a></li>
						<li class='qu_03'><a style="background:url(resources/img/quick_03.jpg) 0 0 no-repeat;" href=payRead.do>관리비조회</a></li>
					</ul>
				</div>
				<div class="call_num">
					<ul>
						<li>
							<p class="s_tit" >관리사무소 전화번호</p>
							<p class="num">053-111-1111</p>
						</li>
						<li>
							<p class="s_tit">팩스번호</p>
							<p class="fax">053-333-3333</p>
						</li>
					</ul>
					<p class="time" style="background:url(resources/img/time_ico.gif) 0 0 no-repeat;">09:00 ~ 18:00 (주말/ 공휴일 휴무)</p>
				</div>
			</div>
			
		</div>
<script type="text/javascript">
	$('#def').hide();
	
	function def() {
		$('#free').hide();
		$('#def').show();	
	}
	
	function free() {
		$('#def').hide();
		$('#free').show();
	}
</script>


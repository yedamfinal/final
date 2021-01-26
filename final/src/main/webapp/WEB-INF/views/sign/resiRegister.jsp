<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
	var i = 1;
	function add_div() {
		i++;
		/* var div = document.createElement('div');
		div.className = "form-control"
		div.innerHTML = document.getElementById('mmm').innerHTML;
		document.getElementById('mmm').appendChild(div); */
        
		var div = document.createElement('input');
		div.setAttribute('id','id'+i);
		div.className = "form-control"
		div.innerHTML = document.getElementById('ida').innerHTML;

		document.getElementById('ida').appendChild(div);
		
		var div = document.createElement('input');
		div.className = "form-control"
		div.innerHTML = document.getElementById('pass').innerHTML;

		document.getElementById('pass').appendChild(div);
		
		var div = document.createElement('input');
		div.className = "form-control"
		div.innerHTML = document.getElementById('birtha').innerHTML;

		document.getElementById('birtha').appendChild(div);
		
		var div = document.createElement('input');
		div.className = "form-control"
		div.innerHTML = document.getElementById('namea').innerHTML;

		document.getElementById('namea').appendChild(div);
		
		var div = document.createElement('input');
		div.className = "form-control"
		div.innerHTML = document.getElementById('conta').innerHTML;

		document.getElementById('conta').appendChild(div); 

	}

	function remove_div(obj) {

		document.getElementById('ida').removeChild(obj.parentNode);

	}

	function hoisted(obj) {
		var resident
		
		if ($("#owner").val() == "세대주") {
			resident = "a";

		}else {
			resident ="b";
		}
		resident = aptdong[$("#dong").val()] + $("#ho").val() + resident
		$("#id").val(resident);
		$("#id2").val(resident);
	}

	aptdong = {
		'101' : 'A',
		'102' : 'B',
		'103' : 'C',
		'104' : 'D'
	}

	$(document).ready(function() {
		// 취소
		$(".cencle").on("click", function() {

			location.href = "/login";

		})

		$("#submit").on("click", function() {

			if ($("#dong").val() == "") {
				alert("동을 입력해주세요.");
				$("#dong").focus();
				return false;
			}
			if ($("#ho").val() == "") {
				alert("호를 입력해주세요.");
				$("#ho").focus();
				return false;
			}
			if ($("#owner").val() == "") {
				alert("세대주/원을 입력해주세요.");
				$("#owner").focus();
				return false;
			}
			if ($("#id").val() == "") {
				alert("아이디를 입력해주세요.");
				$("#id").focus();
				return false;
			}
			if ($("#password").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#password").focus();
				return false;
			}
			if ($("#phone").val() == "") {
				alert("연락처를 입력해주세요.");
				$("#phone").focus();
				return false;
			}
			if ($("#birth").val() == "") {
				alert("생년월일을 입력해주세요.");
				$("#birth").focus();
				return false;
			}

		});

	})
</script>
<div class="top_place section_padding">
	<div class="container">
		<form action="resiRegister" method="post">

			<div class="form-group has-feedback">
				<label class="control-label" for="dong">동</label> <select
					class="form-control" onchange="hoisted(this)" id="dong" name="dong">
					<option value="">동선택</option>
					<option value="101">101동</option>
					<option value="102">102동</option>
					<option value="103">103동</option>
					<option value="104">104동</option>
					<option value="105">105동</option>
					<option value="106">106동</option>
					<option value="107">107동</option>
					<option value="108">108동</option>
					<option value="109">109동</option>
				</select>
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="ho">호</label> <select
					class="form-control" onchange="hoisted(this)" type="text" id="ho"
					name="ho">
					<option value="">호선택</option>
					<option value="101">101호</option>
					<option value="102">102호</option>
					<option value="103">103호</option>
					<option value="104">104호</option>

				</select>
			</div>
			
	
			<div class="form-group has-feedback">
				<label class="control-label" for="owner">세대주/원</label> 
				
				<select
					class="form-control" onchange="hoisted(this)" id="owner"
					name="owner">
					<option value="">세대주/세대원 선택</option>
					<option value="세대주">세대주</option>
					<option value="세대원">세대원</option>
				</select>
			</div>
			
			<div id="ida" class="form-group has-feedback">
				<label class="control-label" for="id">아이디</label> <input
					class="form-control" type="text" id="id" name="id" />

			</div>
			<div id="pass" class="form-group has-feedback">
				<label class="control-label" for="password">패스워드</label> <input
					class="form-control" type="password" id="password" name="password" />
			</div>
			<div id="namea" class="form-group has-feedback">
				<label class="control-label" for="name">이름</label> <input
					class="form-control" type="text" id="name" name="name" />
			</div>

			<div id="conta" class="form-group has-feedback">
				<label class="control-label" for="phone">연락처</label> <input
					class="form-control" type="text" id="phone" name="phone" />
			</div>
			<div id="birtha" class="form-group has-feedback">
				<label class="control-label" for="birth">생년월일</label> <input
					class="form-control" type="text" id="birth" name="birth" />
			</div>

			<div class="form-group has-feedback">
				<button class="btn btn-success" type="submit" id="submit">회원가입</button>
				<button class="cencle btn btn-danger" type="button">취소</button>
			</div>
		
			<input type="button" value="추가" onclick="add_div()"><br />


		</form>
	</div>
</div>
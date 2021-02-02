<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
	var i = 0;
	
	function add_div() {
		i++;
		
		//owenr 추가
		var div = document.getElementById('owner');	
		div2 = div.cloneNode(true)
		div2.setAttribute('name', 'list['+i+'].owner')
		document.getElementById('ownera').appendChild(div2);
		
        //id 추가
		var div = document.createElement('input');
		div.setAttribute('id','id'+i); 
		div.className = "form-control cid"
		div.setAttribute('name', 'list['+i+'].id')
		document.getElementById('ida').appendChild(div);
		
		//password
		var div = document.createElement('input');
		div.className = "form-control"
		div.setAttribute('name', 'list['+i+'].password')
		div.setAttribute('type', 'password')
		document.getElementById('pass').appendChild(div);
		
		
		//birth 
		var div = document.createElement('input');
		div.className = "form-control"
		div.setAttribute('name', 'list['+i+'].birth')
		document.getElementById('birtha').appendChild(div);
		
		
		//name 
		var div = document.createElement('input');
		div.className = "form-control"
		div.setAttribute('name', 'list['+i+'].name')
		document.getElementById('namea').appendChild(div);
		
		//연락처
		var div = document.createElement('input');
		div.className = "form-control"
		div.setAttribute('name', 'list['+i+'].phone')
		document.getElementById('conta').appendChild(div); 
		
		
	 	var resident
		var number = 0;
		var length = 3;

		number=number+""//number를 문자열로 변환하는 작업
		var str=""
		for(var a=0;a<length-number.length;a++){
		  str=str+"0";
		}
		str=str+number; 
	
		if ($("#owner").val() == "세대주") {
			resident = "a";

		}else {
			resident ="b";
		}
		resident = aptdong[$("#dong").val()] + $("#ho").val() + resident +str;
				
		
	//	$("#id").val(resident);
		
		var t=1
		for(a of $('.cid'))
		{ 
		  $(a).val(resident+t++)}
	

	}

	function remove_div(obj) {

		document.getElementById('ida').removeChild(obj.parentNode);

	}

	function hoisted(obj) {
	
		
		var resident
		var number = i;
		var length = 4;

		number=number+""//number를 문자열로 변환하는 작업
		var str=""
		for(var a=0;a<length-number.length;a++){
		  str=str+"0";
		}
		str=str+number; 
	
		if ($("#owner").val() == "세대주") {
			resident = "a";

		}else {
			resident ="b";
		}
		resident = aptdong[$("#dong").val()] + $("#ho").val() + resident +str;
						
		
		$("#id").val(resident);
		
		
	
	}

	aptdong = {
		'101' : 'A',
		'102' : 'B',
		'103' : 'C',
		'104' : 'D',
		'105' : 'E',
		'106' : 'F',
		'107' : 'G',
		'108' : 'H',
		'109' : 'I'
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


			<div id= "ownera" class="form-group has-feedback">
				<label class="control-label" for="owner">세대주/원</label> <select
					class="form-control" onchange="hoisted(this)" id="owner"
					name="list[0].owner">
					
					<option value="">세대주/세대원 선택</option>
					<option value="세대주">세대주</option>
					<option value="세대원">세대원</option>
				</select>
			</div>

			<div id="ida" class="form-group has-feedback">
				<label class="control-label" for="id">아이디</label> <input
					class="form-control cid" type="text" id="id" name="list[0].id" />

			</div>
			<div id="pass" class="form-group has-feedback">
				<label class="control-label" for="password">패스워드</label> <input
					class="form-control" type="password" id="password"
					name="list[0].password" />
			</div>
			<div id="namea" class="form-group has-feedback">
				<label class="control-label" for="name">이름</label> <input
					class="form-control" type="text" id="name" name="list[0].name" />
			</div>

			<div id="conta" class="form-group has-feedback">
				<label class="control-label" for="phone">연락처</label> <input
					class="form-control" type="text" id="phone" name="list[0].phone" />
			</div>
			<div id="birtha" class="form-group has-feedback">
				<label class="control-label" for="birth">생년월일</label> <input
					class="form-control" type="text" id="birth" name="list[0].birth" />
			</div>

			<div class="form-group has-feedback">
				<button class="btn btn-success" type="submit" id="submit">회원가입</button>
				<button class="cencle btn btn-danger" type="button">취소</button>
			</div>

			<input type="button" value="추가" onclick="add_div()"><br />


		</form>
	</div>
</div>
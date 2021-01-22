<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
	$(document).ready(function() {
		// 취소
		$(".cencle").on("click", function() {

			location.href = "/login";

		})

		$("#submit").on("click", function() {
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
			if ($("#owner").val() == "") {
				alert("세대주/원을 입력해주세요.");
				$("#owner").focus();
				return false;
			}
			if ($("#auth").val() == "") {
				alert("권한을 입력해주세요.");
				$("#auth").focus();
				return false;
			}
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
			if ($("#del").val() == "") {
				alert("세요.");
				$("#del").focus();
				return false;
			}
			if ($("#type").val() == "") {
				alert("타입을 입력해주세요.");
				$("#type").focus();
				return false;
			}

		});

	})
</script>
<div class="top_place section_padding">
	<div class="container">
		<form action="register" method="post">
			<div class="form-group has-feedback">
				<label class="control-label" for="id">아이디</label> <input
					class="form-control" type="text" id="id" name="id" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="password">패스워드</label> <input
					class="form-control" type="password" id="password" name="password" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="name">이름</label> <input
					class="form-control" type="text" id="name" name="name" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="phone">연락처</label> <input
					class="form-control" type="text" id="phone" name="phone" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="birth">생년월일</label> <input
					class="form-control" type="text" id="birth" name="birth" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="owner">세대주/원</label> <input
					class="form-control" type="text" id="owner" name="owner" />
			</div>

			<div class="form-group has-feedback">
				<label class="control-label" for="auth">권한</label> <input
					class="form-control" type="text" id="auth" name="auth" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="dong">동</label> <input
					class="form-control" type="text" id="dong" name="dong" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="ho">호</label> <input
					class="form-control" type="text" id="ho" name="ho" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="del">델</label> <input
					class="form-control" type="text" id="del" name="del" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="type">타입</label> <input
					class="form-control" type="text" id="type" name="type" />
			</div>

			<div class="form-group has-feedback">
				<button class="btn btn-success" type="submit" id="submit">회원가입</button>
				<button class="cencle btn btn-danger" type="button">취소</button>
			</div>
		</form>
	</div>
</div>
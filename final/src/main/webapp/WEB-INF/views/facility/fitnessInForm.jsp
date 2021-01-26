<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
	<!-- 1~20 // 21~36 -->
	<form action="insertFitness.do">
		<input id="id" name="id" type="hidden" value="${person.id }" /><br>
		<input id="type" name="type" type="hidden" value="fitness" /><br>
		<input id="payNo" name="payNo" type="hidden" value="123" /><br>
		<input name="startDate" id="statDate" type="date"/><br>
		<select name="month" id="month" >
			<option value="1" label="1개월"></option>
			<option value="3" label="3개월"></option>
			<option value="6" label="6개월"></option>
		</select><br>
		가격 : <input name="cost" id="cost"/><br>
		<button>등록</button>
	</form>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.slim.js" integrity="sha256-DrT5NfxfbHvMHux31Lkhxg42LY6of8TaYyK50jnxRnM=" crossorigin="anonymous"></script>

<script type="text/javascript">
	$('#month').on('change',moveCost);
	function moveCost(){
		let month = $(this).val();
		console.log(month);
		if(month == '1'){
			$('#cost').val('6만원')
		}else if(month == '3'){
			$('#cost').val('15만원')
		}else{
			$('#cost').val('25만원')
		}
		
	}
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="payInsert.do" method="post">
		날(월) <input name="payMonth" type="date">
		공용<br>
		일반관리비 : <input name="nomal" value="10"><br>
		청소비 : <input name="clean" value="10"><br>
		경비비 : <input name="guard" value="10"><br>
		소독비 : <input name="disinfection" value="10"><br>
		승강기 : <input name="elevator" value="10"><br>
		전기공용 : <input name="pElectric" value="10"><br>
		수도공용 : <input name="pWater" value="10"><br>
		수선비 : <input name="repair" value="10"><br>
		장기수선 충당금 : <input name="lRepair" value="10"><br>
		입주자 대표회의 운영비 : <input name="representative" value="10"><br>
		<p>-----------------------------------------</p>
		개인<br>
		동호수(세대주ID) : <input name="id" value="test"><br> <!-- select tag -->
		난방 : <input name="heating" value="10"><br>
		수도 : <input name="water" value="10"><br>
		급탕 : <input name="hatWater" value="10"><br>
		전기 : <input name="electric" value="10"><br>
		기타 : <input name="etc" value="10"><br>
		<button>관리비 등록</button>
	</form>
</body>
</html>
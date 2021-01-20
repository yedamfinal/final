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
		날(월) <input name="paymonth" type="date">
		공용<br>
		일반관리비 : <input name="nomal"><br>
		청소비 : <input name="clean"><br>
		경비비 : <input name="guard"><br>
		소독비 : <input name="disinfection"><br>
		승강기 : <input name="elevator"><br>
		전기공용 : <input name="pElectric"><br>
		수도공용 : <input name="pWater"><br>
		수선비 : <input name="repair"><br>
		장기수선 충당금 : <input name="lRepair"><br>
		입주자 대표회의 운영비 : <input name="representative"><br>
		<p>-----------------------------------------</p>
		개인<br>
		동호수(세대주ID) : <input name="payId"><br> <!-- select tag -->
		난방 : <input name="heating"><br>
		수도 : <input name="water"><br>
		급탕 : <input name="hatWater"><br>
		전기 : <input name="electric"><br>
		기타 : <input name="etc"><br>
		<button>관리비 등록</button>
	</form>
</body>
</html>
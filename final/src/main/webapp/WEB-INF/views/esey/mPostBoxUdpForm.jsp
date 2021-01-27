<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>관리자 택배 등록</title>
	
<script src="/resources/jquery/jquery-3.3.1.min.js"></script>

<link rel="stylesheet" href="/resources/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="/resources/bootstrap/bootstrap-theme.min.css">
<script src="/resources/bootstrap/bootstrap.min.js"></script>
	
<style>
	body { font-family:'맑은 고딕', verdana; padding:0; margin:0; }
	ul { padding:0; margin:0; list-style:none;  }
 
	div#root { width:90%; margin:0 auto; }
	
	header#header { font-size:60px; padding:20px 0; }
	header#header h1 a { color:#000; font-weight:bold; }
	
	nav#nav { padding:10px; text-align:right; }
	nav#nav ul li { display:inline-block; margin-left:10px; }
 
 		section#container { padding:20px 0; border-top:2px solid #eee; border-bottom:2px solid #eee; }
	section#container::after { content:""; display:block; clear:both; }
	aside { float:left; width:200px; }
	div#container_box { float:right; width:calc(100% - 200px - 20px); }
	
	aside ul li { text-align:center; margin-bottom:10px; }
	aside ul li a { display:block; width:100%; padding:10px 0;}
	aside ul li a:hover { background:#eee; }
	
	footer#footer { background:#f9f9f9; padding:20px; }
	footer#footer ul li { display:inline-block; margin-right:10px; } 
</style>


<style>
.inputArea { margin:10px 0; }
select { width:100px; }
label { display:inline-block; width:70px; padding:5px; }
label[for='gdsDes'] { display:block; }
input { width:150px; }
textarea#gdsDes { width:400px; height:180px; }
</style>

</head>
<body>
<div id="root">
	<header id="header">
		<div id="header_box">
		<%-- 	<%@ include file="#" %> --%>
		</div>
	</header>

	<nav id="nav">
		<div id="nav_box">
			<%-- <%@ include file="../include/nav.jsp" %> --%>
		</div>
	</nav>
	
	<section id="container">
		<aside>
			<%-- <%@ include file="../include/aside.jsp" %> --%>
		</aside>
		<div id="container_box">
			<h2>상품 등록</h2>
			
<form role="form" method="post" autocomplete="off">

<div class="inputArea">	
	<label>동</label>

	<label>호수</label>
</div>

<div class="inputArea">
	<label for="gdsName">번호</label>
	<input type="text" id="postNo" name="postNo" />
</div>

<div class="inputArea">
	<label for="gdsPrice">택배상품</label>
	<input type="text" id="arriveDate" name="arriveDate" />
</div>

<div class="inputArea">
	<label for="gdsStock">수령시간 </label>
	<input type="text" id="getTime" name="getTime" />
</div>

<div class="inputArea">	
	<label>수령여부</label>
	<select class="category1">
		<option value="">수령전</option>
		<option value="">수령후</option>
	</select>
</div>

<div class="inputArea">
	<button type="submit" id="register_Btn" class="btn btn-primary">등록</button>
</div>

</form>
			
		</div>
	</section>

	<footer id="footer">
		<div id="footer_box">
			<%-- <%@ include file="../include/footer.jsp" %> --%>
		</div>		
	</footer>

</div>

<script>
// 컨트롤러에서 데이터 받기
var jsonData = JSON.parse('${category}');
console.log(jsonData);

var cate1Arr = new Array();
var cate1Obj = new Object();

// 1차 분류 셀렉트 박스에 삽입할 데이터 준비
for(var i = 0; i < jsonData.length; i++) {
	
	if(jsonData[i].level == "1") {
		cate1Obj = new Object();  //초기화
		cate1Obj.cateCode = jsonData[i].cateCode;
		cate1Obj.cateName = jsonData[i].cateName;
		cate1Arr.push(cate1Obj);
	}ㅉ
}

</script>
</body>
</html>












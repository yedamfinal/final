<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>후보자 등록</h1>
글번호 : <input id="seq"><br>
id : <input id="id"><br>
<button id="inPerson" onclick="App.inPerson()">후보자 등록</button><br><br>
<h1>투표</h1>
글번호 : <input id="seq2"><br>
후보자 번호 : <input id="num"><br>
<button id="btnVote" onclick="App.btnVote()">후보자 투표</button><br><br>
<h1>결과보기</h1>
글번호 : <input id="seq3"><br>
<button id="voteResult" onclick="App.voteResult()">결과보기</button><br>
투표결과 : <input id="voteResultInput"><br>
<script src="https://cdn.jsdelivr.net/gh/ethereum/web3.js@1.0.0-beta.37/dist/web3.min.js"></script>
<script src="resources/js/vote/abi.js"></script>
<script src="resources/js/vote/index.js"></script>
</body>
</html>
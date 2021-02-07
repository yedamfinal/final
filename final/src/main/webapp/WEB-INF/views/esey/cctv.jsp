<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
	<div>
		<h1>cctv</h1>
	</div>
	<div>
		
			<div id="video_pane" style="margin: auto; border: 1px solid black; display: table;">
          
        <img id="img1" class="video-image" alt="video" src="/shot.jpg?rnd=547278" style="visibility: visible;"><img id="img2" class="video-image" style="display: block; z-index: -1; visibility: visible; margin-top: -576px;" alt="video" src="/shot.jpg?rnd=569550"></div>
		
		<button class="btn btn-outline-secondary" onclick="location.href='http://192.168.0.25:8080/browserfs.html'">앞마당</button>
		<button class="btn btn-outline-secondary" onclick="location.href='http://192.168.0.2:33773/browserfs.html'">놀이터</button>
		</div>		
	</div>
</body>
</html>
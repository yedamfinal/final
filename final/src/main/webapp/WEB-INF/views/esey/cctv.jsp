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
 <style>
      #video1 {
      /*   border: 10px solid #e17055; */
       /*  border-radius: 30px; */
        
        outline: none;
       /*  position: absolute; */
        /* top: 40%;
        left: 10%; */
        left: 10%;
      }
      #video2 {
     /*    border: 10px solid #6ab04c;
        border-radius: 30px; */
        
        
        position: absolute;
        /* top: 40%;
        left: 50%; */
        left: 60%;
      }
    </style>

<body>


	<div class="container">
	<div>
		<h1>cctv</h1>
	</div>
		 	<video
     		 src="./videos/Gaulois.mp4"
      		width="500px"
      		height="360px"
     		controls
      		autoplay
      		loop
      		id="video1"></video>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <video
      src="./videos/Gaulois2.mp4"
      width="500px"
      height="360px"
      controls
      autoplay
      loop
      id="video2"
    ></video>
		
	
	<div>
		
			<div id="video_pane" style="margin: auto; border: 1px solid black; display: table;">
          
        <img id="img1" class="video-image" alt="video" src="/shot.jpg?rnd=547278" style="visibility: visible;"><img id="img2" class="video-image" style="display: block; z-index: -1; visibility: visible; margin-top: -576px;" alt="video" src="/shot.jpg?rnd=569550"></div>
		
		<button class="btn btn-outline-secondary" onclick="location.href='http://192.168.0.25:8080/browserfs.html'">앞마당</button>
		<button class="btn btn-outline-secondary" onclick="location.href='http://192.168.0.2:33773/browserfs.html'">놀이터</button>
		</div>		
	</div>
</body>
</html>
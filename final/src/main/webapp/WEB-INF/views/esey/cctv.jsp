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
	</div><!-- 
		 	<video
     		 src="blob:https://my.ivideon.com/69475694-9783-467f-b64b-d559a89e204f"
      		width="500px"
      		height="360px"
     		autoplay
      		
      		id="video1"></video>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <video
      src="blob:https://my.ivideon.com/e1499914-29f3-4faa-a704-eca7626c786c"
      width="500px"
      height="360px"
      controls
      autoplay
      loop
      id="video2"
    ></video> -->
		
	
	<div>
		
			<!-- <div id="video_pane" style="margin: auto; border: 1px solid black; display: table;"> -->
          
       <!--  <img id="img1" class="video-image" alt="video" src="/shot.jpg?rnd=547278" style="visibility: visible;"><img id="img2" class="video-image" style="display: block; z-index: -1; visibility: visible; margin-top: -576px;" alt="video" src="/shot.jpg?rnd=569550"></div>
		 -->
		<button class="btn btn-outline-secondary" onclick="javascript:window.open('http://192.168.1.70:8080/browserfs.html',
  'newWindow','width=1000px, height=500px');">앞마당</button>
  
  <button class="btn btn-outline-secondary" onclick="javascript:window.open('http://192.168.1.78:33773/browserfs.html',
  'newWindow','width=1600px, height=900px');">뒷마당</button>
		<button class="btn btn-outline-secondary" onclick="OpenWin_variety('http://192.168.1.78:33773/browserfs.html','창이름',width=1000px, height=500px,'150','100')">놀이터</button>
		</div>	
		


			
	</div>
</body>
</html>
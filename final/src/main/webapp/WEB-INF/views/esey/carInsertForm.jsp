<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div class="container-fluid">
      <div class="row d-flex d-md-block flex-nowrap wrapper">
        <main id="main" class="col-md-9 float-left col pl-md-5 pt-3 main">
          <div class="page-header mt-3">
            <h2>입주자 차량 등록</h2>
          </div>
          <hr>
          <form action="userJoinAction.reservation" method="POST" class="pt-3" style="max-width:720px;">
          	<input type="hidden" id="Id" name="Id" value="${person.id}">
		    <div>
		   		<label>동</label>
		   		<input type="text" class="form-control-plaintext" id="dong" value ="${person.dong}">
		    </div>
		    <div>
		      <label>호수</label>
		     <input type="text" class="form-control-plaintext" id="ho" value ="${person.ho}">
		     </div> 
            <div class="form-group">
              <label>차량번호</label>
              <input name="carNum" type="text" id="carNum" placeholder="차량번호를 입력하세요.">
            </div>
            <div class="form-group">
              <label>차종</label>
              <select class="form-control" id="carType">
              		<option>소형</option>
        			<option>중형</option>
        			<option>대형</option>
              </select>
            </div>
           <button type="submit" class="btn btn-primary float-right">등록</button>
          </form>
        </main>
      </div>
    </div>
  </body>
</html>
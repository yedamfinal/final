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
        
          <div class="page-header mt-3">
            <h2>입주자 차량 등록</h2>
          </div>
          <hr>
         		<form action="carInsert.do" method="post">
			<input type="hidden" id="Id" name="Id" value="${person.id}">
			<table class="table">
				<tr>
					<th width="100">동</th>
					<td width="300"><input type="text" id="dong" name="dong" value="${person.dong}">
					</td>
					<th width="100">호수</th>
					<td width="300"><input type="text" id="ho" name="ho" value="${person.ho}">
					</td>
				</tr>
				<tr>
					<th width="100">차량번호</th>
					<td width="300"><input type="text" id="carNum" name="carNum"></td>
				</tr>
				<tr>
					<th width="100">  <label>차종</label> 
					<td width="300">
					<div class="form-group">
					<select class="form-control" id="carType" name="carType">
              			<option value='S'>소형</option>
        				<option value='M'>중형</option>
        				<option value='L'>대형</option>
             			 </select>
             			 </div>
					</td>
				</tr>
			
			</table>
			<button type="submit" class="btn btn-primary float-right">등록</button>
			</form>
            </div>
         
      </div>
  
  </body>
</html>
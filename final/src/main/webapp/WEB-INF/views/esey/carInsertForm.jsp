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
            <h2>입주자 차량 신청</h2>
          </div>
          <hr>
         		<form action="carInsert.do" method="post" onsubmit='return checkPlate'>
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
              			<option value='S' <c:if test="${vo.carType eq 'S'}">selected</c:if>>소형</option>
        				<option value='M' <c:if test="${vo.carType eq 'M'}">selected</c:if>>중형</option>
        				<option value='L' <c:if test="${vo.carType eq 'L'}">selected</c:if>>대형</option>
             			 </select>
             			 </div>
					</td>
				</tr>
			
			</table>
			<button type="submit" class="btn btn-primary float-right" >신청하기</button>
			</form>
            </div>
         
      </div>
  
  </body>
  <script type="text/javascript">
 	
  
 /*  function checkPlate() {
	  var carc = checkplat();
	  
	  if(carc == false) {
		  alert("차량번호 양식이 틀렸습니다.")
		  return false;
	  }else if(carc == true) {
		  return true
	  }
	  
  }
   */
   function checkPlate (){
	   
	var value = carNum.value;	   
   var NSValue = value.replace(/ /gi, "");
   var region = NSValue.substring(0, 2);
   
   var checkRegion = "서울,부산,대구,인천,대전,광주,울산,제주,경기,강원,충남,충북,전남,전북,경남,경북";
   var arrCheckRegion = checkRegion.split(',');
   
   for(var i = 0; i < arrCheckRegion.length; i++){
    if(region==arrCheckRegion[i]){
     NSValue = NSValue.substring(2, NSValue.length);
     break;
    }
   }
   
   var typeOfCar = Number(NSValue.substring(0, 2));
   
   if(isNaN(typeOfCar) || typeOfCar <= 0){
	  alert("차량번호 양식이 틀렸습니다.")
    return false;
   }
   
   var use = NSValue.substring(2, 3);
   var checkUse = "가,나,다,라,마,"
       +"거,너,더,러,머,버,서,어,저,"
       +"고,노,도,로,모,보,소,오,조,"
       +"구,누,두,루,무,부,수,우,주,"
       +"바,사,아,자,"
       +"배,"
       +"허,하,호,"
       +"국,합,육,해,공";
   var arrCheckUse = checkUse.split(',');
   var resultUse = 0;
   
   for(var j = 0; j < arrCheckUse.length; j++){
    if(use==arrCheckUse[j]){
     resultUse = 1;
     break;
    }
   }
   
   if(resultUse == 0){ 
	   alert("차량번호 양식이 틀렸습니다.")
	   return false;
   }
   
   
   var serialNumber = NSValue.substring(3, value.length);
   
   if(isNaN(serialNumber) || serialNumber < 1000){
	   alert("차량번호 양식이 틀렸습니다.")
	   return false;
   }
 
   return true;
  }

</script>

</html>
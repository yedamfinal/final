<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
        <style>
            /*datepicker에서 사용한 이미지 버튼 style적용*/
            img.ui-datepicker-trigger {
                margin-left:5px; vertical-align:middle; cursor:pointer;
}
        </style>
        <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
        <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
        <!-- datepicker 한국어로 -->
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
        <script>
        $(function() {
            
            
            //오늘 날짜를 출력
            $("#today").text(new Date().toLocaleDateString());

            //datepicker 한국어로 사용하기 위한 언어설정
            $.datepicker.setDefaults($.datepicker.regional['ko']); 
            
            // 시작일(fromDate)은 종료일(toDate) 이후 날짜 선택 불가
            // 종료일(toDate)은 시작일(fromDate) 이전 날짜 선택 불가

            //시작일.
            $('#startDate').datepicker({
                showOn: "both",                     // 달력을 표시할 타이밍 (both: focus or button)
                buttonImage: "images/calendar.gif", // 버튼 이미지
                buttonImageOnly : true,             // 버튼 이미지만 표시할지 여부
                buttonText: "날짜선택",             // 버튼의 대체 텍스트
                dateFormat: "yy-mm-dd",             // 날짜의 형식
                changeMonth: true,                  // 월을 이동하기 위한 선택상자 표시여부
                //minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
                onClose: function( selectedDate ) {    
                    // 시작일(fromDate) datepicker가 닫힐때
                    // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                    $("#startDate").datepicker( "option", "minDate", selectedDate );
                }                
            });

            //종료일
            $('#endDate').datepicker({
                showOn: "both", 
                buttonImage: "images/calendar.gif", 
                buttonImageOnly : true,
                buttonText: "날짜선택",
                dateFormat: "yy-mm-dd",
                changeMonth: true,
                //minDate: 0, // 오늘 이전 날짜 선택 불가
                onClose: function( selectedDate ) {
                    // 종료일(toDate) datepicker가 닫힐때
                    // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
                    $("#startDate").datepicker( "option", "maxDate", selectedDate );
                }                
            });
        });
    </script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form>
  <fieldset >
    <legend>방문자 차량등록</legend>
    <div class="form-group row">
      <label for="staticEmail" class="">동</label>
        <input type="text" class="form-control-plaintext" id="dong" placeholder="Ex)101">
      </div>
      <div>
    <label for="staticEmail" class="">호수</label>
        <input type="text" class="form-control-plaintext" id="ho" placeholder="Ex)1015">
      </div> 
   
    <div class="form-group">
      <label for="exampleInputEmail1">차량번호</label>
      <input type="email" class="form-control" id="carNum" aria-describedby="emailHelp" placeholder="Ex)24거 2567">
      <small id="emailHelp" class="form-text text-muted">차량번호를 정확히 등록하세요 ! </small>
    </div>
     <div class="form-group">
          <label for="startDate">시작일</label>
          <input type="text" name="startDate" id="startDate">
          ~
          <label for="endDate">종료일</label>
          <input type="text" name="endDate" id="endDate">
       </div>   
    <div class="form-group">
      <label for="exampleSelect1">방문차량수</label>
      <select class="form-control" id="exampleSe">
        <option>1</option>
        <option>2</option>
        <option>3</option>
        <option>4</option>      
      </select>
    </div>
    <div class="form-group">
      <label for="exampleTextarea">방문목적</label>
      <div>
      <textarea class="form-control" id="exampleTextarea" cols="100" rows="3"></textarea>
      </div>
    </div>
    </fieldset>
</form>
</body>
</html>
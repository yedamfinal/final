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
                showOn: "both",                     // 달력을 표시할 타이밍 (both: focus or button)		             // 버튼 이미지만 표시할지 여부
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
    
    
</head>
<body>
<div class="container">
		<div>
			<h1>방문자차량등록</h1>
		</div>
		<div>
		<form action="visitCarInsert.do" method="post">
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
					<th width="100">방문목적</th>
					<td width="300"><textarea id="purpose" name="purpose"
							style="width: 500px; height: 200px;"></textarea></td>
				</tr>
				<tr>
					<th width="100">입차일</th>
					<td width="300"><input type="date" id="startDate"
						name="startDate"></td>
				</tr>
				<tr>
					<th width="100">출차일</th>
					<td width="300"><input type="date" id="endDate" name="endDate">
					</td>
				</tr>
			</table>
			<div align="right">
				<button type="submit" class="btn btn-outline-secondary">신청하기</button>
				&nbsp;&nbsp;&nbsp;
				<button type="button" class="btn btn-outline-secondary" onclick="location.href='visitList.do'">목록보기</button>
				&nbsp;&nbsp;&nbsp;
			</div>
			</form>
		</div>
	</div>
</body>
</html>
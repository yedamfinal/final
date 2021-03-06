<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

    <title>FullCalendar Example</title>
    
    <link rel="stylesheet" href="resources/vendor/css/fullcalendar.min.css" />
    <link rel="stylesheet" href="resources/vendor/css/bootstrap.min.css">
    <link rel="stylesheet" href='resources/vendor/css/select2.min.css' />
    <link rel="stylesheet" href='resources/vendor/css/bootstrap-datetimepicker.min.css' />

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

    <link rel="stylesheet" href="resources/css/main.css">
</head>
<body>
	 <div class="container">
        <!-- 일자 클릭시 메뉴오픈 -->
        <div id="contextMenu" class="dropdown clearfix">
            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
                style="display:block;position:static;margin-bottom:5px;">
                <li><a tabindex="-1" href="#">등록</a></li>
                <li class="divider"></li>
                <li><a tabindex="-1" href="#" data-role="close">Close</a></li>
            </ul>
        </div>

        <div id="wrapper" align="center">
            <div id="loading"></div>
            <div id="calendar" style="width:80%"></div>
        </div>


        <!-- 일정 추가 MODAL -->
        <div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                   		 <h4 class="modal-title"></h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                    </div>
                    <div class="modal-body">
						<div class="row" style="display: none;">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-allDay">하루종일</label>
                                <input class='allDayNewEvent' id="edit-allDay" type="checkbox" checked="checked">
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-title">일정명</label>
                                <input class="inputModal" type="text" name="edit-title" id="edit-title"
                                    required="required" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-start">시작</label>
                                <input class="inputModal" type="text" name="edit-start" id="edit-start" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-end">끝</label>
                                <input class="inputModal" type="text" name="edit-end" id="edit-end" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-color">색상</label>
                                <select class="inputModal" name="color" id="edit-color">
                                    <option value="#D25565" style="color:#D25565;">빨간색</option>
                                    <option value="#9775fa" style="color:#9775fa;">보라색</option>
                                    <option value="#ffa94d" style="color:#ffa94d;">주황색</option>
                                    <option value="#74c0fc" style="color:#74c0fc;">파란색</option>
                                    <option value="#f06595" style="color:#f06595;">핑크색</option>
                                    <option value="#63e6be" style="color:#63e6be;">연두색</option>
                                    <option value="#a9e34b" style="color:#a9e34b;">초록색</option>
                                    <option value="#4d638c" style="color:#4d638c;">남색</option>
                                    <option value="#495057" style="color:#495057;">검정색</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-desc">설명</label>
                                <textarea rows="4" cols="50" class="inputModal" name="inputModal"
                                    id="edit-desc"></textarea>
                                <input type="hidden" id="calendarno" name="calendarno">
                            </div>
                        </div>
                        
                    </div>
                    <div class="modal-footer modalBtnContainer-addEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        <c:if test="${person.type=='m' or person.auth=='yes'}">
                        	<button type="button" class="btn btn-primary" id="save-event">저장</button>
                        </c:if>
                    </div>
                    <div class="modal-footer modalBtnContainer-modifyEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        <c:if test="${person.type=='m' or person.auth=='yes'}">
							<button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
	                        <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
						</c:if>
                        
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->

        <!-- /.filter panel -->
        
    </div>
    <!-- /.container -->
	<script type="text/javascript">
	var auth = '${person.type }'
	var auth2 = '${person.auth }'
		</script>
    <script src="resources/vendor/js/jquery.min.js"></script>
    <script src="resources/vendor/js/bootstrap.min.js"></script>
    <script src="resources/vendor/js/moment.min.js"></script>
    <script src="resources/vendor/js/fullcalendar.min.js"></script>
    <script src="resources/vendor/js/ko.js"></script>
    <script src="resources/vendor/js/select2.min.js"></script>
    <script src="resources/vendor/js/bootstrap-datetimepicker.min.js"></script>
    <script src="resources/js/main.js"></script>
    <script src="resources/js/addEvent.js"></script>
    <script src="resources/js/editEvent.js"></script>
    <script src="resources/js/etcSetting.js"></script>
</body>
</html>
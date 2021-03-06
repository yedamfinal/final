var eventModal = $('#eventModal');
var modalTitle = $('.modal-title');
var editCalendarno = $('#calendarno');
var editAllDay = $('#edit-allDay');
var editTitle = $('#edit-title');
var editStart = $('#edit-start');
var editEnd = $('#edit-end');
var editType = $('#edit-type');
var editColor = $('#edit-color');
var editDesc = $('#edit-desc');

var addBtnContainer = $('.modalBtnContainer-addEvent');
var modifyBtnContainer = $('.modalBtnContainer-modifyEvent');


/* ****************
 *  새로운 일정 생성
 * ************** */
var newEvent = function (start, end, eventType) {

    $("#contextMenu").hide(); //메뉴 숨김

    modalTitle.html('새로운 일정');
    editType.val(eventType).prop('selected', true);
    editTitle.val('');
    editStart.val(start);
    editEnd.val(end);
    editDesc.val('');
    
    addBtnContainer.show();
    modifyBtnContainer.hide();
    eventModal.modal('show');


    //새로운 일정 저장버튼 클릭
    $('#save-event').unbind();
    $('#save-event').on('click', function () {

        var eventData = {
            calendarno: editCalendarno.val(),
            title: editTitle.val(),
            start: editStart.val(),
            end: editEnd.val(),
            description: editDesc.val(),
            username: 'admin',
            backgroundColor: editColor.val(),
            textColor: '#ffffff',
            allDay: true
        };

        if (eventData.start > eventData.end) {
            alert('끝나는 날짜가 앞설 수 없습니다.');
            return false;
        }

        if (eventData.title === '') {
            alert('일정명은 필수입니다.');
            return false;
        }

        var realEndDay;

        if (editAllDay.is(':checked')) {
            eventData.start = moment(eventData.start).format('YYYY-MM-DD');
            //render시 날짜표기수정
            realEndDay = moment(eventData.end).format('YYYY-MM-DD');
            eventData.end = moment(eventData.end).add(1, 'days').format('YYYY-MM-DD');
             
            //DB에 넣을때(선택)
			eventData.endDate = realEndDay;
            eventData.allDay = true;
        }

       
        eventModal.find('input, textarea').val('');
        eventModal.modal('hide');

		
        //새로운 일정 저장
        $.ajax({
            type: "post",
            url: "calendarInsert.do",
            data: eventData,
            success: function (response) {
                 eventData.calendarno = response.calendarno;
                 
                 $("#calendar").fullCalendar('renderEvent', eventData, true);
				alert("등록되었습니다.")
            }
        });
    });
};
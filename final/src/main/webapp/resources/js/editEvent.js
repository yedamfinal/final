/* ****************
 *  일정 편집
 * ************** */
var editEvent = function (event, element, view) {
	console.log(event);
    $('#deleteEvent').data('id', event._id); //클릭한 이벤트 ID

    $('.popover.fade.top').remove();
    $(element).popover("hide");

    if (event.allDay === true) {
        editAllDay.prop('checked', true);
    } else {
        editAllDay.prop('checked', false);
    }

    if (event.end === null) {
        event.end = event.start;
    }

    if (event.allDay === true && event.end !== event.start) {
        editEnd.val(moment(event.end).subtract(1, 'days').format('YYYY-MM-DD HH:mm'))
    } else {
        editEnd.val(event.end.format('YYYY-MM-DD HH:mm'));
    }

    modalTitle.html('일정 수정');
    editCalendarno.val(event.calendarno);
    editTitle.val(event.title);
    editStart.val(event.start.format('YYYY-MM-DD HH:mm'));
    editType.val(event.type);
    editDesc.val(event.description);
    editColor.val(event.backgroundColor).css('color', event.backgroundColor);

    addBtnContainer.hide();
    modifyBtnContainer.show();
    eventModal.modal('show');

    //업데이트 버튼 클릭시
    $('#updateEvent').unbind();
    $('#updateEvent').on('click', function () {
	
        if (editStart.val() > editEnd.val()) {
            alert('끝나는 날짜가 앞설 수 없습니다.');
            return false;
        }

        if (editTitle.val() === '') {
            alert('일정명은 필수입니다.')
            return false;
        }

        var statusAllDay;
        var startDate;
        var endDate;
        var displayDate;

        if (editAllDay.is(':checked')) {
            statusAllDay = true;
            startDate = moment(editStart.val()).format('YYYY-MM-DD');
            endDate = moment(editEnd.val()).format('YYYY-MM-DD');
            displayDate = moment(editEnd.val()).add(1, 'days').format('YYYY-MM-DD');
        } else {
            statusAllDay = false;
            startDate = editStart.val();
            endDate = editEnd.val();
            displayDate = endDate;
        }

        eventModal.modal('hide');

        event.allDay = statusAllDay;
        event.title = editTitle.val();
        event.start = startDate;
        event.end = displayDate;
        event.type = editType.val();
        event.backgroundColor = editColor.val();
        event.description = editDesc.val();
        
        /******** 임시 RAMDON ID - 실제 DB 연동시 삭제 **********/
	    var eventId = 1 + Math.floor(Math.random() * 1000);
	    /******** 임시 RAMDON ID - 실제 DB 연동시 삭제 **********/
        
        var eventData = {
            _id: eventId,
            title: editTitle.val(),
            start: editStart.val(),
            end: editEnd.val(),
            description: editDesc.val(),
            username: 'admin',
            backgroundColor: editColor.val(),
            textColor: '#ffffff',
            allDay: true
        };

        $("#calendar").fullCalendar('updateEvent', event);

        //일정 업데이트
        $.ajax({
            type: "post",
            url: "calendarUpdate.do",
            data: eventData,
            success: function (response) {
                alert('수정되었습니다.')
            }
        });

    });
};

// 삭제버튼
$('#deleteEvent').on('click', function () {
    
    $('#deleteEvent').unbind();
    $("#calendar").fullCalendar('removeEvents', $(this).data('id'));
    eventModal.modal('hide');
	
	/******** 임시 RAMDON ID - 실제 DB 연동시 삭제 **********/
	var eventId = 1 + Math.floor(Math.random() * 1000);
	/******** 임시 RAMDON ID - 실제 DB 연동시 삭제 **********/
        
    var eventData = {
            _id: eventId,
            title: editTitle.val(),
            start: editStart.val(),
            end: editEnd.val(),
            description: editDesc.val(),
            username: '관리자',
            backgroundColor: editColor.val(),
            textColor: '#ffffff',
            allDay: true
    };
	
    //삭제시
    $.ajax({
        type: "post",
        url: "calendarDelete.do",
        data: eventdata,
        success: function (response) {
            alert('삭제되었습니다.');
        }
    });

});
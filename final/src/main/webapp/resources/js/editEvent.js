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
		
		var eventData = {
            calendarno: editCalendarno.val(),
            title: editTitle.val(),
            startDate: editStart.val(),
            endDate: editEnd.val(),
            description: editDesc.val(),
            username: 'admin',
            backgroundColor: editColor.val(),
            textColor: '#ffffff',
            allDay: true
        };
		
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
        var realEndDay;

        if (editAllDay.is(':checked')) {
            eventData.start = moment(eventData.start).format('YYYY-MM-DD');
            //render시 날짜표기수정
            eventData.end = moment(eventData.end).add(1, 'days').format('YYYY-MM-DD');
            //DB에 넣을때(선택)
            realEndDay = moment(eventData.end).format('YYYY-MM-DD');

            eventData.allDay = true;
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
		        
        

        
		console.log(eventData);
        //일정 업데이트
        $.ajax({
            type: "post",
            url: "calendarUpdate.do",
            data: eventData,
            success: function (response) {
             	eventData.calendarno = response.calendarno;
                $("#calendar").fullCalendar('updateEvent', event, true);
                alert('수정되었습니다.')
            }
        });

    });
};

// 삭제버튼
$('#deleteEvent').on('click', function () {
    
    $("#calendar").fullCalendar('removeEvents', $(this).data('id'));
    eventModal.modal('hide');
	
	
    
	
    //삭제시
    $.ajax({
        type: "post",
        url: "calendarDelete.do",
        data: {
        	calendarno: editCalendarno.val()
        },
        success: function (response) {
         	alert('삭제되었습니다.');
        }
    });

});
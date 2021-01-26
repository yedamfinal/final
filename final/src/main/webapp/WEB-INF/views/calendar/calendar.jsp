<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>

<!-- datepicker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link href='resources/css/main.css' rel='stylesheet' />
<link href='resources/css/main.min.css' rel='stylesheet' />
<script src='resources/js/main.js'></script>
<script src='resources/js/main.min.js'></script>
<script src='resources/js/locales-all.js'></script>
<script src='resources/js/locales-all.min.js'></script>

<!-- custom -->
<link href="resources/css/schedule.css" rel="stylesheet" />	
<script src="resources/js/schedule.js" type="text/javascript"></script>
<script>

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
	
    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
      },
      //initialDate: '2020-09-12',
      locale: "ko",
      navLinks: true, // can click day/week names to navigate views
      businessHours: true, // display business hours
      editable: true,
      selectable: true,
      events: [
        {
          title: 'businessHours',
          start: '2021-01-26T13:00:00',
          constraint: 'businessHours'
        },
        {
          title: 'availableForMeeting',
          start: '2021-01-28T11:00:00',
          constraint: 'availableForMeeting', // defined below
          color: '#257e4a'
        },
        {
          title: 'Conference',
          start: '2020-09-18',
          end: '2020-09-20'
        },
        {
          title: 'Party',
          start: '2020-09-29T20:00:00'
        },

        // areas where "Meeting" must be dropped
        {
          groupId: 'availableForMeeting',
          start: '2020-09-11T10:00:00',
          end: '2020-09-11T16:00:00',
          display: 'background'
        },
        {
          groupId: 'availableForMeeting',
          start: '2020-09-13T10:00:00',
          end: '2020-09-13T16:00:00',
          display: 'background'
        },

        // red areas where no events can be dropped
        {
          start: '2021-09-24',
          end: '2020-09-28',
          overlap: false,
          display: 'background',
          color: '#ff9f89'
        },
        {
          start: '2020-09-06',
          end: '2020-09-08',
          overlap: false,
          display: 'background',
          color: '#ff9f89'
        }
      ]
    });

    calendar.render();
    
  });

</script>
</head>

<body>
<div class="container">

  <div id='calendar' style="position : relative;">
  <div>
	<div>
		<button class = "add-button" type = "button" onclick="click_add();">일정 추가</button>
    </div>
    </div>	
  </div>
  <div>
		<button class = "add-button" type = "button" onclick="click_add();">일정 추가</button>
    </div>
  
</div>
<script>
function click_add() {
	var url = "schedulePopup.do";
	var name = "schedulePopup";
	var option = "width = 600, height = 600 left = 100, top=50,location=no";
	window.open(url,name,option)
};
</script>
</body>
</html>

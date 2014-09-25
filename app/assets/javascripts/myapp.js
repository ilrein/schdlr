var ready;
ready = function() {

  // initialize the calendar

  var calendar = $('#calendar');

  calendar.fullCalendar({
    theme: true,
    buttonIcons : {
      prev: 'left-single-arrow',
      next: 'right-single-arrow'
    },
    header: {
      left: 'prev, today, next',
      center: "title",
      right: ''
    }
  });

  calendar.fullCalendar('changeView', "agendaWeek");

  // next week

  $('#nextWeek').on('click', function(){
    calendar.fullCalendar('next');     
  });

  // last week

  $('#lastWeek').on('click', function(){
    calendar.fullCalendar('prev');     
  });

}

$(document).ready(ready);
$(document).on('page:load', ready);

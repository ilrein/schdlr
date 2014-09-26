var ready;

ready = function() {

  // initialize the header

  $('.top').sidebar('show');
    

  // initialize the calendar

  var calendar = $('#calendar');
  
   // special options

   calendar.fullCalendar({
    allDaySlot: false,
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

// make it weekly, with hours visible

calendar.fullCalendar('changeView', "agendaWeek");


}

$(document).ready(ready);
$(document).on('page:load', ready);

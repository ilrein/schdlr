var ready;
ready = function() {

  // initialize the calendar

  var calendar = $('#calendar');

  calendar.fullCalendar({
    buttonIcons : {
      prev: 'left-single-arrow',
      next: 'right-single-arrow'
    },
    header: {
      left: 'prev',
      center: "title",
      right: 'prev, next'
    }
    
  });


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

var ready;

ready = function() {

  // initialize the header

  $('.ui.sidebar').sidebar({
    exclusive: false
  });

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

// creating individual cells

$('tbody td .ui-widget-content').prepend("<div class='slot'></div>")
.append("<div class='slot'></div>")
.append("<div class='slot'></div>")
.append("<div class='slot'></div>")
.append("<div class='slot'></div>")
.append("<div class='slot'></div>")
.append("<div class='slot'></div>");

var rows = [];

// drawing a shift

var drawing = false;

$('#drawshift').click(function(e){
  if (drawing === false) {
    e.preventDefault();  
    $(this).addClass('black');
    $('#drawmenu').addClass('inverted');
    $('#drawshifttext').text("Stop Drawing");
    $('tbody').css('cursor', 'crosshair');  
    drawing = true;
  } else {
    e.preventDefault();  
    $(this).removeClass('black');
    $('#drawmenu').removeClass('inverted');
    $('#drawshifttext').text("Start Drawing");
    $('tbody').css('cursor', 'auto');  
    drawing = false;
  }
});




}

$(document).ready(ready);
$(document).on('page:load', ready);

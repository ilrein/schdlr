var ready;

ready = function() {

  // initialize the header

  $('.ui.sidebar').sidebar({
    exclusive: false
  });

  $('.top').sidebar('show');
  
  //$("#welcome_box").draggable();

  $("#welcome_txt").textillate();
  
};

$(document).ready(ready);
$(document).on('page:load', ready);

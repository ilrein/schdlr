var ready;

ready = function() {

  // initialize the header

  $('.ui.sidebar').sidebar({
    exclusive: false
  });

  $('.top').sidebar('show');
  
  // create view models for Knockout

};

$(document).ready(ready);
$(document).on('page:load', ready);

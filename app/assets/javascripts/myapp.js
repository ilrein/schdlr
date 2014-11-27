var ready;

ready = function() {

  // initialize the header

  $('.ui.sidebar').sidebar({
    exclusive: false
  });

  $('.top').sidebar('show');
  
  //$("#welcome_box").draggable();

  function animateTitle(){
    $("#welcome_txt").textillate({ 
      in: { 
        effect: 'tada'
      }
    });  
  };

};

$(document).ready(ready);
$(document).on('page:load', ready);
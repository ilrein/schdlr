var ready;

ready = function() {

  // initialize the header

  $('.ui.sidebar').sidebar({
    exclusive: false
  });

  $('.top').sidebar('show');
  
  //$("#welcome_box").draggable();

  function animLearnMoreBtn () {
    $("#learn_more_btn").textillate({
      initialDelay: 2.5,
      in: {
        effect: 'fadeInUpBig'
      }
    });
  };

  function hideWelcomeBox() {
    $("#welcome_box").fadeOut();
  };

  function hideLoginBox() {
    $("#login_box").fadeOut();
  };

  function showLearningPage() {
    $.ajax({
      url: "learn_more"
    }).done(function(data){
      alert(data);
    });
  };

  $("#welcome_txt").textillate({ 
    autoStart: true,
    initialDelay: 2.5,
    loop: false,
    in: { 
      delay: 5,
      effect: 'fadeInLeftBig',
      callback: animLearnMoreBtn()
    }
  }); 

  $('#learn_more_btn').on("click", function(){
    hideWelcomeBox();
    hideLoginBox();
    showLearningPage();

  });


};

$(document).ready(ready);
$(document).on('page:load', ready);
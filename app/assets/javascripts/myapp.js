var ready;

ready = function() {

  //$("#welcome_box").draggable();

  hideLearningBox();

  function animLearnMoreBtn () {
    $("#learn_more_btn").textillate({
      initialDelay: 2.5,
      in: {
        effect: 'fadeInUpBig'
      }
    });
  };

  function hideWelcomeBox() {
    TweenMax.to($('#welcome_box'), 4.5,
     {css:{alpha:0,display:''}}, {css:{alpha:1}});
  };

  function hideLoginBox() {
    TweenMax.to($('#login_box'), 4.5, 
      {css:{alpha:0,display:''}}, {css:{alpha:1}});
  };

  function hideLearningBox () {
   TweenMax.to($('#learn_more_box'), 4.5, 
    {css:{alpha:0,display:''}}, {css:{alpha:1}});
 };

 function showLearningBox () {
   TweenMax.to($('#learn_more_box'), 4.5, 
    {css:{alpha:1,display:''}}, {css:{alpha:1}});

   // TweenLite.to($("#learn_more_box"), 
   //  2, {
   //    y:100, ease:Cubic.easeOut
   //  });
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

});


};

$(document).ready(ready);
$(document).on('page:load', ready);
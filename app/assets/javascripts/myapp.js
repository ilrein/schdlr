var ready;

ready = function() {

  // initialize the header

  $('.ui.sidebar').sidebar({
    exclusive: false
  });

  $('.top').sidebar('show');
  
  // create view models for Knockout

  function personViewModel() {
    this.firstName = ko.observable("John");
    this.lastName = ko.observable("Smith");
    this.checkout = function() {
      console.log("Check me out baby");
    }
  };

  ko.applyBindings(new personViewModel());

}

$(document).ready(ready);
$(document).on('page:load', ready);

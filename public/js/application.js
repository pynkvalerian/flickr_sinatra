$(document).ready(function() {

  $("form#log_in").toggle();
  $("button#log_in").click(function(){
    $("form#log_in").toggle();
  });

  $("form#register").toggle();
  $("button#register").click(function(){
    $("form#register").toggle();
  });

  $("form#new_album").toggle();
  $("button#new_album").click(function(){
    $("form#new_album").toggle();
  });

});

$(document).ready(function () {
  $('#ask-question').on("click", function(e){
    e.preventDefault();
    $(this).fadeOut(700, function(){
    })
    setTimeout(function(){
      $('#new-question-form').fadeIn(700, function(){
      })
    }, 700)
  })
  $('#main-top').on("click", "#SPAM", function(e){
    e.preventDefault();
    var title = $('input[name="title"').val();
    var description = $('input[name="description"').val();
    var uri = $('form').attr("action");
    $.ajax({url: uri, type: "POST", data: {title, description}}).done(function(response){
      console.log(response);
    })
  })

});

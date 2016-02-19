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
    var title = $('input[name="title"]').val();
    var description = $('input[name="description"]').val();
    var uri = $('form').attr("action");
    $.ajax({url: uri, type: "POST", context: this, data: {title, description}}).done(function(response)
    {
      var response = JSON.parse(response);
      $('#foot').animate({top: 0}, 1000, function(){
      //animation happens here
      })
      setTimeout(function(){
        var source = $('#new-question-template').html();
        var template = Handlebars.compile(source);
        var html = template(response);
        $(html).hide().prependTo('.list-group').fadeIn("slow");
        $('#foot').animate({top: -397}, 1000, function(){
        //animation happens here
        })
      }, 1000)
      setTimeout(function(){
        $('input[name="title"').val("");
        $('input[name="description"').val("");
      }, 1500)
    })
  })
  $('.list-group').on("click", '#up-vote', function(e){
    e.preventDefault();
    var uri = $(this).parent().parent().find("a").attr("href") + "/votes"
    $.ajax({url: uri, type: "POST", context: this}).done(function(response){
      var badge = $(this).parent().parent().find("span.badge");
      $(badge).css("color", "yellow");
      $(badge).text(response);
    })
  })
});

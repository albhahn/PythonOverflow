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
  $('#questions-page').on("click", '.commentable', function(e){
    e.preventDefault();
    var source = $('#new-comment-template').html();
    var template = Handlebars.compile(source);
    var html = template();
    var showComment = $(this).next();
    var uri = "../" + $(this).attr("id") + "/comments"
    var parentDiv = $(this).parent().parent()
    // console.log(div.find('#answer-comments'))
    $(this).fadeOut(700, function(){
    })
    setTimeout(function(){
      $(html).hide().prependTo(showComment).fadeIn("slow");
    }, 700)
    $('#questions-page').on("click", "#SPAM", function(e){
      e.preventDefault();
      var text = $('input[name="text"]').val();
      $.ajax({url: uri, type: "POST", context: this, data: {text: text}}).done(function(response){
        if (uri.indexOf("question") > -1){div = '#question-comments'}
        else if (uri.indexOf("answer") > -1)
        {
          parentDiv = parentDiv.parent().parent()
          div = parentDiv.find("#answer-comments")
        }
        $(response).hide().prependTo(div).fadeIn("slow");
        $('input[name="text"]').val("");
      })
    })
  })
});

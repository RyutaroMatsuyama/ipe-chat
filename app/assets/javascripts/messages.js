$(function() {
  $(".chat-container").on("click",".delete-btn", function() {
    var url = this.href
    $.ajax({
      type:'DELETE',
      dataType:'json',
      url: url,
      processData: false,
      contentType: false,
    })
    .done(function(message){
      $(".message-box[data-message-id="+ message.id+"]").remove();
    })
    .fail(function(){
      alert('error');
    })
  })
});

$(function() {
  $(".chat-container").on("click", ".edit-btn", function() {
    var messageId = this.id;
    var messageContent = $('#js-comment-'+messageId);
    var messageTextArea = $('#js-textarea-'+messageId);
    var messageUpdateButton = $('#js-update-'+messageId);
    $(messageContent).hide();
    $(messageTextArea).show();
    $(messageUpdateButton).show();
  })
});


$(function(){
  $(".chat-container").on("click",".update-btn",function(e){
    e.preventDefault();
    var messageId = this.id.replace('js-update-','');
    var messageTextArea = $('#js-textarea-'+messageId);
    var content = messageTextArea.val();
    var url = "http://192.168.99.101:3000/messages/" + messageId ;
    $.ajax({
        url: url,
        type: 'PATCH',
        data: {
          message:{content:content}
        },
        dataType: 'json',
    })
    .done(function(message){
      var messageId = message.id;
      var messageContent = $('#js-comment-'+messageId);
      var messageTextArea = $('#js-textarea-'+messageId);
      var messageUpdateButton = $('#js-update-'+messageId);
      messageContent.show();
      messageContent.text(message.content);
      messageTextArea.hide();
      messageUpdateButton.hide();
    })
    .fail(function() {
      alert('error');
    })
  })
})



$(function() {
    function buildHTML(message) {
        var content = (message.content !== null) ? `${ message.content }`: "";
        var name = (message.user_name !== null) ? `${ message.user_name }`: "";
        var date = (message.date !== null) ? `${ message.date }`: "";
        var id = (message.id !== null) ? `${ message.id }`: "";
        var image = (message.image !== "") ? `<p><img class="picture" src="${message.image}"></p>`:"";
        var btn = (message.user_id == message.current_user_id) ? `<div class="message-right">
                                                                        <ul>
                                                                            <li>
                                                                                <a class="edit-btn" id=${id} data-remote="true" href="/messages/${id}/edit">edit</a>
                                                                            </li>
                                                                            <li>
                                                                                <a class="delete-btn" data-remote="true" rel="nofollow" data-method="delete" href="/messages/${id}">delete</a>
                                                                            </li>
                                                                        </ul>
                                                                  </div>` : "";
        var html = `<div class="message-box" data-message-id="${ id }">
                     <div class="message-left">
                      <p class="message-info">
                        ${name}
                        <span>
                          ${date}
                        </span>
                      </p>
                      ${image}
                      <p class="message-content" id="js-comment-${id}">${content}</p>
                      <form class="edit-form" action="/messages" data-remote="true" method="post">
                       <input name="utf8" type="hidden" value="✓">
                       <input type="hidden" name="authenticity_token">
                       <textarea style="display:none" class="edit-content" id="js-textarea-${id}" name="message[content]">${content}</textarea>
                       <input type="submit" name="commit" value="UPDATE" style="display:none" class="update-btn" id="js-update-${id}" >
                      </form>
                     </div>
                     ${btn}
                    </div>`
        return html;
    }

    $('#new_message').on('submit', function(e) {
        e.preventDefault();
        var messageContent= new FormData(this);
        var url = "/messages";
        $.ajax({
            url: url,
            type: 'POST',
            data: messageContent,
            dataType: 'json',
            processData: false,
            contentType: false,
        })

        .done(function(message) {
            $('#chat-form').val('');
            $('.image-form').val('');
            var html = buildHTML(message);
            $('.chat-container').append(html);
            $('.chat-container').scrollTop($('.chat-container')[0].scrollHeight);
        })

        .fail(function() {
            alert('error');
        })
        return false;
    });

    var reloadMessages = function(message) {
      if ($(window.location).attr('pathname') == '/'
      || $(window.location).attr('pathname') == '/messages/index'　
      || $(window.location).attr('pathname') == '/users/'+'1'+'/messages'
      || $(window.location).attr('pathname') == '/users/'+'2'+'/messages'
      || $(window.location).attr('pathname') == '/users/'+'3'+'/messages'
      || $(window.location).attr('pathname') == '/users/'+'4'+'/messages'
      || $(window.location).attr('pathname') == '/users/'+'5'+'/messages'){
        var last_message_id = $('.message-box:last').data('message-id');
        var url = "/api/messages";
        $.ajax({
          url:url,
          type:'Get',
          dataType:'json',
          data: {
            last_message:last_message_id
          }
        })

        .done(function(messages){
          var html = '';
          $(messages).each(function(i, message) {
            html = buildHTML(message);
            $('.chat-container').append(html);
             $('.chat-container').scrollTop($('.chat-container')[0].scrollHeight);
          })
        })

        .fail(function(){
          alert('error');
        })
      } else {
        clearInterval
      }
    }
  setInterval(reloadMessages, 5000);
})






$(function() {
    var boxes = $('.message-box')
    boxes.each(function(i, box) {
        $(box).hover(function() {
            var content = $(box).find('.message-content')
            content.animate({fontSize : '24px'}, 500);
        }, function() {
            var content = $(box).find('.message-content')
            content.animate({fontSize : '16px'}, 500);
        })
    })
});


$(function(){
  var form = $("#chat-form")
  form.on("keyup", function(){
    var count = $(this).val().length;
    $('#counter').text(count+"文字");
    if (count>10){
      $('#counter').css('color', 'red');
    }else{
      $('#counter').css('color', 'white');
    }
  })
});



$(function() {
  var button = $("#remove-btn");
  function clickFunc(){
    $("img").toggle();
  };
  button.on("click", clickFunc)
});

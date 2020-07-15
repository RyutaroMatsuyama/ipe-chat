window.onload = function() {
    var deleteBtn = document.getElementsByClassName("delete-btn");

    for (var i = 0; i < deleteBtn.length; i++) {
        deleteBtn[i].addEventListener("click", function(e) {
            e.preventDefault();

            if(window.confirm('本当に削除しますか？')) {
                document.getElementById('form_' + this.dataset.id).submit();
            }

        }, false)
    }
};


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


$(function() {
  var button = $("#remove-btn");
  function clickFunc(){
    $("img").toggle();
  };
  button.on("click", clickFunc)
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

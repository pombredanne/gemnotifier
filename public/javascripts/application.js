$(function(){
  
  $("a.sub_btn").live('click', function(){
    if(!logged_in) {
      alert("You must login to subscribe");
      return;
    }
    var gem_id = $(this).attr("rel");
    var gem_ele = $(this).parent();
    $(this).hide();
    gem_ele.find('span.subscribing').show();
    $.ajax({
       type: "POST",
       url: "/subscribe",
       data: { gem_id: gem_id },
       success: function(response) {
         gem_ele.replaceWith(response);
       }
     });
     return false;
  });
  
  $("a.unsub_btn").live('click', function(){
    if(!logged_in) {
      alert("You must login to subscribe");
      return;
    }
    var gem_id = $(this).attr("rel");
    var gem_ele = $(this).parent();
    $(this).hide();
    gem_ele.find('span.unsubscribing').show();
    $.ajax({
       type: "POST",
       url: "/unsubscribe",
       data: { gem_id: gem_id },
       success: function(response) {
         gem_ele.replaceWith(response);
       }
     });
     return false;
  });
  
  $("#subscribe_btn").live('click', function(){
    if(!logged_in) {
      alert("You must login to subscribe");
      return;
    }
    var gem_id = $(this).attr('rel');
    $(this).css('background-color', '#999');
    $(this).val('Subscribing...');
    var ele = $(this);
    $.ajax({
      type: 'POST',
      url: '/subscribe',
      data: { gem_id: gem_id },
      success:function() {
        ele.attr('id', 'unsubscribe_btn');
        ele.css('background-color', '#1a6184');
        ele.val('Unsubscribe');
      }
    });
    return false;
  });
  
  $("#unsubscribe_btn").live('click', function(){
    if(!logged_in) {
      alert("You must login to subscribe");
      return;
    }
    var gem_id = $(this).attr('rel');
    $(this).css('background-color', '#999');
    $(this).val('Unsubscribing...');
    var ele = $(this);
    $.ajax({
      type: 'POST',
      url: '/unsubscribe',
      data: { gem_id: gem_id },
      success:function() {
        ele.attr('id', 'subscribe_btn');
        ele.css('background-color', '#1a6184');
        ele.val('Subscribe');
      }
    });
    return false;
  });
  
});
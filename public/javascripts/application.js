$(function(){
  
  $("a.sub_btn").live('click', function(){
    if(!logged_in) {
      alert("You must login to subscribe");
      return
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
  });
  
  $("a.unsub_btn").live('click', function(){
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
  });
  
});
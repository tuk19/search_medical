jQuery(document).on("turbolinks:load", function(){
  $("#user_menu_box").on("click", (function(){
      var $get_id = $("#user_menu_bar");
      if($get_id.hasClass("opened")){
          $get_id.css("display", "none");
          $get_id.removeClass("opened");
      }else{
          $get_id.css("display", "flex");
          $get_id.addClass("opened");
      }
  }))
})

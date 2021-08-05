jQuery(document).on("turbolinks:load", function(){
  $("#user_menu_box").on("click", (function(){
      let $get_id = $("#user_menu_bar");
      if($get_id.hasClass("opened")){
          $get_id.css("display", "none");
          $get_id.removeClass("opened");
      }else{
          $get_id.css("display", "flex");
          $get_id.addClass("opened");
      }
  }))

  $("#medicalstaff_menu_box").on("click", (function(){
    let $get_id = $("#medicalstaff_menu_bar");
    let $hamburger = $("#medicalstaff_hamburger")
    let $menu_close = $("#medicalstaff_menu_close")
    if($get_id.hasClass("opened")){
        $get_id.css("display", "none");
        $get_id.removeClass("opened");
        $hamburger.css("display", "block");
        $menu_close.css("display", "none")
    }else{
        $get_id.css("display", "flex");
        $get_id.addClass("opened");
        $hamburger.css("display", "none");
        $menu_close.css("display", "block")
    }
  }))
})

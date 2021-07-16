jQuery(document).on("turbolinks:load", function() {
  $(".institution_index_tbody_tr").on('click', function() {
      window.location = $(this).data("href");
  });
});

// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "jquery"
import "packs/jquery.jpostal.js"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

jQuery(document).on("turbolinks:load", function() {
  $('#institution_postcode').jpostal({
    postcode : [
      '#institution_postcode'
    ],
    address: {
      "#institution_prefecture": "%3",
      "#institution_address_city"   : "%4%5",
      "#institution_address_street" : "%6%7"
    }
  });
});

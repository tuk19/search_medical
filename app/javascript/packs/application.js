// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import '@fortawesome/fontawesome-free/js/all';
import "channels"
import "jquery"
import "packs/jquery.jpostal.js"
import "packs/institutions.js"
import "packs/menu.js"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

jQuery(document).on("turbolinks:load", function() {
  $('#institution_postcode_text').jpostal({
    postcode : [
      '#institution_postcode_text'
    ],
    address: {
      "#institution_prefecture": "%3",
      "#institution_city_text"   : "%4%5",
      "#institution_street_text" : "%6%7"
    }
  });
});

require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");
require("stylesheets/custom.scss");

import "bootstrap/dist/js/bootstrap";
import "bootstrap/dist/css/bootstrap";
import "@fortawesome/fontawesome-free/css/all";

$(document).on("turbolinks:load", function () {
  window.addEventListener("scroll", function () {
    var header = document.querySelector("nav");
    header.classList.toggle("sticky", window.scrollY > 0);
  });
});

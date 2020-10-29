require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");

import "bootstrap/dist/js/bootstrap";
import "bootstrap/dist/css/bootstrap";
require("stylesheets/custom.scss");

$(document).on("turbolinks:load", function () {
  window.addEventListener("scroll", function () {
    var header = document.querySelector("nav");
    header.classList.toggle("sticky", window.scrollY > 0);
  });
});

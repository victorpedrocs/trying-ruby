// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require materialize-sprockets
//= require moment

var reset_form, toast_notice;
var TOAST_TIME = 2000;
( function($) {
  $(".button-collapse").sideNav();
  Turbolinks.enableProgressBar();
})(jQuery);

reset_form = function( form ) {
  $(form).children('input').val('');
}

toast_notice = function() {
  notice = $('input#notice').val();
  if( notice != '' ) {
    Materialize.toast( notice, TOAST_TIME );
  }
};

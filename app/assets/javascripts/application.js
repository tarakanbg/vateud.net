// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.flexslider
//= require bootstrap
//= require fullcalendar
//= require gcal
//= require bootstrap-sortable
//= require jquery.easing
//= require_tree ./frontend




// $(document).ready(function(){
//   setInterval(function() {
//     if ($("#feature_slider").hasClass("disabled")){
//       // $('#feature_slider').fadeOut();
//       $("#feature_slider").removeClass("disabled");
//       // $("#pagination li").removeClass("active");


//     }
//   }, 8000);
// });


jQuery(parent).trigger('initialize:frame');

// jQuery(window).on('mercury:ready', function() {
//   Mercury.saveUrl = '/pages';
// });

$(document).ready(function() {
    $('#calendar').fullCalendar({
        events: {
            url: 'http://www.google.com/calendar/feeds/4mmstomhihc2tt4p4utu8eqbdqesse67%40import.calendar.google.com/public/basic',
            className: 'eud-event',           // an option!
            currentTimezone: 'Zulu' // an option!
        },
        timeFormat: 'HH(:mm)',
        firstDay: 1
    });
});

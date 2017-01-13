// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
$(document).ready(function() {
   var boats = ($('#tracker-boats').data('trackers'));
   var job = ($('#tracker-job').data('trackers')); 
   console.log(boats[0].name);
   console.log(job);
   $(".update-job-btn").on("ajax:complete", function() {
   	   console.log("Hello world");
	   var boats = ($('#tracker-boats').data('trackers'));
	   var job = ($('#tracker-job').data('trackers')); 
	   console.log(boats[1].name);
	   console.log(job);
	   // var newdiv = $("<div></div>");
	   // newdiv.addClass("new-boat-list"); 
	   // for (var i = 0; i < boats.length; i++) {
	   //   var newtext = $("<p></p>");
	   //   newtext.innerHTML = boats[i].name;
	   //   newtext.appendTo(".new-boat-list");
	   //  } 
   //$(".boat-list").replaceWith($(".new-boat-list"));
   })
   // $("update-job-btn").on("ajax:complete", function(event) {
   //   $(event.target).hide();
   // $(event.target).prev.addClass("available").html("Available");
   // });
})


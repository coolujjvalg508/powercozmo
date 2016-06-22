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
//= require jquery-ui
//= require jquery.validate
//= require custom_script
//= require bootstrap
//= require bootsy
//= require jquery.selectric
//= require classie
//= require cbpAnimatedHeader
//= require owl.carousel
//= require responsive-carousel
//= require customize-controls
//= require common-page
//= require script
//= require bootstrap-datetimepicker
//= require TimeCircles
//= require jquery_nested_form
//= require jstz.min
//= require time_zone_detection
// require_directory .

$(document).ready(function(){
  $('.fa-calendar').click(function(){
    $('#buying_request_expiration_date').focus();
  })

  $('#datetimepicker1').datetimepicker({
    format: "dd-mm-yyyy",
    startDate: new Date(),
    pickTime: false,
    minView: 2,
    autoclose: true,
    pickerPosition: "bottom-left"
  });

	$("#buying_request_image").change(function(){
    readURL(this);
	});
  $("#buying_request_attachment").change(function(){
    showAttachment(this);
  });
})

function readURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function (e) {
      $('#buy_image').attr('src', e.target.result);
    }
    reader.readAsDataURL(input.files[0]);
  }
}

function showAttachment(input){
  if (input.files && input.files[0]) {
    fileName = input.files[0].name;
    $('#attachment_name').val(fileName);
  }
}

$(document).ready(function(){
  $(".alert").fadeIn();
  $(".alert").fadeOut(5000);
  if( navigator.userAgent.match(/iPad|iPhone/i) ) {

    $('.modal').on('show.bs.modal', function() {

        // Position modal absolute and bump it down to the scrollPosition
        $(this)
            .css({
                position: 'absolute !important',
                marginTop: $(window).scrollTop() + 'px !important',
                bottom: 'auto'
            });

        // Position backdrop absolute and make it span the entire page
        //
        // Also dirty, but we need to tap into the backdrop after Boostrap 
        // positions it but before transitions finish.
        //
        setTimeout( function() {
            $('.modal-backdrop').css({
                position: 'absolute !important', 
                top: 0, 
                left: 0,
                width: '100%',
                height: Math.max(
                    document.body.scrollHeight, document.documentElement.scrollHeight,
                    document.body.offsetHeight, document.documentElement.offsetHeight,
                    document.body.clientHeight, document.documentElement.clientHeight
                ) + 'px !important'
            });
        }, 0);
    });
}
});

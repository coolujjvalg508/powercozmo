//= require buyer/jQuery-2.2.0.min
//= require jquery_ujs
//= require jquery-ui
//= require jquery.validate
//= require bootsy
// require turbolinks
//= require buyer/bootstrap.min
//= require buyer/fastclick
//= require buyer/app.min
//= require buyer/jquery.sparkline.min
//= require buyer/jquery-jvectormap-1.2.2.min
//= require buyer/jquery-jvectormap-world-mill-en
//= require buyer/jquery.slimscroll.min
//= require buyer/common-page
//= require buyer/customize-selectbox
//= require buyer/demo
//= require buyer/jquery.selectric
//= require bootstrap-datetimepicker
//= require jquery_nested_form
//= require jstz.min
//= require time_zone_detection
// require_tree .

$(document).ready(function(){
  $(".alert").fadeIn();
  $(".alert").fadeOut(30000);
});

$(document).ready(function(element){
  if (window.location.search.indexOf('message_notification=true') > -1) {
    $(".messages-menu .dropdown-toggle").click();
  }
})


$(document).ready(function($) {
  var items = $('.items');
  if(items.length > 1) {
    $("#owl-example").owlCarousel({
        loop:true,
        margin:0,
        nav:true,
        autoplay:true,
        autoplayHoverPause:true,
        items : 1
    });
  }
  else{
    $("#owl-example").owlCarousel({
        loop:false,
        margin:0,
        nav:true,
        autoplay:true,
        autoplayHoverPause:true,
        items : 1
    });
  }

    $("#pr-category").owlCarousel({
      loop:true,
      margin:0,
      nav:true,
      autoplay:true,
      autoplayHoverPause:true,
      items : 4,
      responsiveClass:true,
      responsive:{
        0:{
          items:1
        },
        700:{
          items:3
        },
        1000:{
          items:4
        }
      }
    });

  $("a.user-submenu").click(function(){
      $(".myaccount-menu").toggle();
  });

  location.queryString = {};
  location.search.substr(1).split("&").forEach(function (pair) {
    if (pair === "") return;
    var parts = pair.split("=");
    if(parts[0].indexOf('filter') >= 0 && parts[0].indexOf('category') >= 0){
      location.queryString[decodeURIComponent(parts[0])] = parts[1] &&
        decodeURIComponent(parts[1].replace(/\+/g, " "));
    }
  });
  for(var key in location.queryString)
  {
    element = $('#category_'+location.queryString[key]);
    element.addClass('open');
    element.children('ul').slideDown();
  }
  $("a[disabled]").on('click', function(e){
    console.log('hello');
    e.stopPropagation();
    return false;
  });

  $("#buying_request_brand_id").on('change', function() {
    if($(this).val() == "0"){
      $('#other_manufacturer_name').show();
    }
    else $('#other_manufacturer_name').hide();
  });
  $("#buying_request_category_id").on('change', function() {
    if($(this).val() == "0"){
      $('#buying_request_category_name').show();
    }
    else $('#buying_request_category_name').hide();
  });
  if($("#buying_request_brand_id").val() == "0") $('#other_manufacturer_name').show();
  if($("#buying_request_category_id").val() == '0') $('#buying_request_category_name').show();

  $('.share-menu').hide();
  $('#social-share').on('click', function(){
    $('.share-menu').toggle();
  })

})


$(function() {
  $( "#accordion" ).accordion({
    heightStyle: "content"
  });
  $('#cssmenu>ul>li.has-sub>ul>li.has-sub>a').append('<span class="holder"></span>');
  $(window).resize(function(){
    $("#DateCountdown").TimeCircles().rebuild();
  });
  $(".available_for").TimeCircles({
    "animation": "smooth",
    "bg_width": 0.7,
    "fg_width": 0.03,
    "circle_radius_multiplier": 0.57, //a cutsom argument for initialization .
    // custom fuction for duration, deafult is 'auto'
    // to use it, define data-total-duration in the initialzing element
    "total_duration": "Created_to_Expiry",
    "circle_bg_color": "#F0EDED",
      "time": {
        "Days": {
          "text": "Days",
          "color": "#36ace3",
          "show": true
        },
        "Hours": {
          "text": "Hours",
          "color": "#36ace3",
          "show": true
        },
        "Minutes": {
          "text": "Minutes",
          "color": "#36ace3",
          "show": true
        },
        "Seconds": {
          "text": "Seconds",
          "color": "#36ace3",
           "show": false
        }
      }
  });
  $(".available_for_detail").TimeCircles({
    "animation": "smooth",
    "bg_width": 0.7,
    "fg_width": 0.03,
    "circle_radius_multiplier": 0.7, //a cutsom argument for initialization .
    "total_duration": "Created_to_Expiry",
    "circle_bg_color": "#F0EDED",
      "time": {
        "Days": {
          "text": "Days",
          "color": "#36ace3",
          "show": true
        },
        "Hours": {
          "text": "Hours",
          "color": "#36ace3",
          "show": true
        },
        "Minutes": {
          "text": "Minutes",
          "color": "#36ace3",
          "show": true
        },
        "Seconds": {
          "text": "Seconds",
          "color": "#36ace3",
           "show": false
        }
      }
  });
  $(".available_for, .available_for_detail").css('border-bottom', '1px solid #e5e5e5');
  $(".available_for, .available_for_detail").css('padding-bottom', '16px')
  $(".available_for_detail").css('margin-top','-3px');
});


// hide or show more catagories
function toggleCategory(){
  $('.more_category').toggle();
  if ($('#more_button').text() == 'View More') $('#more_button').text('View less');
  else $('#more_button').text('View More');
  return false;
}

//change form pane in post buying categories
function change_form_pane(){
  $('#myTab li a').eq(1).trigger('click');
  var offset = $('#tab-panel').offset();
  var scrollto = offset.top - $('.navbar').outerHeight();
  $('html, body').animate({scrollTop:scrollto}, 0);
}

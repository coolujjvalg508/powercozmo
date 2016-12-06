//= require seller/jQuery-2.2.0.min
//= require jquery_ujs
//= require jquery-ui
//= require jquery.validate
//= require bootsy
// require turbolinks
//= require seller/bootstrap.min
//= require seller/fastclick
// require seller/app.min
//= require seller/jquery.sparkline.min
//= require seller/jquery-jvectormap-1.2.2.min
//= require seller/jquery-jvectormap-world-mill-en
//= require seller/jquery.slimscroll.min
//= require seller/common-page
//= require seller/customize-selectbox
//= require seller/demo
//= require seller/jquery.selectric
//= require bootstrap-datetimepicker
//= require jquery_nested_form
//= require jstz.min
//= require time_zone_detection
//= require seller/plugins/d3.min
//= require seller/plugins/c3.min
//= require seller/plugins/screenfull
//= require seller/plugins/perfect-scrollbar.min
//= require seller/plugins/waves.min
//= require seller/plugins/jquery.sparkline.min
//= require seller/plugins/jquery.easypiechart.min
//= require seller/plugins/bootstrap-rating.min
//= require seller/app
//= require seller/index.init
//= require owl.carousel
//= require bootstrap-filestyle.min
// require_tree .

$(document).ready(function(){
  $(".alert").fadeIn();
  $(".alert").fadeOut(30000);

  	//js start for auto show hide 
  	if($( "#section_user_guide" ).height() <= 120 ){
		$("#section_user_guide_link").hide();
	}else{
		$("#section_user_guide").addClass('set-right-section-content');
	}

	if($( "#section_how_it_work_for_seller" ).height() <= 120 ){
		$("#section_how_it_work_for_seller_link").hide();
	}else{
		$("#section_how_it_work_for_seller").addClass('set-right-section-content');
	}

	if($( "#section_how_it_work_for_buyer" ).height() <= 120 ){
		$("#section_how_it_work_for_buyer_link").hide();
	}else{
		$("#section_how_it_work_for_buyer").addClass('set-right-section-content');
	}

	if($( "#section_tips_for_seller" ).height() <= 120 ){
		$("#section_tips_for_seller_link").hide();
	}else{
		$("#section_tips_for_seller").addClass('set-right-section-content');
	}

	$(".view-link").click(function(){
		var view = $(this).attr('data-view');
		var reference = $(this).attr('data-reference');

		if(view == 'more'){
			$(this).attr('data-view', 'less');
			$(this).html('View Less');	
			$("#" + reference).removeClass('set-right-section-content');

			if($( "#" + reference ).height() <= 120 ){
				$(this).hide();
			}

		}else{
			$(this).attr('data-view', 'more');
			$(this).html('View More');
			$("#" + reference).addClass('set-right-section-content');	
		}
	});
	//js end for auto show hide 


});

$(document).ready(function(element){
  if (window.location.search.indexOf('message_notification=true') > -1) {
    $(".messages-menu .dropdown-toggle").click();
  }
})

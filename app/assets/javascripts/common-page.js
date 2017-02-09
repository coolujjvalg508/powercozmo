// JavaScript Document
$(document).ready(function(){
    $(".menu-icon").click(function(){
        $("ul").toggle();
    });
	// $(".cont-sellbtn").click(function(){
 //        $("#myModal1").hide();
	// 	$("#myModal2").hide();
	// 	$("#myModal").show();
 //    });
	$(".bidnow-btn").click(function(){
		$("#myModal2").hide();
		$("#myModal").hide();
        $("#myModal1").show();
    });
	$(".buynow-btn").click(function(){
		$("#myModal").hide();
        $("#myModal1").hide();
		$("#myModal2").show();
    });
	$(".close").click(function(){
		$(".modal").hide();
	});

});

/*$(function() {
      $('select, .select').selectric();

      $('.customOptions').selectric({
        optionsItemBuilder: function(itemData, element, index) {
          return element.val().length ? '<span class="ico ico-' + element.val() +  '"></span>' + itemData.text : itemData.text;
        }
      });

      $('.customLabel').selectric({
        labelBuilder: function(currItem) {
          return '<strong><em>' + currItem.text + '</em></strong>';
        }
      });
    });*/

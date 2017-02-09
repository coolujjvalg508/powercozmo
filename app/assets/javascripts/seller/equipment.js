var currentdate = new Date();
var currentDatetime = currentdate.getFullYear()+"-"+(currentdate.getMonth()+1)+"-"+currentdate.getDate()+" "+currentdate.getHours()+":"+currentdate.getMinutes()

$('#datetimepicker1').datetimepicker({
  format: "dd-mm-yyyy HH:ii:ss P",
  showMeridian: true,
  autoclose: true,
  startDate: currentDatetime,
  pickerPosition: "bottom-left"
});

$('select').selectric();
$("select#equipment_category_id,select#equipment_sub_category_id").change(function(e){
	
  $.getJSON("/seller/fetch_categories",{id: $(this).val(), ajax: 'true'}, function(response){
    var options = '';
    for (var i = 0; i < response.length; i++) {
      options += '<option value="' + response[i].id + '">' + response[i].name + '</option>';
    }
    if (e.target.id=="equipment_category_id") {
      var sub_cat = $("#equipment_sub_category_id").val();
      $("select#equipment_sub_category_id").html('<option value="">Select Sub Category</option>'+options+'<option value="0">Other</option>');
      $("select#equipment_sub_category_id").selectric();
      if(sub_cat){
        $('#equipment_sub_category_id option[value='+sub_cat+']').attr('selected', true);
        $("#equipment_sub_category_id").selectric('refresh');
      }
    }
    if (e.target.id=="equipment_sub_category_id") {
      $("select#equipment_sub_sub_category_id").html('<option value="">Select Sub Sub Category</option>'+options+'<option value="0">Other</option>');
      $("select#equipment_sub_sub_category_id").selectric();
    }
  })
})

$("select#equipment_category_type").change(function(e){
	
	$.getJSON("/seller/fetch_categories_by_category_type",{category_type: $(this).val(), ajax: 'true'}, function(response){
		var options = '';
		for (var i = 0; i < response.length; i++) {
		  options += '<option value="' + response[i].id + '">' + response[i].name + '</option>';
		}

		$("select#equipment_category_id").html('<option value="">Select Category</option>'+options+'<option value="0">Other</option>');
		$("select#equipment_category_id").selectric();
		$("select#equipment_sub_category_id").selectric();
		$("select#equipment_sub_sub_category_id").selectric();

	  
    
	})
})

$("ul.equipment_rating_stars li").click(function(e) {
  var rating = parseInt($(this).data("value"))
  $("#equipment_rating").val(rating)
  for (var i = 1; i <= 5; i++) {
    if (rating >= i) {
      $("#equipment_rating_"+i).addClass("filled-star")
    } else{
      $("#equipment_rating_"+i).removeClass("filled-star")
    };
  };
})
$(document).on('nested:fieldAdded', function(event){
  var field = event.field;
  if($("input[type='hidden'][value='false'][id^=equipment_images_attributes_][id$=_destroy]").length >= 4)
  {
    $(".add_nested_fields").hide()
  }

  $("input[type='file'][id^=equipment_images_attributes_][id$=_image]").change(function(){
    var input = this
    readURL(input)
  });
})
$(document).on('nested:fieldRemoved', function(event){
  var field = event.field;
  if($("input[type='hidden'][value='false'][id^=equipment_images_attributes_][id$=_destroy]").length < 4)
  {
    $(".add_nested_fields").show()
  }
})

$("input[type='file'][id^=equipment_images_attributes_][id$=_image]").change(function(){
    var input = this
    readURL(input)
});
function readURL (input) {
  var preview_image_id = input.id.split('_')
  preview_image_id.pop()
  preview_image_id = preview_image_id.join('_')
  var ext = input.files[0]['name'].substring(input.files[0]['name'].lastIndexOf('.') + 1).toLowerCase();
  if (input.files && input.files[0] && (ext == "gif" || ext == "png" || ext == "jpeg" || ext == "jpg")) {
    var reader = new FileReader();
    reader.onload = function (e) {
        $("#"+preview_image_id+"_preview").attr('src', e.target.result);
        $("#"+preview_image_id+"_preview").css({"height":"95%","width":"100%"})
    }
    reader.readAsDataURL(input.files[0]);
  }
}
$(document).ready(function($) {
  //handling switch between eqipment and power plant
  $('.eq_type').on('click', function(){
    toggle_fields($(this).val());
  });
  toggle_fields($('.eq_type:checked').val());
  function toggle_fields(type){
    if(type == "power_plant"){
      $('.eq_total').hide();
      $('#sub_sub_category_select').addClass('hide');
      $('.pp_total').removeClass('hide');
      $('.eq_type_text').text('Power Plant');
      $('#equipment_category_id option:contains(Complete power plant)').attr('selected', true);
      $('#equipment_category_id').change().attr('disabled', 'disabled').selectric('refresh');
      $('#header_name').text('complete plant');
      $('#header_name_edit').text('power plant');
    }
    else if(type == "equipment"){
      $('.eq_total').show();
      $('#sub_sub_category_select').removeClass('hide');
      $('.pp_total').addClass('hide');
      $('.eq_type_text, #header_name_edit').text('Equipment');
      $('#equipment_category_id').attr('disabled', false).selectric('refresh');
      $('#header_name').text('New Equipment');
    }
  }
  //functions for handiling adding new master data dynamically in equipment page
  $("#equipment_manufacturer_id").on('change', function() {
    if($(this).val() == "0"){
      $('#other_manufacturer_name').show();
    }
    else $('#other_manufacturer_name').hide();
  });

  $("#equipment_category_id").on('change', function(){
    if($(this).val() == "0"){
      $('#other_category_name').show();
      //$('#other_category_type').show();
      //$('#other_category_div').show();
      $('#sub_category_select').hide();
      $('#sub_sub_category_select').hide();
    }
    else {
      $('#other_category_name').val('').hide();
      //$('#other_category_type').val('').hide();
      //$('.selectric-equipment-other-field p.label').html('Select Category Type');
      //$('#other_category_div').hide();
      $('#sub_category_select').show();
      $('#sub_sub_category_select').show();
    }
  });

  $("#equipment_sub_category_id").on('change', function(){
    if($(this).val() == "0"){
      $('#other_sub_category_name').show();
      $('#sub_sub_category_select').hide();
    }
    else {
      $('#other_sub_category_name').val('').hide();
      $('#sub_sub_category_select').show();
    }
  });

  $("#equipment_sub_sub_category_id").on('change', function(){
    if($(this).val() == "0"){
      $('#other_sub_sub_category_name').show();
    }
    else $('#other_sub_sub_category_name').val('').hide();
  });

  if($("#equipment_manufacturer_id").val() == "0") $("#other_manufacturer_name").show();
  if($("#equipment_category_id").val() == "0"){
    $("#other_category_name").show();
    //$("#other_category_type").show();
    //$("#other_category_div").show();
    $("#sub_category_select").hide();
    $('#sub_sub_category_select').hide();
  }
  if($("#equipment_sub_category_id").val() == "0"){
    $("#other_sub_category_name").show();
    $("#sub_sub_category_select").hide();
  }
  if($("#equipment_sub_sub_category_id").val() == "0"){
    $("#other_sub_sub_category_name").show();
  }

});

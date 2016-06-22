//= require active_admin/base
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require jquery.validate
//= require bootstrap
//= require bootsy
//= require jquery-ui-timepicker-addon
//= require jstz.min
//= require time_zone_detection

$(document).ready(function() {

  // Admin email messages and notifications count as sub menu of the admin user
  $.ajax({
    type: "GET",
    url: "/admin/super_admins/notifications" ,
    success: function(data){
      // console.log("admin sub menu")
    }
  });

  $('.access-panel input:checkbox').each(function(){
    $(this).click(function(){
      splitVal = $(this).val().split('_');
      if(splitVal[1] == 'write' || splitVal[1] == 'delete'){
        itsRead= $("#admin_user_access_control_attributes_permissions_hash_"+splitVal[0]+"_read")
        if($(this).prop('checked') && !itsRead.prop('checked')){
          $("#admin_user_access_control_attributes_permissions_hash_"+splitVal[0]+"_read").click()
        }
      }
    })
  })

  jQuery('input.hasDatetimePicker').datetimepicker({
    dateFormat: "dd-mm-yy",
    beforeShow: function () {
      setTimeout(
        function () {
          $('#ui-datepicker-div').css("z-index", "3000");
        }, 100
      );
    }
  });

  $("select#equipment_category_id,select#equipment_sub_category_id").change(function(e){
    $.getJSON("/admin/equipment/categories",{id: $(this).val(), ajax: 'true'}, function(response){
      var options = '';
      for (var i = 0; i < response.length; i++) {
        options += '<option value="' + response[i].id + '">' + response[i].name + '</option>';
      }
      if (e.target.id=="equipment_category_id") {
        var sub_cat = $("#equipment_sub_category_id").val();
        $("select#equipment_sub_category_id").html('<option value="">Select Sub Category</option>'+options);
          $('#equipment_sub_category_id option[value='+$('#equipment_sub_cat_id').val()+']').attr('selected', true);
      }
      if (e.target.id=="equipment_sub_category_id") {
        $("select#equipment_sub_sub_category_id").html('<option value="">Select Sub Sub Category</option>'+options);
      }
    })
  })

  $('form#new_equipment, form#edit_equipment').on('click', 'li.has_many_container a.has_many_add', function() {
    if($("input[type='file'][id^=equipment_images_attributes_][id$=_image]").length >= 3)
    {
      $("li.has_many_container a.has_many_add").hide()
    }
  });
  $('form#new_equipment, form#edit_equipment').on('click', 'li.has_many_container a.has_many_remove', function() {
    if($("input[type='file'][id^=equipment_images_attributes_][id$=_image]").length <= 4)
    {
      $("li.has_many_container a.has_many_add").show()
    }
  });

  $('form#new_buying_request, form#edit_buying_request').on('click', 'li.has_many_container a.has_many_add', function() {
    if($("input[type='file'][id^=buying_request_images_attributes_][id$=_image]").length >= 3)
    {
      $("li.has_many_container a.has_many_add").hide()
    }
  });
  $('form#new_buying_request, form#edit_buying_request').on('click', 'li.has_many_container a.has_many_remove', function() {
    if($("input[type='file'][id^=buying_request_images_attributes_][id$=_image]").length <= 4)
    {
      $("li.has_many_container a.has_many_add").show()
    }
  });

  $('.br-info th, .ee-info th').css('width', '30px');
  $('.sub-panel1 .panel_contents').eq(0).find('h3').remove();
  $('.sub-panel2 .panel_contents').eq(0).find('h3').remove();
  $('.sub-panel3 .panel_contents').eq(0).find('h3').remove();


  $('.br-info th').css('width', '30px');
  $('.sub-panel1 .panel_contents').eq(0).find('h3').remove();
  $('.sub-panel2 .panel_contents').eq(0).find('h3').remove();
  $('.sub-panel3 .panel_contents').eq(0).find('h3').remove();


  $("form#new_mailboxer_message #mailboxer_message_recipients").autocomplete({
    source: function( request, response ) {
      $.ajax({
        url: "/admin/messages/autocomplete",
        dataType: "json",
        type : 'Get',
        data: {
          q: request.term
        },
        success: function( data ) {
          response( data );
        }
      });
    },
    minLength: 2,
    change: function(event, ui) {
        if(ui.item === null || !ui.item)
           $(this).val(''); /* clear the value */
    }
  });
  var up_size = 0;
  $('#mailboxer_message_attachment').on('change', function() {
    $("#attachment-filename").remove()
    up_size = (this.files[0].size/1024/1024).toFixed(2);
    var filename = this.files[0].name
    $(this).parent('div').before( "<span id='attachment-filename'>"+filename+"</span>" )
  });

  $.validator.addMethod("attachSize", function(value, element, params) {
    // var up_size = $('form#seller_message_form #mailboxer_message_attachment').get(0).files[0].size;
    // //return up_size <= 32 * 1024 * 1024;
    // up_size = (up_size/1024*1024).toFixed(2)
    return up_size < 32
  });
  $("#new_mailboxer_message").validate({
    debug: true,
    errorElement: 'p',
    errorClass: 'inline-errors',
    ignore: "",
    rules: {
      'mailboxer_message[subject]': {
        required: true,
      },
      'mailboxer_message[body]': {
        required: true,
      },
      'mailboxer_message[recipients]': {
        required: true,
      },
      'mailboxer_message[attachment]': {
        attachSize: true,
      }
    },
    messages:{
      'mailboxer_message[subject]': {
        required: "Subject can't be blank",
      },
      'mailboxer_message[body]': {
        required: "Body can't be blank",
      },
      'mailboxer_message[recipients]': {
        required: "Recipients can't be blank",
      },
      'mailboxer_message[attachment]': {
        attachSize: function() {
          // var up_size = $('form#seller_message_form #mailboxer_message_attachment').get(0).files[0].size;
          // up_size = (up_size/1024*1024).toFixed(2)
          return "The attached file size is "+up_size+"MB but it should not exceed 32MB";
        }
      }
    },
    submitHandler: function(form) {
      //Hack for form submit
      if ($(form).valid())
        form.submit();
      return false; // prevent normal form posting
    }
  })

  $("#reply_mailboxer_message").validate({
    debug: true,
    errorElement: 'p',
    errorClass: 'inline-errors',
    ignore: "",
    rules: {
      'mailboxer_message[body]': {
        required: true
      },
      'mailboxer_message[attachment]': {
        attachSize: true,
      }
    },
    messages:{
      'mailboxer_message[body]': {
        required: "Message can't be blank",
      },
      'mailboxer_message[attachment]': {
        attachSize: function() {
          // var up_size = $('form#seller_message_form #conversation_attachment').get(0).files[0].size;
          // up_size = (up_size/1024*1024).toFixed(2)
          return "The attached file size is "+up_size+"MB but it should not exceed 32MB";
        }
      }
    },
    submitHandler: function(form) {
      //Hack for form submit
      if ($(form).valid())
        form.submit();
      return false; // prevent normal form posting
    }
  })

  $("#edit_enquiry_response").validate({
    debug: true,
    errorElement: 'p',
    errorClass: 'inline-errors',
    ignore: "",
    rules: {
      'enquiry_response[message]': {
        required: true
      }
    },
    messages:{
      'enquiry_response[message]': {
        required: "Message can't be blank",
      }
    },
    submitHandler: function(form) {
      //Hack for form submit
      if ($(form).valid())
        form.submit();
      return false; // prevent normal form posting
    }
  })

})

$(document).ready(function() {
  $('#print-order').click(function(){
    window.print();
  });

  $('input[name="equipment[equipment_type]"]').on('click', function(){
    toggle_fields($(this).val());
  });
  toggle_fields($('input[name="equipment[equipment_type]"]:checked').val());
  function toggle_fields(type){
    if(type == "power_plant"){
      $('#equipment_equipment_model_input, #equipment_condition_input, #equipment_manufacturer_id_input, #equipment_sub_sub_category_id_input,#equipment_manufacture_year_input').hide();
      $('#equipment_power_plant_type_input, #equipment_power_plant_age_input, #equipment_turbine_model_input, #equipment_turbine_manufacturer_name_input').removeClass('hide');
      $('.eq_type_text').text('Power Plant');
      $('#equipment_category_id option:contains(Complete power plant)').attr('selected', true);
      $('#equipment_category_id').change().attr('disabled', 'disabled');
      // var sub_cat = $("#equipment_sub_category_id").val();
      // if(sub_cat){
      //   $('#equipment_sub_category_id option[value='+sub_cat+']').attr('selected', true);
      // }
    }
    else if(type == "equipment"){
      $('#equipment_equipment_model_input, #equipment_condition_input, #equipment_manufacturer_id_input, #equipment_sub_sub_category_id_input').show();
      $('#equipment_power_plant_type_input, #equipment_power_plant_age_input, #equipment_turbine_model_input, #equipment_turbine_manufacturer_name_input').addClass('hide');
      $('.eq_type_text').text('Equipment');
      $('#equipment_category_id').attr('disabled', false);
    }
  }
});

$(document).ready(function() {
  $('#buying_request_attachment').attr('accept','application/pdf');
});

$(document).ready(function() {
  $("#mailboxer_message_body-error").prependTo(".wysihtml5-sandbox").show();;
  $('.just-datetime-picker-time-hour, .just-datetime-picker-time-minute').keypress(function (e) {
   if ($(this).val().length<2){
     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57) ) {
       return false;
     }
   }
   else{
     if (e.which != 8 && e.which != 0 ) {
       return false;
     }
     return true
   }
  });
  if($('.just-datetime-picker-time-hour').parent().hasClass('field_with_errors')){
    $('.just-datetime-picker-time-hour').unwrap();
  }
  if($('.just-datetime-picker-time-minute').parent().hasClass('field_with_errors')){
    $('.just-datetime-picker-time-minute').unwrap();
  }
});
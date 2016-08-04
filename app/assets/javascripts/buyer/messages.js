/*
  The below code is for buyer new message, sent messages and received messages pages.
*/
$('form#remove_buyer_messages_form #buyer_messages_all').click(function(){  
  var check_boxes = $('form#remove_buyer_messages_form .program_ids_active');
  if($(this).prop('checked')==true)
  {
    for(i=0;i<check_boxes.length;i++)
    { 
      check_boxes[i].checked=true;
    }
  }
  else
  {
    for(i=0;i<check_boxes.length;i++)
    {
      check_boxes[i].checked=false 
    } 
  }
  if ($('form#remove_buyer_messages_form .program_ids_active:checked').size() >= 1)
  {
    $('form#remove_buyer_messages_form #delete_buyer_message').show()
  }
  else
  {
    $('form#remove_buyer_messages_form #delete_buyer_message').hide()
  }
})

$('form#remove_buyer_messages_form .program_ids_active').click(function(){
  if ($('form#remove_buyer_messages_form .program_ids_active:checked').size() >= 1)
  {
    $('form#remove_buyer_messages_form #delete_buyer_message').show()
  }
  else
  {
    $('form#remove_buyer_messages_form #delete_buyer_message').hide()
    $('form#remove_buyer_messages_form #buyer_messages_all')[0].checked = false;
  }
})

$('form#remove_buyer_messages_form #delete_buyer_message').click(function(){
  if ($('form#remove_buyer_messages_form .program_ids_active:checked').size() >= 1){
    if (confirm("Are you sure you want to delete?")) {
      $(this).closest('form').submit();
    };
  }
})
  
$("form#buyer_message_form #mailto").autocomplete({
  source: function( request, response ) {
    $.ajax({
      url: "/buyer/messages/autocomplete",
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
  minLength: 2
});

var up_size = 0;
$('form#buyer_message_form #conversation_attachment, form#reply_buyer_message_form #message_attachment').on('change', function() {
  $("#attachment-filename").remove()
  up_size = (this.files[0].size/1024/1024).toFixed(2);
  var filename = this.files[0].name
  $(this).parent('div').before( "<span id='attachment-filename'>"+filename+"</span>" )
});

$.validator.addMethod("attachSize", function(value, element, params) {  
  // var up_size = $('form#buyer_message_form #conversation_attachment').get(0).files[0].size;
  // //return up_size <= 32 * 1024 * 1024;
  // up_size = (up_size/1024*1024).toFixed(2)
  return up_size < 32
});

$("#buyer_message_form").validate({
  debug: true,
  errorElement: 'div',
  errorClass: 'error-msg',
  ignore: "",
  rules: {
    'conversation[subject]': {
      required: true,
    },
    'conversation[body]': {
      required: true,
    },
    'conversation[recipients]': {
      required: true,
    },
    'conversation[attachment]': {
      attachSize: true,
    }
  },
  messages:{
    'conversation[subject]': {
      required: "Subject can't be blank",
    },
    'conversation[body]': {
      required: "Message can't be blank",
    },
    'conversation[recipients]': {
      required: "To can't be blank",
    },
    'conversation[attachment]': {
      attachSize: function() {
        // var up_size = $('form#buyer_message_form #conversation_attachment').get(0).files[0].size;
        // up_size = (up_size/1024*1024).toFixed(2)        
        return "The attached file size is "+up_size+"MB but it should not exceed 32MB";
      }
    }
  },  
  errorPlacement: function(error, element) {
    if (element.attr("name") == "conversation[body]") {
      error.insertAfter(".wysihtml5-sandbox");
    }else{
          error.insertAfter(element);
        }
  },
  submitHandler: function(form) {  
    //Hack for form submit
    if ($(form).valid()) 
      form.submit(); 
    return false; // prevent normal form posting
  }
})

$("#reply_buyer_message_form").validate({
  debug: true,
  errorElement: 'div',
  errorClass: 'error-msg',
  ignore: "",
  rules: {    
    'message[body]': {
      required: true
    },
    'message[attachment]': {
      attachSize: true,
    }
  },
  messages:{    
    'message[body]': {
      required: "Message can't be blank",
    },
    'message[attachment]': {
      attachSize: function() {
        // var up_size = $('form#buyer_message_form #conversation_attachment').get(0).files[0].size;
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

var wrapper = document.getElementById("signature-pad"),
    clearButton = wrapper.querySelector("[data-action=clear]"),
    saveButton = wrapper.querySelector("[data-action=save]"),
    canvas = wrapper.querySelector("canvas"),
    signaturePad;

// Adjust canvas coordinate space taking into account pixel ratio,
// to make it look crisp on mobile devices.
// This also causes canvas to be cleared.
function resizeCanvas() {
    // When zoomed out to less than 100%, for some very strange reason,
    // some browsers report devicePixelRatio as less than 1
    // and only part of the canvas is cleared then.
    var ratio =  Math.max(window.devicePixelRatio || 1, 1);
    canvas.width = canvas.offsetWidth * ratio;
    canvas.height = canvas.offsetHeight * ratio;
    canvas.getContext("2d").scale(ratio, ratio);
}

window.onresize = resizeCanvas;
//resizeCanvas();

setTimeout(function() {
   resizeCanvas();
}, 1000);

$('#nav-resize-btn').click(function(){
	setTimeout(function() {
	   resizeCanvas();
	}, 100);
});


signaturePad = new SignaturePad(canvas);

clearButton.addEventListener("click", function (event) {
    signaturePad.clear();
    $('#signature_err').html('');
    $('#profile_digital_signature_tmp').val('');
    $("#attachment-filename").remove();
});

saveButton.addEventListener("click", function (event) {
    if (signaturePad.isEmpty() && $('#profile_digital_signature_tmp').val() == '') {
        $('#signature_err').html('Please provide signature first');
        
    }
    else if($('#profile_digital_signature_tmp').val() != ''){
		$('#profile_digital_signature').val($('#profile_digital_signature_tmp').val());
		$("#digital_signature_form").submit();
    } 
    else {
		//alert(signaturePad.toDataURL())
		$("#profile_digital_signature").val(signaturePad.toDataURL());
		$("#digital_signature_form").submit();
    }
});

//<![CDATA[
$(window).load(function(){
	function readSignatureURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			
			reader.onload = function (e) {					
				$('#profile_digital_signature_tmp').val(e.target.result);
				//$('#blah').attr('src', e.target.result);
			}
			
			reader.readAsDataURL(input.files[0]);
		}
	}
	
	$("#user_profile_attributes_signature_image").change(function(){
		
		
		  
		
		var x = document.getElementById("user_profile_attributes_signature_image");
		
		$('#signature_err').html('');
		var err = "";
		if ('files' in x) {
			if (x.files.length == 0) {
				err = 'Please select a file';
			} else {

				var file = x.files[0];
				
				$("#attachment-filename").remove();
			  
				
				if ('name' in file) {
					$(this).parent('div').before( "<span id='attachment-filename'>"+file.name+"</span>" );
				}
				
				if ('size' in file) {
					
					if(file.size > 5242880){
						err = 'Maximum 5 MB file size allowed';
					}
					
				}
				if ('type' in file) {
					
					var filetype = file.type;
					filetype = filetype.toLowerCase(); 
					
					if(filetype != 'image/jpeg' && filetype != 'image/jpg' && filetype != 'image/png'){
						
						err = 'Only jpeg, jpg, png file allowed';
					}
				}
			}
		}
		
		if(err == ''){
			readSignatureURL(this);
		}else{
			$('#signature_err').html(err);
		}
	});
});//]]>

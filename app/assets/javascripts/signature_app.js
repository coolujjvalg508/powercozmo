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


signaturePad = new SignaturePad(canvas);

clearButton.addEventListener("click", function (event) {
    signaturePad.clear();
    $('#signature_err').html('');
});

saveButton.addEventListener("click", function (event) {
    if (signaturePad.isEmpty()) {
        $('#signature_err').html('Please provide signature first');
        
    } else {
		//alert(signaturePad.toDataURL())
		$("#profile_digital_signature").val(signaturePad.toDataURL());
		
		$("#digital_signature_form").submit();
    }
});

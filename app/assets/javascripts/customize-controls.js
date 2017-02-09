$(document).ready(function(){
	$cust_lbl='label';$cust_chk='checked';$cust_opt_wrp='.custom-opt';$cust_chk_wrp='.custom-chk';	$cust_input_chk="input[type='checkbox']";
	$cust_input_opt="input[type='radio']";
	$($cust_chk_wrp + ' ' + $cust_lbl + ', ' + $cust_opt_wrp + ' ' + $cust_lbl).each(function(){
		$(this).find('input:checked').parent(this).addClass($cust_chk);
	});
	$(document).on('click',$cust_chk_wrp, function (event) {
		event.preventDefault();
		$(this).find('label.chk-bx').toggleClass($cust_chk);
		checkBox = $(this).find($cust_input_chk)
		checkBox.prop("checked", !checkBox.prop("checked"));
		event.stopImmediatePropagation();
	});
	$(document).on('change',$cust_input_opt, function (event) {
		$($cust_opt_wrp).find(("input:not(:checked)")).parents($cust_lbl).removeClass($cust_chk);
		$(this).parents($cust_lbl).addClass($cust_chk);
		event.stopImmediatePropagation();
	});

});

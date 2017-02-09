$(document).ready(function(){
	$(".custom-select-box").append('<span></span>');
	$(".custom-select-box").each(function()
	{
		$(this).find('span').text($(this).find("select option:selected").text());
	});
	$(document).on('change','.custom-select-box select',function(){
		$selected_val=($(this).val());
		$(this).closest('.custom-select-box').find('span').text($(this).closest('.custom-select-box').find("select option:selected").text());
	});
});

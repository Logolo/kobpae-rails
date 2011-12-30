//= require jquery
//= require jquery_ujs
//= require app
//= require_tree .

/*
Event.observe(window, 'load', function() {
	fadeout.delay(1.5, 'notice');
	fadeout.delay(1.5, 'alert');
});
*/
function show_element(element)
{
	if($('#'+element) == null) { element = 'files_and_folders'; }

	$('#files_and_folders, #permissions, #clipboard').hide()
	$('#'+element).show();

}

function update_counter(element, counter)
{
	$(counter).innerHTML = element.value.length;
	$(counter).style.color = element.value.length > 256 ? '#F00' : '#000';
}

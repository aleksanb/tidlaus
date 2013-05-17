datetime = function() {
	$(".datetime_select").datetimepicker({ dateFormat: 'dd.mm.yy' });
}

$(document).ready(datetime);
$(document).on('page:load', datetime);

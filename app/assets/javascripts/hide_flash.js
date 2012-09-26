$(".flash").hide()
$(".flash").slideToggle('slow')
setTimeout(function() { $(".flash").slideToggle('slow')},4000)
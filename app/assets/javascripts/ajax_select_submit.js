ajax_select = $(function() {
  $(document).on('change', '.edit_attending', function() {
    $('.edit_attending').submit();
  }).on('ajax:success',function(data) {
    alert("The row was successfully updated.");
  }).on('ajax:failure', function() {
    alert("The row was not successfully updated.");
  })
})

$(document).ready(ajax_select);
$(document).on('page:load', ajax_select);


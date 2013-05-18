$(function() {
  $(document).on('change', '.edit_attending', function() {
    $(this).submit();
  }).on('ajax:success',function(data) {
    alert("The row was successfully updated.");
  }).on('ajax:failure', function() {
    alert("The row was not successfully updated.");
  })
});


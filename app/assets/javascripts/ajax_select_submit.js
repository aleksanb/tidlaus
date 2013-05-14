$(function() {
  $(document).on('change', '.edit_attending', function() {
    $('.edit_attending').submit();
  }).on('ajax:beforeSend', function() {
    console.log("sending ajax request");
  }).on('ajax:success',function(data) {
    console.log(data);
    alert("The row was successfully updated.");
  }).on('ajax:failure', function() {
    alert("The row was not successfully updated.");
  }).on('ajax:complete', function() {
  });
});
